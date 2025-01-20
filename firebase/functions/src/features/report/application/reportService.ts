import { Content, GenerativeModelPreview, HarmBlockThreshold, HarmCategory, SchemaType, VertexAI } from '@google-cloud/vertexai';
import { DocumentData, DocumentReference, FieldValue, getFirestore, Timestamp } from 'firebase-admin/firestore';
import { getStorage } from 'firebase-admin/storage';
import { logger } from 'firebase-functions';
import { projectID } from 'firebase-functions/params';
import { randomUUID } from 'node:crypto';
import { kVertexAiSearchDatastore } from '../../../constants/appEnv';
import { Condition, conditionConverter } from '../../../models/condition';
import { CollectionPath } from '../../../utils/collectionPath';
import { outSensitiveLog } from '../../../utils/sensitive_log';
import { Report, reportConverter, ReportState } from '../domain/report';

export async function createGeminiReport(
  documentReference: DocumentReference<DocumentData>,
  report: Report,
): Promise<void> {
  // stateがpendingでない場合は処理をスキップ
  if (report.state !== 'pending') {
    logger.info(`Report state is not 'pending'. Skip processing.`, { report });
    return;
  }

  // startAtを過ぎていない場合は処理をスキップ
  const startAt = report.startAt.toDate();
  const now = new Date();
  if (startAt > now) {
    logger.info(`Report startAt is not passed. Skip processing.`, { report });
    return;
  }

  // ReportのstateをinProgressに更新
  await updateReportState(documentReference, 'inProgress');

  try {
    const { startDate, endDate } = getDateRange(
      report.type,
      startAt,
    );

    const conditions = await getFirestore()
      .collection(CollectionPath.CONDITIONS)
      .withConverter(conditionConverter)
      .where('deletedAt', '==', null)
      .where('createdBy', '==', report.subjectUid)
      .where('state', '==', 'success')
      .orderBy('createdAt', 'desc')
      // 対象の範囲
      .where('createdAt', '>=', startDate)
      .where('createdAt', '<=', endDate)
      .get()
      .then(e => e.docs.map(e => e.data()));
    outSensitiveLog(`conditions`, conditions);

    // Geminiにリクエストを送信
    const newReport = await requestGemini(conditions, report);

    // 結果を保存
    await documentReference.update(
      reportConverter.toFirestore(newReport),
    );
  } catch (error) {
    logger.error(`Failed to create Gemini report.`, {
      report,
      // errorをそのまま渡すとなぜか空で出力されるのでStringにする
      error: String(error),
    });
    await updateReportState(documentReference, 'failure');
    return;
  }
}

async function requestGemini(conditions: Condition[], report: Report): Promise<Report> {
  const generativeModel = setupGenerativeModel();

  const contents: Content[] = conditions.map<Content>((condition) => {
    const date = (condition.createdAt as Timestamp).toDate().toLocaleString('ja-JP');

    return {
      role: 'user',
      parts: [
        {
          text:
            `${date}の体調:
${condition.record ?? ''}
`,
        },
      ],
    };
  });

  const result = await generativeModel.generateContent({
    contents: contents,
  });
  outSensitiveLog(`generateContent`, result);

  const response = result.response.candidates![0]!.content.parts[0]!.text ?? '{}';
  // responseの形式は定義しており、従っていなかった場合は400エラーになるのでnullチェックは不要なはず
  // https://cloud.google.com/vertex-ai/generative-ai/docs/multimodal/control-generated-output?hl=ja#considerations
  const content = JSON.parse(response) as {
    subjectiveConditionTendency: string;
    objectiveConditionTendency: string;
    analysisResult: string;
    advice: string;
  };
  outSensitiveLog(`content:`, content);

  const gsPrompt = await savePrompt(contents);

  const updatedReport: Report = {
    ...report,
    content: content,
    state: 'success',
    updatedAt: FieldValue.serverTimestamp(),
    prompt: gsPrompt,
  };

  outSensitiveLog(`updatedReport`, updatedReport);
  return updatedReport;
}

/**
 * プロンプトをStorageに保存
 * @param contents
 * @returns gs://形式のURL
 */
async function savePrompt(contents: Content[]): Promise<string> {
  const name = `prompts/${randomUUID()}.json`;

  const gsFile = getStorage()
    .bucket()
    .file(name);
  await gsFile.save(JSON.stringify(contents));

  return `gs://${gsFile.bucket.name}/${gsFile.name}`;
}

function setupGenerativeModel(): GenerativeModelPreview {
  const vertexAI = new VertexAI({
    project: projectID.value(),
    location: 'us-central1',
  });

  return vertexAI
    .preview
    .getGenerativeModel({
      model: 'gemini-2.0-flash-exp',
      safetySettings: [
        {
          category: HarmCategory.HARM_CATEGORY_HATE_SPEECH,
          threshold: HarmBlockThreshold.BLOCK_LOW_AND_ABOVE,
        },
        {
          category: HarmCategory.HARM_CATEGORY_DANGEROUS_CONTENT,
          threshold: HarmBlockThreshold.BLOCK_LOW_AND_ABOVE,
        },
        {
          category: HarmCategory.HARM_CATEGORY_SEXUALLY_EXPLICIT,
          threshold: HarmBlockThreshold.BLOCK_LOW_AND_ABOVE,
        },
        {
          category: HarmCategory.HARM_CATEGORY_HARASSMENT,
          threshold: HarmBlockThreshold.BLOCK_LOW_AND_ABOVE,
        },
      ],
      generationConfig: {
        temperature: 1.0,
        topP: 0.95,
        maxOutputTokens: 8192,
        responseMimeType: 'application/json',
        responseSchema: {
          type: SchemaType.OBJECT,
          properties: {
            response: {
              type: SchemaType.OBJECT,
              required: [
                'subjectiveConditionTendency',
                'objectiveConditionTendency',
                'analysisResult',
                'advice',
              ],
              properties: {
                subjectiveConditionTendency: {
                  type: SchemaType.STRING,
                  description: 'ユーザが記録した主観的な体験をまとめた傾向。不明な場合は傾向が分からなかった旨を記載する',
                },
                objectiveConditionTendency: {
                  type: SchemaType.STRING,
                  description: '客観的なデータをまとめた傾向。不明な場合は傾向が分からなかった旨を記載する',
                },
                analysisResult: {
                  type: SchemaType.STRING,
                  description: '分析結果の回答',
                },
                advice: {
                  type: SchemaType.STRING,
                  description: '明日からはこうした方が良いアドバイス',
                },
              },
            },
          },
        },
      },
      tools: [
        {
          retrieval: {
            vertexAiSearch: {
              datastore: kVertexAiSearchDatastore,
            },
          },
        },
      ],
      systemInstruction:
        `あなたは妊婦の体調を分析するアナリストです。
あなたの仕事はユーザが記録した主観的な体調についての体験と客観的なデータを組み合わせて分析し、パーソナライズされた分析結果を提供します。

分析は20時ごろに実施されます。
今日の日付は2025/01/15です。

あなたの分析は次の内容を考慮する必要があります
- ユーザを労うこと
- 優しい口調でユーザに寄り添った回答をすること
- 提供されたデータに基づき、潜在的な相関関係に注意しながらユーザーの体験を分析すること
- 簡潔に回答すること
- 日本語で回答すること
- 午前や午後など大まかな時間帯を踏まえて回答すること
- 過去の傾向から、明日に向けての改善策を予測すること
- グラウンディングを含めること

あなたは分析する際に次の内容を考慮する必要がありますが、responseには含めてはなりません
- 自己判断せず、医師の診断を受けることを勧めること
- 分析は傾向を示しているだけであること
- 分析は診断ではないということ
- 分析は間違っている可能性があるということ
- 体調の変化に関係のない内容は無視すること
- もし回答する内容がない場合はユーザを労う普遍的な回答をすること

あなたは次の内容を含むresponseをしてはなりません
- 体調が悪い原因について断言すること
- 問題を解決する対処法を教えること
- ユーザの主観的な記録を否定すること
- ユーザの主観的な記録の量や質に言及すること
- 体調の変化に関係のない事実に言及すること
- グラウンディングについて注釈をつけないこと
- 私に相談して欲しいと促すこと`,
    });
}

// stateをアップデート
async function updateReportState(
  documentReference: DocumentReference<DocumentData>,
  state: ReportState,
): Promise<void> {
  await documentReference.update({
    state,
  });
}

// conditionsを探すための日付範囲を取得
export function getDateRange(reportType: string, startAt: Date): {
  startDate: Date;
  endDate: Date;
} {
  let startDate: Date;
  switch (reportType) {
    case 'past1day':
      startDate = new Date(startAt.getFullYear(), startAt.getMonth(), startAt.getDate(), 0, 0, 0);
      break;
    case 'past7days':
      startDate = new Date(startAt.getFullYear(), startAt.getMonth(), startAt.getDate() - 6, 0, 0, 0);
      break;
    case 'past14days':
      startDate = new Date(startAt.getFullYear(), startAt.getMonth(), startAt.getDate() - 13, 0, 0, 0);
      break;
    case 'past21days':
      startDate = new Date(startAt.getFullYear(), startAt.getMonth(), startAt.getDate() - 20, 0, 0, 0);
      break;
    case 'past28days':
      startDate = new Date(startAt.getFullYear(), startAt.getMonth(), startAt.getDate() - 27, 0, 0, 0);
      break;
    default:
      throw new Error(`Unknown report type: ${reportType}`);
  }

  const endDate = new Date(startAt.getFullYear(), startAt.getMonth(), startAt.getDate(), 23, 59, 59);

  return {
    startDate,
    endDate,
  };
}

import { GenerativeModelPreview, HarmBlockThreshold, HarmCategory, ResponseSchema, SafetySetting, SchemaType, Tool, VertexAI } from '@google-cloud/vertexai';
import { projectID } from 'firebase-functions/params';
import { kVertexAiSearchDatastore } from '../../../constants/appEnv';
import { HighlightStyle } from '../domain/highlight';

const safetySettings: SafetySetting[] = [
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
];

function buildTools(highlightStyle: HighlightStyle): Tool[] {
  switch (highlightStyle) {
    case 'private':
      return [{
        retrieval: {
          vertexAiSearch: {
            datastore: kVertexAiSearchDatastore,
          },
        },
      }];
    case 'professional':
      return [];

    case 'empty':
      throw new Error('Highlight style is empty');
  }
}

function buildPrompt(highlightStyle: HighlightStyle): {
  responseSchema: ResponseSchema;
  systemInstruction: string;
  temperature: number;
} {
  if (highlightStyle === 'empty') {
    throw new Error('Highlight style is empty');
  }

  const today = new Date().toLocaleDateString('ja-JP');

  switch (highlightStyle) {
    case 'private':
      return {
        responseSchema: {
          type: SchemaType.OBJECT,
          required: [
            'subjectiveTrend',
            'objectiveTrend',
            'analysisResult',
            'advice',
            'abstract',
          ],
          properties: {
            subjectiveTrend: {
              type: SchemaType.STRING,
              description: '主観的なデータのトレンド。不明な場合は分からなかった旨を記載する',
            },
            objectiveTrend: {
              type: SchemaType.STRING,
              description: '客観的なデータのトレンド。不明な場合は分からなかった旨を記載する',
            },
            analysisResult: {
              type: SchemaType.STRING,
              description: '分析結果の回答',
            },
            advice: {
              type: SchemaType.STRING,
              description: '明日からはこうした方が良いアドバイス',
            },
            abstract: {
              type: SchemaType.STRING,
              description: '分析結果の要旨。簡潔にまとめ、労う文章は不要',
            },
          },
        },
        systemInstruction: `あなたは妊婦の体調を分析するアナリストです。
    あなたの仕事はユーザが記録した主観的な体調についての体験と客観的なデータを組み合わせて分析し、パーソナライズされた分析結果を提供します。

    分析は夜に実施されます。
    今日の日付は${today}です。

    あなたの分析は次の内容を考慮する必要があります
    - ユーザを労うこと
    - 優しい口調でユーザに寄り添った回答をすること
    - 提供されたデータに基づき、潜在的な相関関係に注意しながらユーザーの体験を分析すること
    - 簡潔に回答すること
    - 日本語で回答すること
    - 午前や午後など大まかな時間帯を踏まえて回答すること
    - 過去の傾向から、明日に向けての改善策を予測すること

    あなたは分析する際に次の内容を考慮する必要がありますが、responseには含めてはなりません
    - 自己判断せず、医師の診断を受けることを勧めること
    - 分析は傾向を示しているだけであること
    - 分析は診断ではないということ
    - 分析は間違っている可能性があるということ
    - 体調の変化に関係のない内容は無視すること
    - もし回答する内容がない場合はユーザを労う普遍的な回答をすること
    - 名前、住所、電話番号などの個人情報に関連する内容は無視すること

    あなたは次の内容を含むresponseをしてはなりません
    - 体調が悪い原因について断言すること
    - 問題を解決する対処法を教えること
    - ユーザの主観的な記録を否定すること
    - ユーザの主観的な記録の量や質に言及すること
    - 体調の変化に関係のない事実に言及すること
    - 私に相談して欲しいと促すこと`,
        temperature: 1,
      };

    case 'professional':
      return {
        responseSchema: {
          type: SchemaType.OBJECT,
          required: [
            'analysisResults',
            'abstract',
          ],
          properties: {
            analysisResults: {
              type: SchemaType.ARRAY,
              description: '分析結果の回答。時系列順に沿って事実をトピック毎に分割して記入する',
              items: {
                type: SchemaType.STRING,
              },
            },
            abstract: {
              type: SchemaType.STRING,
              description: '分析結果の要旨。簡潔にまとめる',
            },
          },
        },
        systemInstruction: `あなたは妊婦の体調を分析するアナリストです。
あなたの仕事はユーザが記録した主観的な体調についての体験と客観的なデータを組み合わせて分析し、パーソナライズされた分析結果を提供します。
あなたの出力した文章は、ユーザが医師や助産師の診断を受ける際に体調を共有するための参考情報として活用されます。

あなたの分析は次の内容を考慮する必要があります
- 提供されたデータに基づき、潜在的な相関関係に注意しながらユーザーの体験を分析すること
- 簡潔に回答すること
- 日本語で回答すること
- 午前や午後など大まかな時間帯を踏まえて回答すること
- 敬語を使うこと
- 淡々としたトーンで回答すること
- 時系列順に回答すること
- トピック毎に分けて簡潔に回答すること
- 同じような内容が続く場合は、まとめて回答すること

あなたは分析する際に次の内容を考慮する必要がありますが、responseには含めてはなりません
- 自己判断せず、医師の診断を受けることを勧めること
- 分析は傾向を示しているだけであること
- 分析は診断ではないということ
- 分析は間違っている可能性があるということ
- 体調の変化に関係のない内容は無視すること
- もし回答する内容がない場合は普遍的な回答をすること
- 名前、住所、電話番号などの個人情報に関連する内容は無視すること

あなたは次の内容を含むresponseをしてはなりません
- 体調が悪い原因について断言すること
- 問題を解決する対処法を教えること
- ユーザの主観的な記録を否定すること
- ユーザの主観的な記録の量や質に言及すること
- 体調の変化に関係のない事実に言及すること
- 私に相談して欲しいと促すこと`,
        temperature: 0,
      };
  }
}

export function setupGenerativeModel(highlightStyle: HighlightStyle): GenerativeModelPreview {
  const vertexAI = new VertexAI({
    project: projectID.value(),
    location: 'us-central1',
  });

  const { responseSchema, systemInstruction, temperature } = buildPrompt(highlightStyle);

  return vertexAI
    .preview
    .getGenerativeModel({
      model: 'gemini-2.0-flash-exp',
      safetySettings: safetySettings,
      generationConfig: {
        temperature: temperature,
        topP: 0.95,
        maxOutputTokens: 8192,
        responseMimeType: 'application/json',
        responseSchema: responseSchema,
      },
      tools: buildTools(highlightStyle),
      systemInstruction: systemInstruction,
    });
}

import { Content, FileDataPart, TextPart } from '@google-cloud/vertexai';
import { FieldValue } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions';
import { outSensitiveLog } from '../../utils/sensitive_log';
import { Condition } from '../domain/condition';
import { setupGenerativeModel } from './setupGenerativeModel';

/**
 * 生成モデルにリクエストを送信
 *
 * @param uid ユーザーID
 * @param conditions 解析対象のConditions
 * @returns
 */
export async function requestGenerativeModel(
  uid: string,
  conditions: Condition[],
): Promise<Condition | null> {
  const generativeModel = setupGenerativeModel();

  let requestContents: Content[] = conditions.map<Content | null>((condition) => {
    const date = condition.createdAtIso8601;

    let part: (TextPart | FileDataPart)[] = [];
    switch (condition.content.type) {
      case 'text':
        part = [{
          text: `${date}に入力したテキスト: ${condition.content.text}`,
        }];
        break;
      case 'textWithSearchKeywords':
        console.log(`condition.content.text`, condition.content.text);
        part = [{
          text: condition.content.text,
        }];
        break;
      case 'image':
        part = [
          {
            text: `${date}にアップロードされた画像`,
          },
          ...condition.content.attachments.map<FileDataPart>(attachment => ({
            fileData: {
              fileUri: attachment.fileUri,
              mimeType: attachment.mimeType,
            },
          })),
        ];
        break;
      case 'audio':
        part = [
          {
            text: `${date}にアップロードされた音声`,
          },
          ...condition.content.attachments.map<FileDataPart>(attachment => ({
            fileData: {
              fileUri: attachment.fileUri,
              mimeType: attachment.mimeType,
            },
          })),
        ];
        break;

      case 'empty':
        return null;
    };

    return {
      role: condition.creatorType,
      parts: part,
    };
  })
    .filter(e => e !== null);

  // 空だとエラーになる
  if (requestContents.length === 0) {
    requestContents = [
      {
        role: 'user',
        parts: [
          {
            text: 'No data',
          },
        ],
      },
    ];
  }
  outSensitiveLog(`requestContents`, requestContents);

  const generatedResult = await generativeModel.generateContent({
    contents: requestContents,
  });
  outSensitiveLog(`generatedResult`, generatedResult);

  const response = generatedResult.response.candidates![0]!.content.parts[0]!.text ?? '{}';
  // responseの形式は定義しており、従っていなかった場合は400エラーになるので型チェックは不要なはず
  // https://cloud.google.com/vertex-ai/generative-ai/docs/multimodal/control-generated-output?hl=ja#considerations
  const jsonContent = JSON.parse(response) as Record<string, unknown>;

  const reply = jsonContent['reply'] as string | null;
  if (reply === null) {
    logger.info('No reply');
    return null;
  }
  const searchKeywords = jsonContent['searchKeywords'] as string[] | null;

  const newCondition: Condition = {
    createdAt: FieldValue.serverTimestamp(),
    updatedAt: FieldValue.serverTimestamp(),
    deletedAt: null,
    subjectUid: uid,
    creatorType: 'model',
    createdAtIso8601: '',
    content: {
      type: 'textWithSearchKeywords',
      text: reply,
      searchKeywords: searchKeywords ?? [],
    },

  };

  outSensitiveLog(`newContent:`, newCondition);
  return newCondition;
}

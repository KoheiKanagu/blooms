import { Content, FileDataPart, Part } from '@google-cloud/vertexai';
import { FieldValue } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions';
import { Condition } from '../domain/condition';
import { setupGenerativeModel } from './setupGenerativeModel';
import { outSensitiveLog } from '../../../utils/sensitive_log';

function createParts(condition: Condition): Part[] {
  const date = condition.createdAtIso8601;

  switch (condition.content.type) {
    case 'text':
      return [{
        text: `${date} の記録: ${condition.content.text}`,
      }];

    case 'textWithSearchKeywords':
      return [{
        text: `回答: ${condition.content.text}`,
      }, {
        text: `検索キーワード: ${condition.content.searchKeywords.join(', ')}`,
      }];

    case 'image':
      return [
        {
          text: `${date} の記録`,
        },
        ...condition.content.attachments.map<FileDataPart>(attachment => ({
          fileData: {
            fileUri: attachment.fileUri,
            mimeType: attachment.mimeType,
          },
        })),
      ];

    case 'audio':
      return [
        {
          text: `${date} の記録`,
        },
        ...condition.content.attachments.map<FileDataPart>(attachment => ({
          fileData: {
            fileUri: attachment.fileUri,
            mimeType: attachment.mimeType,
          },
        })),
      ];

    case 'empty':
      logger.warn('Empty content');
      return [];
  };
}

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

  // 生成モデルに投げるContentを生成
  const requestContents: Content[] = conditions
    .map<Content>(condition => ({
      role: condition.creatorType,
      parts: createParts(condition),
    }))
    // 空だとエラーになるので除外
    .filter(content => content.parts.length > 0);

  if (requestContents.length === 0) {
    logger.warn('requestContents is empty');
    // 内容が無い場合はスキップ
    return null;
  }
  outSensitiveLog(`requestContents`, requestContents);

  // 生成
  const generatedResult = await generativeModel.generateContent({
    contents: requestContents,
  });
  outSensitiveLog(`generatedResult`, generatedResult);

  const response = generatedResult.response.candidates![0]!.content.parts[0]!.text ?? '{}';
  // responseの形式は定義しており、従っていなかった場合は400エラーになるので型チェックは不要なはず
  // https://cloud.google.com/vertex-ai/generative-ai/docs/multimodal/control-generated-output?hl=ja#considerations
  const jsonContent = JSON.parse(response) as Record<string, unknown>;

  const reply = jsonContent['reply'] as string;
  const searchKeywords = jsonContent['searchKeywords'] as string[];

  const newCondition: Condition = {
    createdAt: FieldValue.serverTimestamp(),
    updatedAt: FieldValue.serverTimestamp(),
    deletedAt: null,
    subjectUid: uid,
    creatorType: 'model',
    createdAtIso8601: null,
    content: {
      type: 'textWithSearchKeywords',
      text: reply,
      searchKeywords: searchKeywords,
    },

  };

  outSensitiveLog(`newCondition:`, newCondition);
  return newCondition;
}

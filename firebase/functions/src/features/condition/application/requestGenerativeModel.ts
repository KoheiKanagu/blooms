import { Content, FileDataPart, Part } from '@google-cloud/vertexai';
import { FieldValue } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions';
import { outSensitiveLog, outSensitiveLogWithJsonStringify } from '../../../utils/sensitive_log';
import { Condition } from '../domain/condition';
import { setupGenerativeModel } from './setupGenerativeModel';

function createParts(condition: Condition): Part[] {
  const date = condition.createdAtIso8601;

  switch (condition.content.type) {
    case 'text': {
      let text = condition.content.text.trim();
      if (text.length === 0) {
        text = 'null';
      }

      switch (condition.creatorType) {
        case 'user':
          return [{
            text: `${date}: ${text}`,
          }];
        case 'model':
          return [{
            text: `${text}`,
          }];
      }
    }

    case 'textWithSearchKeywords': {
      let text = condition.content.text.trim();
      if (text.length === 0) {
        text = 'null';
      }

      const searchKeywords = condition.content.searchKeywords;

      if (searchKeywords.length === 0) {
        return [{
          text: `${text}`,
        }];
      } else {
        return [
          {
            text: `${text}`,
          }, {
            text: `${searchKeywords.join(', ')}`,
          },
        ];
      }
    }

    case 'image':
      return [
        {
          text: `${date}`,
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
          text: `${date}`,
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
  outSensitiveLogWithJsonStringify(`requestContents`, requestContents);

  // 生成
  const generatedResult = await generativeModel.generateContent({
    contents: requestContents,
  });
  outSensitiveLog(`generatedResult`, generatedResult);

  const response = generatedResult.response.candidates![0]!.content.parts[0]!.text ?? '{}';
  // responseの形式は定義しており、従っていなかった場合は400エラーになるので型チェックは不要なはず
  // https://cloud.google.com/vertex-ai/generative-ai/docs/multimodal/control-generated-output?hl=ja#considerations
  const jsonContent = JSON.parse(response) as Record<string, unknown>;

  const shouldReply = jsonContent['shouldReply'] as boolean;
  if (shouldReply === false) {
    logger.info('shouldReply is false');
    return null;
  }

  const reply = jsonContent['reply'] as string | null;
  // shouldReplyがtrueの場合はreplyは必ず存在するはず
  if (reply === null) {
    throw new Error('reply is null');
  }

  const searchKeywords = jsonContent['searchKeywords'] as string[] | null;

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
      searchKeywords: searchKeywords ?? [],
    },

  };

  outSensitiveLog(`newCondition:`, newCondition);
  return newCondition;
}

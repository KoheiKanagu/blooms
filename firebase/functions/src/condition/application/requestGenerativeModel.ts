import { Content, FileDataPart, Part } from '@google-cloud/vertexai';
import { FieldValue } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions';
import { outSensitiveLog } from '../../utils/sensitive_log';
import { Condition } from '../domain/condition';
import { setupGenerativeModel } from './setupGenerativeModel';

function createParts(condition: Condition): Part[] | null {
  const date = condition.createdAtIso8601;

  let parts: Part[] = [];
  switch (condition.content.type) {
    case 'text':
      parts = [{
        text: `${date}に入力したテキスト: ${condition.content.text}`,
      }];
      break;
    case 'textWithSearchKeywords':
      parts = [{
        text: condition.content.text,
      }];
      break;
    case 'image':
      parts = [
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
      parts = [
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

  return parts;
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

  // 履歴を作成
  const historyContents: Content[] = conditions
    .slice(1)
    .map<Content | null>((condition) => {
      const parts = createParts(condition);

      if (parts === null) {
        return null;
      }

      return {
        role: condition.creatorType,
        parts: parts,
      };
    })
    .filter(e => e !== null);
  outSensitiveLog(`historyContents`, historyContents);

  const chat = generativeModel.startChat({
    history: historyContents,
  });

  // 最新のメッセージ
  const latestConditionParts = createParts(conditions[0]!);
  if (latestConditionParts === null) {
    logger.warn('No latest condition');
    return null;
  }

  // リクエスト
  const generatedResult = await chat.sendMessage(latestConditionParts);

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

  outSensitiveLog(`newCondition:`, newCondition);
  return newCondition;
}

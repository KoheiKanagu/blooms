import { Content, FileDataPart, Part } from '@google-cloud/vertexai';
import { logger } from 'firebase-functions';
import { outSensitiveLog } from '../../../utils/sensitive_log';
import { Condition } from '../../condition/domain/condition';
import { HighlightContentSummary } from '../domain/highlight';
import { savePrompt } from './savePrompt';
import { setupGenerativeModel } from './setupGenerativeModel';

function createParts(condition: Condition): Part[] {
  const date = condition.createdAtIso8601;

  switch (condition.content.type) {
    case 'text':
      return [{
        text: `${date} のユーザの記録: ${condition.content.text}`,
      }];

    case 'textWithSearchKeywords':
      return [{
        text: `BLOOMSの回答: ${condition.content.text}`,
      }, {
        text: `検索キーワード: ${condition.content.searchKeywords.join(', ')}`,
      }];

    case 'image':
      return [
        {
          text: `${date} のユーザの記録`,
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
          text: `${date} のユーザの記録`,
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
 * @param content ハイライトの内容
 * @returns
 */
export async function requestGenerativeModel(
  uid: string,
  conditions: Condition[],
  content: HighlightContentSummary,
): Promise<HighlightContentSummary> {
  const generativeModel = setupGenerativeModel(content.type);

  let requestContents: Content[] = conditions
    .map<Content>(condition => ({
      role: condition.creatorType,
      parts: createParts(condition),
    }))
    // 空だとエラーになるので除外
    .filter(content => content.parts.length > 0);

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

  const generatedResult = await generativeModel.generateContent({
    contents: requestContents,
  });
  outSensitiveLog(`generatedResult`, generatedResult);

  const response = generatedResult.response.candidates![0]!.content.parts[0]!.text ?? '{}';
  // responseの形式は定義しており、従っていなかった場合は400エラーになるので型チェックは不要なはず
  // https://cloud.google.com/vertex-ai/generative-ai/docs/multimodal/control-generated-output?hl=ja#considerations
  const jsonContent = JSON.parse(response) as Record<string, unknown>;
  const gsFileUri = await savePrompt(uid, requestContents);

  const summary = jsonContent['summary'] as string;
  const abstract = jsonContent['abstract'] as string;

  const newContent: HighlightContentSummary = {
    ...content,
    promptFileUri: gsFileUri,
    state: 'success',
    summary: summary,
    abstract: abstract,
  };
  outSensitiveLog(`newContent:`, newContent);

  return newContent;
}

import { Content, FileDataPart, TextPart } from '@google-cloud/vertexai';
import { Condition } from '../../../models/condition';
import { outSensitiveLog } from '../../../utils/sensitive_log';
import { HighlightContentPrivate, HighlightContentProfessional } from '../domain/highlight';
import { savePrompt } from './savePrompt';
import { setupGenerativeModel } from './setupGenerativeModel';

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
  content: HighlightContentPrivate | HighlightContentProfessional,
): Promise<HighlightContentPrivate | HighlightContentProfessional> {
  const generativeModel = setupGenerativeModel(content.style);

  let requestContents: Content[] = conditions.map<Content | null>((condition) => {
    const date = condition.createdAtIso8601;

    let part: (TextPart | FileDataPart)[];
    switch (condition.content.type) {
      case 'text':
        part = [{
          text: `${date}に入力したテキスト: ${condition.content.text}`,
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

  const generatedResult = await generativeModel.generateContent({
    contents: requestContents,
  });
  outSensitiveLog(`generateContent`, generatedResult);

  const response = generatedResult.response.candidates![0]!.content.parts[0]!.text ?? '{}';
  // responseの形式は定義しており、従っていなかった場合は400エラーになるので型チェックは不要なはず
  // https://cloud.google.com/vertex-ai/generative-ai/docs/multimodal/control-generated-output?hl=ja#considerations
  const jsonContent = JSON.parse(response) as Record<string, unknown>;
  const gsFileUri = await savePrompt(uid, requestContents);

  const newContent: HighlightContentPrivate | HighlightContentProfessional = {
    ...content,
    promptFileUri: gsFileUri,
    state: 'success',
    ...jsonContent,
  };
  outSensitiveLog(`newContent:`, newContent);

  return newContent;
}

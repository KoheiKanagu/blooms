import { Content, FileDataPart, TextPart } from '@google-cloud/vertexai';
import { Condition } from '../../../models/condition';
import { outSensitiveLog } from '../../../utils/sensitive_log';
import { HighlightContentPrivate, HighlightContentProfessional, HighlightStyle } from '../domain/highlight';
import { savePrompt } from './savePrompt';
import { setupGenerativeModel } from './setupGenerativeModel';

/**
 * 生成モデルにリクエストを送信
 *
 * @param uid ユーザーID
 * @param conditions 解析対象のConditions
 * @param highlightStyle 文体のスタイル
 * @returns
 */
export async function requestGenerativeModel(uid: string, conditions: Condition[], highlightStyle: HighlightStyle): Promise<{
  content: HighlightContentPrivate | HighlightContentProfessional;
  prompt: string;
}> {
  const generativeModel = setupGenerativeModel(highlightStyle);

  let contents: Content[] = conditions.map<Content | null>((condition) => {
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
      role: 'user',
      parts: part,
    };
  })
    .filter(e => e !== null);

  // 空だとエラーになる
  if (contents.length === 0) {
    contents = [
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

  const result = await generativeModel.generateContent({
    contents: contents,
  });
  outSensitiveLog(`generateContent`, result);

  const response = result.response.candidates![0]!.content.parts[0]!.text ?? '{}';
  // responseの形式は定義しており、従っていなかった場合は400エラーになるのでnullチェックは不要なはず
  // https://cloud.google.com/vertex-ai/generative-ai/docs/multimodal/control-generated-output?hl=ja#considerations
  let content = JSON.parse(response) as HighlightContentPrivate | HighlightContentProfessional;
  content = {
    ...content,
    style: highlightStyle,
  };
  outSensitiveLog(`content:`, content);

  const gsPrompt = await savePrompt(uid, contents);
  return {
    content: content,
    prompt: gsPrompt,
  };
}

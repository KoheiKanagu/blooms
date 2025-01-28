import { Timestamp } from '@google-cloud/firestore';
import { Content } from '@google-cloud/vertexai';
import { Condition } from '../../../models/condition';
import { outSensitiveLog } from '../../../utils/sensitive_log';
import { HighlightContentPrivate, HighlightContentProfessional, HighlightStyle } from '../domain/highlight';
import { savePrompt } from './savePrompt';
import { setupGenerativeModel } from './setupGenerativeModel';

/**
 * 生成モデルにリクエストを送信
 *
 * @param conditions 解析対象のConditions
 * @param highlightStyle 文体のスタイル
 * @returns
 */
export async function requestGenerativeModel(conditions: Condition[], highlightStyle: HighlightStyle): Promise<{
  content: HighlightContentPrivate | HighlightContentProfessional;
  prompt: string;
}> {
  const generativeModel = setupGenerativeModel(highlightStyle);

  let contents: Content[] = conditions.map<Content | null>((condition) => {
    const date = (condition.createdAt as Timestamp).toDate().toLocaleString('ja-JP');

    let text: string;
    switch (condition.content.type) {
      case 'subjective':
        text = `${date}に入力したテキスト: ${condition.content.record}`;
        break;
      case 'photo':
        text = condition.content.attachments
          .map(attachment => `${date}にアップロードした写真の説明: ${attachment.alt}`)
          .join('\n');
        break;
      case 'empty':
        return null;
    };

    return {
      role: 'user',
      parts: [{ text: text }],
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

  const gsPrompt = await savePrompt(contents);
  return {
    content: content,
    prompt: gsPrompt,
  };
}

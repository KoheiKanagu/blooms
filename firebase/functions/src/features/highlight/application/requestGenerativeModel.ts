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

  let contents: Content[] = conditions.map<Content>((condition) => {
    const date = (condition.createdAt as Timestamp).toDate().toLocaleString('ja-JP');

    return {
      role: 'user',
      parts: [
        {
          text: `${date}の記録:
${condition.record ?? ''}
`,
        },
      ],
    };
  });

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
  const content = JSON.parse(response) as unknown;
  outSensitiveLog(`content:`, content);

  const gsPrompt = await savePrompt(contents);
  return {
    content: content as HighlightContentPrivate | HighlightContentProfessional,
    prompt: gsPrompt,
  };
}

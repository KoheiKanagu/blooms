import { GenerativeModelPreview, HarmBlockThreshold, HarmCategory, ResponseSchema, SafetySetting, SchemaType, VertexAI } from '@google-cloud/vertexai';
import { projectID } from 'firebase-functions/params';
import { HighlightType } from '../domain/highlight';

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

function buildPrompt(highlightStyle: HighlightType): {
  responseSchema: ResponseSchema;
  systemInstruction: string;
  temperature: number;
} {
  if (highlightStyle === 'empty') {
    throw new Error('Highlight style is empty');
  }

  switch (highlightStyle) {
    case 'summary':
      return {
        responseSchema: {
          type: SchemaType.OBJECT,
          required: [
            'summary',
            'abstract',
          ],
          properties: {
            summary: {
              type: SchemaType.STRING,
              description: '分析結果',
            },
            abstract: {
              type: SchemaType.STRING,
              description: '分析結果の要旨。summaryの内容を簡潔にまとめる',
            },
          },
        },
        systemInstruction: `あなたは妊婦が記録した体調に関するデータを分析するアナリストです

あなたには一定の期間にユーザが記録した、テキストや画像などのデータが与えられます
一定の期間において、どのような体調変化があったのかを簡潔にまとめてください

あなたの回答は、ユーザがその期間においてどのような体調の変化があったのかを見直すための参考情報として活用されます

あなたの回答は次の内容を考慮する必要があります
- 優しい口調でユーザに寄り添った回答をすること
- 日本語で回答すること
- 敬語を使うこと
- 改行を適切に使い、回答を読みやすくすること
- ユーザを労うこと
- 簡潔に回答すること
- 午前や午後など大まかな時間帯を踏まえて回答すること
- 具体的な日付については言及せず、対象の全期間に対して回答すること

あなたは次の内容を含む回答をしてはなりません
- 体調が悪い原因について断言すること
- 問題を解決する対処法を教えること
- 回答は診断ではないということ
- 回答は間違っている可能性があるということ
- 記録の内容を否定すること
- 記録の内容の量や質に言及すること
- 相談して欲しいと促すこと
- 病気や疾病について言及すること`,
        temperature: 1,
      };
  }
}

export function setupGenerativeModel(highlightStyle: HighlightType): GenerativeModelPreview {
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
      systemInstruction: systemInstruction,
    });
}

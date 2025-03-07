import { GenerativeModel, HarmBlockThreshold, HarmCategory, SafetySetting, SchemaType, VertexAI } from '@google-cloud/vertexai';
import { projectID } from 'firebase-functions/params';
import { MyResponseSchema } from '../../../utils/my_response_schema';
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

function buildPrompt(highlightType: HighlightType): {
  responseSchema: MyResponseSchema;
  systemInstruction: string;
} {
  if (highlightType === 'empty') {
    throw new Error('Highlight type is empty');
  }

  switch (highlightType) {
    case 'summary':
      return {
        responseSchema: {
          type: SchemaType.OBJECT,
          properties: {
            // 中間分析
            claims: {
              type: SchemaType.ARRAY,
              description: 'ユーザが述べている主張を漏らすこと無く全て確実に列挙する',
              items: {
                type: SchemaType.OBJECT,
                properties: {
                  text: {
                    type: SchemaType.STRING,
                    description: '内容',
                  },
                  dateTime: {
                    type: SchemaType.STRING,
                    description: '日時',
                  },
                  evidence: {
                    type: SchemaType.STRING,
                    description: '根拠',
                  },
                  certainty: {
                    type: SchemaType.STRING,
                    description: '確からしさ',
                  },
                },
                required: [
                  'text',
                  'dateTime',
                  'evidence',
                  'certainty',
                ],
                propertyOrdering: [
                  'text',
                  'dateTime',
                  'evidence',
                  'certainty',
                ],
              } as MyResponseSchema,
            },
            attachedClaims: {
              type: SchemaType.ARRAY,
              description: 'ユーザが添付したファイルの内容について漏らすことなく全て確実に列挙する',
              items: {
                type: SchemaType.OBJECT,
                properties: {
                  attachmentType: {
                    type: SchemaType.STRING,
                    description: '添付ファイルの種類',
                  },
                  alt: {
                    type: SchemaType.STRING,
                    description: '添付ファイルのalt属性',
                  },
                  dateTime: {
                    type: SchemaType.STRING,
                    description: '日時',
                  },
                  certainty: {
                    type: SchemaType.STRING,
                    description: '確からしさ',
                  },
                },
                required: [
                  'attachmentType',
                  'alt',
                  'dateTime',
                  'certainty',
                ],
                propertyOrdering: [
                  'attachmentType',
                  'alt',
                  'dateTime',
                  'certainty',
                ],
              } as MyResponseSchema,
            },
            description: {
              type: SchemaType.STRING,
              description: '与えられた内容を説明する',
            },
            claimsValidation: {
              type: SchemaType.ARRAY,
              description: 'descriptionを元にして、主張を検証する',
              items: {
                type: SchemaType.OBJECT,
                properties: {
                  claim: {
                    type: SchemaType.STRING,
                    description: '検証する対象の主張',
                  },
                  summaryDescription: {
                    type: SchemaType.STRING,
                    description: 'descriptionとの関連性を説明する',
                  },
                  isRelevant: {
                    type: SchemaType.STRING,
                    description: '記録の内容に沿っているか',
                  },
                },
                required: [
                  'claim',
                  'summaryDescription',
                  'isRelevant',
                ],
                propertyOrdering: [
                  'claim',
                  'summaryDescription',
                  'isRelevant',
                ],
              } as MyResponseSchema,
            },
            noises: {
              type: SchemaType.ARRAY,
              description: 'ノイズを列挙する',
              items: {
                type: SchemaType.STRING,
              },
            },

            // 成果物
            summary: {
              type: SchemaType.STRING,
              description: 'ユーザに提示すべき分析結果',
            },
            abstract: {
              type: SchemaType.STRING,
              description: 'summaryの内容を100文字以下で簡潔にまとめる',
            },
          },
          required: [
            'claims',
            'attachedClaims',
            'description',
            'claimsValidation',
            'noises',
            'summary',
            'abstract',
          ],
          propertyOrdering: [
            'claims',
            'attachedClaims',
            'description',
            'claimsValidation',
            'noises',
            'summary',
            'abstract',
          ],
        },
        systemInstruction: `あなたは妊婦が記録した体調に関するデータを分析するアナリストです。

あなたには一定の期間にユーザが記録した、テキストや画像などのデータが与えられます。
一定の期間において、どのような体調変化があったのかをまとめてください。

あなたの回答は、ユーザがその期間においてどのような体調の変化があったのかを見直すための参考情報として活用されます。

あなたの回答は次の内容を考慮する必要があります。
- 優しい口調で回答をすること
- 日本語で回答すること
- 敬語を使うこと
- 改行を適切に使い、回答を読みやすくすること
- 午前や午後など大まかな時間帯を踏まえて回答すること
- 具体的な日付については言及せず、対象の全期間に対して回答すること

あなたは次の内容を含む回答をしてはなりません
- 断言してはなりません
- 問題を解決する対処法を教えてはなりません
- 診断を含む回答をしてはなりません
- 相談して欲しいと促してはなりません
- 回答に挨拶や感謝の言葉は含めてはなりません
- 回答に指示や命令を含めてはなりません`,
      };
  }
}

export function setupGenerativeModel(highlightType: HighlightType): GenerativeModel {
  const vertexAI = new VertexAI({
    project: projectID.value(),
    location: 'us-central1',
  });

  const { responseSchema, systemInstruction } = buildPrompt(highlightType);

  return vertexAI
    .getGenerativeModel({
      model: 'gemini-2.0-flash-001',
      safetySettings: safetySettings,
      generationConfig: {
        topP: 0.95,
        maxOutputTokens: 8192,
        responseMimeType: 'application/json',
        responseSchema: responseSchema,
        temperature: 2.0,
      },
      systemInstruction: systemInstruction,
    });
}

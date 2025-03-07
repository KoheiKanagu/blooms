import { GenerativeModel, HarmBlockThreshold, HarmCategory, SafetySetting, SchemaType, VertexAI } from '@google-cloud/vertexai';
import { projectID } from 'firebase-functions/params';
import { MyResponseSchema } from '../../../utils/my_response_schema';

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

function buildPrompt(): {
  responseSchema: MyResponseSchema;
  systemInstruction: string;
} {
  const today = new Date();
  const year = today.getFullYear();
  const month = today.getMonth() + 1;
  const day = today.getDate();
  const formattedDate = `${year}年${month}月${day}日`;

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
        modelClaims: {
          type: SchemaType.ARRAY,
          description: 'modelがこれまでに生成した回答を漏らすこと無く全て確実に列挙する',
          items: {
            type: SchemaType.OBJECT,
            properties: {
              text: {
                type: SchemaType.STRING,
                description: '内容',
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
              'evidence',
              'certainty',
            ],
            propertyOrdering: [
              'text',
              'evidence',
              'certainty',
            ],
          } as MyResponseSchema,
        },
        description: {
          type: SchemaType.STRING,
          description: '与えられた内容を数百文字程度で説明する',
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
              recentClaim: {
                type: SchemaType.STRING,
                description: '最近の主張か',
              },
              summaryDescription: {
                type: SchemaType.STRING,
                description: 'descriptionとの関連性を説明する',
              },
              keywords: {
                type: SchemaType.ARRAY,
                description: '重要なキーワード',
                items: {
                  type: SchemaType.STRING,
                },
              },
              moreInformationIsNeeded: {
                type: SchemaType.STRING,
                description: '十分な検証にはさらなる情報が必要か',
              },
              isRelevant: {
                type: SchemaType.STRING,
                description: '記録の内容に沿っているか',
              },
            },
            required: [
              'claim',
              'recentClaim',
              'summaryDescription',
              'keywords',
              'moreInformationIsNeeded',
              'isRelevant',
            ],
            propertyOrdering: [
              'claim',
              'recentClaim',
              'summaryDescription',
              'keywords',
              'moreInformationIsNeeded',
              'isRelevant',
            ],
          } as MyResponseSchema,
        },
        thinkReply: {
          type: SchemaType.ARRAY,
          description: 'claimsValidationを元にして、回答することでユーザに貢献できるか検討する',
          items: {
            type: SchemaType.OBJECT,
            properties: {
              claim: {
                type: SchemaType.STRING,
                description: '検証する対象の主張',
              },
              reply: {
                type: SchemaType.STRING,
                description: 'ユーザに回答する内容',
              },
              canReplyContribute: {
                type: SchemaType.STRING,
                description: 'ユーザに貢献できるか',
              },
            },
            required: [
              'claim',
              'reply',
              'canReplyContribute',
            ],
            propertyOrdering: [
              'claim',
              'reply',
              'canReplyContribute',
            ],
          } as MyResponseSchema,
        },
        searchKeywordValidation: {
          type: SchemaType.ARRAY,
          description: 'claimsValidationを元にして、Googleで検索すると妊婦に有用な情報が得られる可能性を検証する',
          items: {
            type: SchemaType.OBJECT,
            properties: {
              claim: {
                type: SchemaType.STRING,
                description: '検証する対象の主張',
              },
              prospectsUsefulInformation: {
                type: SchemaType.STRING,
                description: '検索すると有用な情報が得られるか',
              },
              searchKeywords: {
                type: SchemaType.STRING,
                description: 'Googleで検索すべき検索キーワード',
              },
            },
            required: [
              'claim',
              'prospectsUsefulInformation',
              'searchKeywords',
            ],
            propertyOrdering: [
              'claim',
              'prospectsUsefulInformation',
              'searchKeywords',
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
        searchKeywords: {
          type: SchemaType.ARRAY,
          description: 'searchKeywordValidationを総合的に評価し、Googleで検索すべき検索キーワードを抽出する',
          items: {
            type: SchemaType.STRING,
          },
          nullable: true,
        },
        reply: {
          type: SchemaType.STRING,
          description: 'thinkReplyを総合的に評価し、ユーザに回答する内容を生成する',
          nullable: true,
        },

        // 最終判断
        sameReply: {
          type: SchemaType.STRING,
          description: 'replyとmodelClaimsを比較し、過去と同じ趣旨の回答であるか',
        },
        shouldReply: {
          type: SchemaType.BOOLEAN,
          description: 'replyとsameReplyを総合的に評価し、回答するべきかどうか',
        },
      },
      required: [
        'claims',
        'attachedClaims',
        'modelClaims',
        'description',
        'claimsValidation',
        'thinkReply',
        'searchKeywordValidation',
        'noises',
        'searchKeywords',
        'reply',
        'sameReply',
        'shouldReply',
      ],
      propertyOrdering: [
        'claims',
        'attachedClaims',
        'modelClaims',
        'description',
        'claimsValidation',
        'thinkReply',
        'searchKeywordValidation',
        'noises',
        'searchKeywords',
        'reply',
        'sameReply',
        'shouldReply',
      ],
    },
    systemInstruction: `あなたは妊婦が体調に関する記録を書くことを支援するパーソナルアシスタントです。
あなたの名前は「BLOOMS」で、Body Log Observation and Outlook for Maternal Stateの頭文字です。

あなたの仕事はユーザが記録した体調についての体験や日々の出来事に関して、回答または静観することです。
回答または静観すべきかは、分析を通して判断します。
あなたはあくまで記録の内容を分析して支援するだけであり、ユーザはあなたと会話をするつもりはないことを留意してください。

あなたにはユーザが記録したテキストや画像のデータと、前回あなたが回答した内容が与えられます。
与えられた全ての内容を踏まえて分析してください。

今日は${formattedDate}です。

あなたの回答は次の内容を考慮する必要があります
- 優しい口調でユーザに寄り添った回答をすること
- 日本語で回答すること
- 敬語を使うこと
- 改行を適切に使い、回答を読みやすくすること

あなたは次の内容を含む回答をしてはなりません
- 断言してはなりません
- 問題を解決する対処法を教えてはなりません
- 診断を含む回答をしてはなりません
- 相談して欲しいと促してはなりません`,
  };
}

export function setupGenerativeModel(): GenerativeModel {
  const vertexAI = new VertexAI({
    project: projectID.value(),
    location: 'us-central1',
  });

  const { responseSchema, systemInstruction } = buildPrompt();

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

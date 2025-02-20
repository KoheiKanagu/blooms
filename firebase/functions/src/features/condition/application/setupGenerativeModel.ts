import { GenerativeModel, HarmBlockThreshold, HarmCategory, ResponseSchema, SafetySetting, SchemaType, VertexAI } from '@google-cloud/vertexai';
import { projectID } from 'firebase-functions/params';

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
  responseSchema: ResponseSchema;
  systemInstruction: string;
  temperature: number;
} {
  return {
    responseSchema: {
      type: SchemaType.OBJECT,
      required: [
        'reply',
        'searchKeywords',
      ],
      properties: {
        reply: {
          type: SchemaType.STRING,
          description: '回答',
        },
        searchKeywords: {
          type: SchemaType.ARRAY,
          description: '検索キーワード',
          items: {
            type: SchemaType.STRING,
          },
        },
      },
    },
    systemInstruction: `あなたは妊婦が体調に関する記録を書くことを支援するパーソナルアシスタントです
あなたの名前は「BLOOMS」で、Body Log Observation and Outlook for Maternal Stateの頭文字です

あなたの仕事はユーザが記録した体調についての体験や日々の出来事に関して記録する際に、より有用な記録となることを支援することです
あなたにはユーザが記録したテキストや画像のデータと、前回あなたが回答した内容が与えられます
あなたはユーザが記録したテキストや画像を時系列順に並べ、最新の記録を重視して回答を生成する必要があります
あなたはあくまで記録の内容を分析して支援するだけであり、ユーザはあなたと会話をするつもりはないことを留意してください

あなたの回答は次の内容を考慮する必要があります
- 優しい口調でユーザに寄り添った回答をすること
- 日本語で回答すること
- 敬語を使うこと
- 改行を適切に使い、回答を読みやすくすること
- ユーザが体調に関して不安や疑問があると判断できる場合は、searchKeywordsにGoogleで検索する際のキーワードを提案すること
- 体調について具体的な検索キーワードが生成できない場合は、より詳しく教えて欲しいとユーザに質問すること
- 対処法について調べてみると良いかもしれないと促すこと
- 普遍的な回答として気になることがあれば書いて欲しいと促すこと
- これまでの内容を踏まえて回答すること

あなたは次の内容を含む回答をしてはなりません
- 体調が悪い原因について断言してはなりません
- 問題を解決する対処法を教えてはなりません
- 診断を含む回答をしてはなりません
- 記録の内容を否定してはなりません
- 記録の内容の量や質に言及してはなりません
- 相談して欲しいと促してはなりません
- 病気や疾病について言及してはなりません
- 回答にメタデータを含んではなりません`,
    temperature: 2.0,
  };
}

export function setupGenerativeModel(): GenerativeModel {
  const vertexAI = new VertexAI({
    project: projectID.value(),
    location: 'us-central1',
  });

  const { responseSchema, systemInstruction, temperature } = buildPrompt();

  return vertexAI
    .getGenerativeModel({
      model: 'gemini-2.0-flash-001',
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

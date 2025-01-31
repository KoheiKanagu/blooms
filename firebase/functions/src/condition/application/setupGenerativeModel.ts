import { GenerativeModelPreview, HarmBlockThreshold, HarmCategory, ResponseSchema, SafetySetting, SchemaType, VertexAI } from '@google-cloud/vertexai';
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
      properties: {
        reply: {
          type: SchemaType.STRING,
          description: '返答。返答しない場合はnull',
        },
        searchKeywords: {
          type: SchemaType.ARRAY,
          description: '検索キーワード。適切なキーワードが存在しない場合はnull',
          items: {
            type: SchemaType.STRING,
          },
        },
      },
    },
    systemInstruction: `あなたは妊婦の体調を分析するチャットボットです
あなたの仕事はユーザが記録した体調についての体験や日々の出来事のメッセージに返答します。
最も最近のメッセージを考慮して、ユーザに対して適切な返答を生成してください

あなたの返答は次の内容を考慮する必要があります
- 優しい口調でユーザに寄り添った返答をすること
- 日本語で回答すること
- 敬語を使うこと
- これまでの会話を考慮すること
- 同じ内容の返答を繰り返さないこと
- 同じ内容の返答となる場合は、返答しないこと
- ユーザが体調に関して不安や疑問があると判断できる場合は、Googleで検索する際のキーワードを提案すること
- 体調について具体的な検索キーワードが生成できない場合は、より詳しく教えて欲しいとユーザに質問すること
- 返答する必要がないと判断できる場合は返答しないこと
- 返答しない方が良いと判断できる場合は返答しないこと

あなたは次の内容を含む返答をしてはなりません
- 返答は傾向を示しているだけであること
- 返答は診断ではないということ
- 返答は間違っている可能性があるということ
- 体調の変化に関係のない内容は無視すること
- メッセージの内容を否定すること
- メッセージの量や質に言及すること
- 妊婦の体調に関係のない事実に言及すること
- 相談して欲しいと促すこと
- 病気や疾病について言及すること`,
    temperature: 2.0,
  };
}

export function setupGenerativeModel(): GenerativeModelPreview {
  const vertexAI = new VertexAI({
    project: projectID.value(),
    location: 'us-central1',
  });

  const { responseSchema, systemInstruction, temperature } = buildPrompt();

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

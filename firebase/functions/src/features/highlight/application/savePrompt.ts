import { Content } from '@google-cloud/vertexai';
import { randomUUID } from 'crypto';
import { getStorage } from 'firebase-admin/storage';

/**
 * プロンプトをStorageに保存
 *
 * @param contents
 * @returns gs://形式のURL
 */
export async function savePrompt(contents: Content[]): Promise<string> {
  const name = `prompts/${randomUUID()}.json`;

  const gsFile = getStorage()
    .bucket()
    .file(name);
  await gsFile.save(JSON.stringify(contents));

  return `gs://${gsFile.bucket.name}/${gsFile.name}`;
}

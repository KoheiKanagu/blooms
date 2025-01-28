import { Content } from '@google-cloud/vertexai';
import { randomUUID } from 'crypto';
import { getStorage } from 'firebase-admin/storage';
import { StoragePath } from '../../../utils/storagePath';

/**
 * プロンプトをStorageに保存
 *
 * @param uid
 * @param contents
 * @returns gs://形式のURL
 */
export async function savePrompt(uid: string, contents: Content[]): Promise<string> {
  const name = `${StoragePath.PROMPTS}/${uid}/${randomUUID()}.json`;

  const gsFile = getStorage()
    .bucket()
    .file(name);
  await gsFile.save(JSON.stringify(contents));

  return `gs://${gsFile.bucket.name}/${gsFile.name}`;
}

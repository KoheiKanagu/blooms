import { getStorage } from 'firebase-admin/storage';
import { logger } from 'firebase-functions';

/**
 * Storageからファイルを削除する
 *
 * @param fileUri　gs:// で始まるファイルのURI
 */
export async function deleteStorageFile(fileUri: string): Promise<void> {
  logger.info(`Delete file: ${fileUri}`);

  // gs:// で始める必要がある
  if (!fileUri.startsWith('gs://')) {
    throw new Error(`Invalid fileUri: ${fileUri}`);
  }

  const raw = fileUri.replace('gs://', '');
  const paths = raw.split('/');

  // 先頭からバケット名を取得
  const bucketName = paths.shift();
  const bucket = getStorage().bucket(bucketName);

  // Storageのデータを削除する
  await bucket.file(paths.join('/')).delete();
}

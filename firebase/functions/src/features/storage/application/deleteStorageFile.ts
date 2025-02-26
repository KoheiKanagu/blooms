import { getStorage } from 'firebase-admin/storage';
import { logger } from 'firebase-functions';

/**
 * Storageからファイルを削除する
 *
 * @param fileUri　gs:// で始まるファイルのURI
 */
export async function deleteStorageFile(fileUri: string): Promise<void> {
  logger.info(`Deleting file: ${fileUri}`);

  // gs:// で始める必要がある
  if (!fileUri.startsWith('gs://')) {
    throw new Error(`Invalid fileUri: ${fileUri}`);
  }

  const raw = fileUri.replace('gs://', '');
  const paths = raw.split('/');

  // 先頭からバケット名を取得
  const bucketName = paths.shift();
  if (!bucketName) {
    throw new Error(`Invalid fileUri, bucket name is missing: ${fileUri}`);
  }
  const bucket = getStorage().bucket(bucketName);

  // Storageのデータを削除する
  const file = bucket.file(paths.join('/'));
  const [exists] = await file.exists();
  if (exists) {
    await file.delete();
  } else {
    logger.warn(`File not found: ${fileUri}`);
  }
}

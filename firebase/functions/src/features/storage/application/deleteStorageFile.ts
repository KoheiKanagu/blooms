import { getStorage } from 'firebase-admin/storage';
import { logger } from 'firebase-functions';

/**
 * Deletes a file from Firebase Storage.
 *
 * This asynchronous function removes the file identified by the given URI from Firebase Storage.
 * The URI must begin with `gs://` and include both the bucket name and the file path. The function
 * logs the deletion attempt, validates the URI format, extracts the necessary components, and then
 * performs the deletion.
 *
 * @param fileUri A URI starting with `gs://` that specifies the file to be deleted.
 *
 * @throws {Error} If the provided fileUri does not start with `gs://`.
 */
export async function deleteStorageFile(fileUri: string): Promise<void> {
  logger.info(`Delete file: ${fileUri}`);

  // gs:// で始める必要がある
  if (!fileUri.startsWith('gs://')) {
    throw new Error('Invalid fileUri');
  }

  const raw = fileUri.replace('gs://', '');
  const paths = raw.split('/');

  // 先頭からバケット名を取得
  const bucketName = paths.shift();
  const bucket = getStorage().bucket(bucketName);

  // Storageのデータを削除する
  await bucket.file(paths.join('/')).delete();
}

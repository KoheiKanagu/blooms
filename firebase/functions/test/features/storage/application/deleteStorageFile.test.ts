import { randomUUID } from 'crypto';
import { getStorage } from 'firebase-admin/storage';
import { deleteStorageFile } from '../../../../src/features/storage/application/deleteStorageFile';
import { StoragePath } from '../../../../src/utils/storagePath';

it('削除されること', async () => {
  const bucket = getStorage().bucket();

  // ダミーのファイルを作成
  const fileName = `${StoragePath.IMAGES}/subjectUid/${randomUUID()}.webp`;
  const file = bucket.file(fileName);
  await file.save('data');

  // ファイルが存在すること
  expect((await file.exists())[0]).toBeTruthy();

  await deleteStorageFile(`gs://${file.bucket.name}/${file.name}`);

  // ファイルが削除されていること
  expect((await file.exists())[0]).toBeFalsy();
});

it('gs:// で始まらない場合はエラーになること', async () => {
  await expect(deleteStorageFile('invalid'))
    .rejects
    .toThrow('Invalid fileUri');
});

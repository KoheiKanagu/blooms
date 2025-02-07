import { initializeTestEnvironment, RulesTestEnvironment } from '@firebase/rules-unit-testing';
import { getDownloadURL, ref, uploadString } from 'firebase/storage';
import { readFileSync } from 'fs';
import { StoragePath } from '../src/utils/storagePath';
import { expectPermissionSucceeds, expectStoragePermissionDenied } from './utils/utils';

let testEnv: RulesTestEnvironment;
const PROJECT_ID = 'my-project';

beforeAll(async () => {
  testEnv = await initializeTestEnvironment({
    projectId: PROJECT_ID,
    storage: {
      rules: readFileSync('../storage/storage.rules', 'utf8'),
      host: 'localhost',
      port: 9199,
    },
  });
});

beforeEach(async () => {
  await testEnv.clearStorage();
});

afterAll(async () => {
  await testEnv.clearStorage();
});

const userUid = 'user1';
const otherUserUid = 'user2';
const fileId = 'testFile';

async function setupFile(path: string) {
  await testEnv.withSecurityRulesDisabled(async (context) => {
    await uploadString(
      ref(context.storage(), path),
      'test data',
      'raw',
    );
  });
}

describe('prompts_v1', () => {
  const basePath = `${StoragePath.PROMPTS}/${userUid}/${fileId}`;

  it('自分のファイルは取得できること', async () => {
    const storage = testEnv.authenticatedContext(userUid).storage();
    await setupFile(basePath);

    await expectPermissionSucceeds(
      storage.ref(basePath).getDownloadURL(),
    );
  });

  it('異なるユーザーのファイルは取得できないこと', async () => {
    const storage = testEnv.authenticatedContext(otherUserUid).storage();
    await setupFile(basePath);

    await expectStoragePermissionDenied(
      getDownloadURL(ref(storage, basePath)),
    );
  });

  it('認証されていないユーザーはファイルを取得できないこと', async () => {
    const storage = testEnv.unauthenticatedContext().storage();
    await setupFile(basePath);

    await expectStoragePermissionDenied(
      getDownloadURL(ref(storage, basePath)),
    );
  });
});

describe('images_v1', () => {
  const basePath = `${StoragePath.IMAGES}/${userUid}/${fileId}`;

  it('自分のファイルは取得できること', async () => {
    const storage = testEnv.authenticatedContext(userUid).storage();
    await setupFile(basePath);

    await expectPermissionSucceeds(
      getDownloadURL(ref(storage, basePath)),
    );
  });

  it('異なるユーザーのファイルは取得できないこと', async () => {
    const storage = testEnv.authenticatedContext(otherUserUid).storage();
    await setupFile(basePath);

    await expectStoragePermissionDenied(
      getDownloadURL(ref(storage, basePath)),
    );
  });

  it('認証されていないユーザーはファイルを取得できないこと', async () => {
    const storage = testEnv.unauthenticatedContext().storage();
    await setupFile(basePath);

    await expectStoragePermissionDenied(
      getDownloadURL(ref(storage, basePath)),
    );
  });
});

describe('audios_v1', () => {
  const basePath = `${StoragePath.AUDIOS}/${userUid}/${fileId}`;

  it('自分のファイルは取得できること', async () => {
    const storage = testEnv.authenticatedContext(userUid).storage();
    await setupFile(basePath);

    await expectPermissionSucceeds(
      getDownloadURL(ref(storage, basePath)),
    );
  });

  it('異なるユーザーのファイルは取得できないこと', async () => {
    const storage = testEnv.authenticatedContext(otherUserUid).storage();
    await setupFile(basePath);

    await expectStoragePermissionDenied(
      getDownloadURL(ref(storage, basePath)),
    );
  });

  it('認証されていないユーザーはファイルを取得できないこと', async () => {
    const storage = testEnv.unauthenticatedContext().storage();
    await setupFile(basePath);

    await expectStoragePermissionDenied(
      getDownloadURL(ref(storage, basePath)),
    );
  });
});

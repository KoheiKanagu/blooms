import { Timestamp } from 'firebase-admin/firestore';
import { deletePrompt } from '../../../../src/features/highlight/application/deletePrompt';
import { deleteStorageFile } from '../../../../src/features/storage/application/deleteStorageFile';

jest.mock('../../../../src/features/storage/application/deleteStorageFile');

afterEach(() => {
  jest.clearAllMocks();
});

it('summaryの場合はdeleteStorageFileが呼ばれること', async () => {
  const mockDeleteStorageFile = deleteStorageFile as jest.Mock;
  mockDeleteStorageFile.mockResolvedValue(undefined);

  await deletePrompt({
    type: 'summary',
    startAt: Timestamp.now(),
    period: 'past1day',
    summary: 'summary',
    abstract: 'abstract',
    state: 'success',
    promptFileUri: 'promptFileUri',
  });

  expect(mockDeleteStorageFile).toHaveBeenCalledWith('promptFileUri');
});

it('emptyの場合はdeleteStorageFileが呼ばれないこと', async () => {
  const mockDeleteStorageFile = deleteStorageFile as jest.Mock;
  mockDeleteStorageFile.mockResolvedValue(undefined);

  await deletePrompt({
    type: 'empty',
  });

  expect(mockDeleteStorageFile).not.toHaveBeenCalled();
});

it('promptFileUriがnullの場合はdeleteStorageFileが呼ばれないこと', async () => {
  const mockDeleteStorageFile = deleteStorageFile as jest.Mock;
  mockDeleteStorageFile.mockResolvedValue(undefined);

  await deletePrompt({
    type: 'summary',
    startAt: Timestamp.now(),
    period: 'past1day',
    summary: 'summary',
    abstract: 'abstract',
    state: 'success',
    promptFileUri: null,
  });

  expect(mockDeleteStorageFile).not.toHaveBeenCalled();
});

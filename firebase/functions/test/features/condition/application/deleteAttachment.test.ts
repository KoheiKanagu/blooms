import { deleteAttachment } from '../../../../src/features/condition/application/deleteAttachment';
import { deleteStorageFile } from '../../../../src/features/storage/application/deleteStorageFile';

jest.mock('../../../../src/features/storage/application/deleteStorageFile');

afterEach(() => {
  jest.clearAllMocks();
});

it('textの場合はdeleteStorageFileが呼ばれないこと', async () => {
  const mockDeleteStorageFile = deleteStorageFile as jest.Mock;
  mockDeleteStorageFile.mockResolvedValue(undefined);

  await deleteAttachment({
    type: 'text',
    text: 'text',
  });

  expect(mockDeleteStorageFile).not.toHaveBeenCalled();
});

it('textWithSearchKeywordsの場合はdeleteStorageFileが呼ばれないこと', async () => {
  const mockDeleteStorageFile = deleteStorageFile as jest.Mock;
  mockDeleteStorageFile.mockResolvedValue(undefined);

  await deleteAttachment({
    type: 'textWithSearchKeywords',
    text: 'text',
    searchKeywords: ['searchKeywords'],
  });

  expect(mockDeleteStorageFile).not.toHaveBeenCalled();
});

it('emptyの場合はdeleteStorageFileが呼ばれないこと', async () => {
  const mockDeleteStorageFile = deleteStorageFile as jest.Mock;
  mockDeleteStorageFile.mockResolvedValue(undefined);

  await deleteAttachment({
    type: 'empty',
  });

  expect(mockDeleteStorageFile).not.toHaveBeenCalled();
});

it('imageの場合はdeleteStorageFileが呼ばれること', async () => {
  const mockDeleteStorageFile = deleteStorageFile as jest.Mock;
  mockDeleteStorageFile.mockResolvedValue(undefined);

  await deleteAttachment({
    type: 'image',
    attachments: [
      {
        fileUri: 'fileUri',
        mimeType: 'image/webp',
        width: 100,
        height: 100,
        additionalInfo: {
          blurHash: null,
        },
      },
    ],
  });

  expect(mockDeleteStorageFile).toHaveBeenCalledWith('fileUri');
});

it('audioの場合はdeleteStorageFileが呼ばれること', async () => {
  const mockDeleteStorageFile = deleteStorageFile as jest.Mock;
  mockDeleteStorageFile.mockResolvedValue(undefined);

  await deleteAttachment({
    type: 'audio',
    attachments: [
      {
        fileUri: 'fileUri',
        mimeType: 'audio/webm',
      },
    ],
  });

  expect(mockDeleteStorageFile).toHaveBeenCalledWith('fileUri');
});

it('複数の添付ファイルがある場合、それぞれのfileUriでdeleteStorageFileが呼ばれること', async () => {
  const mockDeleteStorageFile = deleteStorageFile as jest.Mock;
  mockDeleteStorageFile.mockResolvedValue(undefined);

  await deleteAttachment({
    type: 'image',
    attachments: [
      {
        fileUri: 'fileUri1',
        mimeType: 'image/webp',
        width: 100,
        height: 100,
        additionalInfo: {
          blurHash: null,
        },
      },
      {
        fileUri: 'fileUri2',
        mimeType: 'image/webp',
        width: 100,
        height: 100,
        additionalInfo: {
          blurHash: null,
        },
      },
    ],
  });

  expect(mockDeleteStorageFile).toHaveBeenCalledWith('fileUri1');
  expect(mockDeleteStorageFile).toHaveBeenCalledWith('fileUri2');
  expect(mockDeleteStorageFile).toHaveBeenCalledTimes(2);
});

it('deleteStorageFileが失敗した場合、エラーがthrowされること', async () => {
  const mockDeleteStorageFile = deleteStorageFile as jest.Mock;
  mockDeleteStorageFile.mockRejectedValue(new Error('delete error'));

  await expect(
    deleteAttachment({
      type: 'image',
      attachments: [
        {
          fileUri: 'fileUri',
          mimeType: 'image/webp',
          width: 100,
          height: 100,
          additionalInfo: {
            blurHash: null,
          },
        },
      ],
    }),
  ).rejects.toThrow('delete error');
});

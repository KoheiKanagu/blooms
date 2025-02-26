import { DocumentSnapshot, Timestamp } from 'firebase-admin/firestore';
import { wrap } from 'firebase-functions-test/lib/main';
import { deleteAttachment } from '../../../src/features/condition/application/deleteAttachment';
import { Condition } from '../../../src/features/condition/domain/condition';
import { onConditionDocumentDeleted } from '../../../src/features/condition/onConditionDocumentDeleted';
import { CollectionPath } from '../../../src/utils/collectionPath';
import { functionsTest } from '../../jest.setup';

const targetFunction = onConditionDocumentDeleted;

jest.mock('../../../src/features/condition/application/deleteAttachment');

afterEach(() => {
  functionsTest.cleanup();
  jest.clearAllMocks();
});

it('snapshotがundefinedの場合、deleteAttachmentが呼ばれないこと', async () => {
  const mockDeleteAttachment = deleteAttachment as jest.Mock;

  const wrapped = wrap(targetFunction);

  await expect(
    wrapped({
      data: undefined,
      params: {
        documentId: 'documentId',
      },
    }),
  )
    .resolves
    .toBeUndefined();

  expect(mockDeleteAttachment).not.toHaveBeenCalled();
});

it('deleteAttachmentが呼ばれること', async () => {
  const mockDeleteAttachment = deleteAttachment as jest.Mock;
  mockDeleteAttachment.mockResolvedValue(undefined);

  const condition: Condition = {
    createdAt: Timestamp.now(),
    updatedAt: Timestamp.now(),
    deletedAt: null,
    subjectUid: 'subjectUid',
    creatorType: 'user',
    createdAtIso8601: null,
    content: {
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
    },
  };

  const snapshot = functionsTest.firestore.makeDocumentSnapshot(
    condition,
    `${CollectionPath.CONDITIONS}/documentId`,
  ) as DocumentSnapshot;

  const wrapped = wrap(targetFunction);

  await expect(
    wrapped({
      data: snapshot,
      params: {
        documentId: 'documentId',
      },
    }),
  )
    .resolves
    .toBeUndefined();

  expect(mockDeleteAttachment).toHaveBeenCalledWith(condition.content);
});

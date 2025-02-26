import { DocumentSnapshot, Timestamp } from 'firebase-admin/firestore';
import { wrap } from 'firebase-functions-test/lib/main';
import { deletePrompt } from '../../../src/features/highlight/application/deletePrompt';
import { Highlight } from '../../../src/features/highlight/domain/highlight';
import { onHighlightDocumentDeleted } from '../../../src/features/highlight/onHighlightDocumentDeleted';
import { CollectionPath } from '../../../src/utils/collectionPath';
import { functionsTest } from '../../jest.setup';

const targetFunction = onHighlightDocumentDeleted;

jest.mock('../../../src/features/highlight/application/deletePrompt');

afterEach(() => {
  functionsTest.cleanup();
  jest.clearAllMocks();
});

it('snapshotがundefinedの場合、deletePromptが呼ばれないこと', async () => {
  const mockDeletePrompt = deletePrompt as jest.Mock;

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

  expect(mockDeletePrompt).not.toHaveBeenCalled();
});

it('deletePromptが呼ばれること', async () => {
  const mockDeletePrompt = deletePrompt as jest.Mock;
  mockDeletePrompt.mockResolvedValue(undefined);

  const highlightData: Highlight = {
    createdAt: Timestamp.now(),
    updatedAt: Timestamp.now(),
    deletedAt: Timestamp.now(),
    subjectUid: 'subjectUid',
    content: {
      type: 'summary',
      startAt: Timestamp.now(),
      period: 'past1day',
      summary: 'summary',
      abstract: 'abstract',
      state: 'success',
      promptFileUri: 'promptFileUri',
    },
  };

  const snapshot = functionsTest.firestore.makeDocumentSnapshot(
    highlightData,
    `${CollectionPath.HIGHLIGHTS}/documentId`,
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

  expect(mockDeletePrompt).toHaveBeenCalledWith(highlightData.content);
});

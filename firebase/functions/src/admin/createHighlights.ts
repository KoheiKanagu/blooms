import { FieldValue, getFirestore, Timestamp } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions';
import { Highlight, highlightConverter } from '../features/highlight/domain/highlight';
import { CollectionPath } from '../utils/collectionPath';
import { adminInitializeAppStg } from './adminInitializeApp';

/**
 * 特定のUIDのHighlightを作成する
 */
async function main(): Promise<void> {
  // adminInitializeAppProd();
  adminInitializeAppStg();

  const subjectUid = 'xxx';

  // 2025年1月10日
  const startDate = new Date(2025, 0, 10);
  const length = 10;

  const collection = getFirestore()
    .collection(CollectionPath.HIGHLIGHTS)
    .withConverter(highlightConverter);

  // startDateからN日分のHighlightを作成
  for (let i = 0; i < length; i++) {
    const startAt = new Date(startDate);
    startAt.setDate(startAt.getDate() + i);

    const highlight: Highlight = {
      createdAt: FieldValue.serverTimestamp(),
      updatedAt: FieldValue.serverTimestamp(),
      deletedAt: null,
      subjectUid: subjectUid,
      content: {
        type: 'summary',
        startAt: Timestamp.fromDate(startAt),
        period: 'past1day',
        summary: '',
        abstract: '',
        promptFileUri: null,
        state: 'pending',
      },
    };

    const result = await collection.add(highlight);
    logger.info(`Created: ${result.id}`);
  }
}

// eslint-disable-next-line @typescript-eslint/no-floating-promises
main().then(() => {
  logger.info('Done');
});

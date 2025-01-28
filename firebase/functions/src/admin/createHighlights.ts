import * as admin from 'firebase-admin';
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

  const collection = admin
    .firestore()
    .collection(CollectionPath.HIGHLIGHTS)
    .withConverter(highlightConverter);

  // startDateからN日分のHighlightを作成
  for (let i = 0; i < length; i++) {
    const startAt = new Date(startDate);
    startAt.setDate(startAt.getDate() + i);

    const highlight: Highlight = {
      createdAt: admin.firestore.FieldValue.serverTimestamp(),
      updatedAt: admin.firestore.FieldValue.serverTimestamp(),
      deletedAt: null,
      subjectUid: subjectUid,
      startAt: admin.firestore.Timestamp.fromDate(startAt),
      prompt: null,
      type: 'past1day',
      style: 'private',
      content: null,
      state: 'pending',
    };

    const result = await collection.add(highlight);
    logger.info(`Created: ${result.id}`);
  }
}

// eslint-disable-next-line @typescript-eslint/no-floating-promises
main().then(() => {
  logger.info('Done');
});

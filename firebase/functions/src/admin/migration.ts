import * as admin from 'firebase-admin';
import { logger } from 'firebase-functions';
import { CollectionPath } from '../utils/collectionPath';
import { adminInitializeAppStg } from './adminInitializeApp';

/**
 * 特定のUIDのConditionsとHighlightを別のUIDに移行する
 */
async function main(): Promise<void> {
  // adminInitializeAppProd();
  adminInitializeAppStg();

  const sourceUid = 'xxxx';
  const toUid = 'yyyy';

  const conditionQuery = admin
    .firestore()
    .collection(CollectionPath.CONDITIONS)
    .where('subjectUid', '==', sourceUid);

  await admin.firestore().runTransaction(async (transaction) => {
    const conditions = await transaction.get(conditionQuery);
    logger.info(`Found ${conditions.size} conditions`);

    for (const condition of conditions.docs) {
      transaction.update(condition.ref, {
        subjectUid: toUid,
      });
    }
  });

  const highlightQuery = admin
    .firestore()
    .collection(CollectionPath.HIGHLIGHTS)
    .where('subjectUid', '==', sourceUid);

  await admin.firestore().runTransaction(async (transaction) => {
    const highlights = await transaction.get(highlightQuery);
    logger.info(`Found ${highlights.size} highlights`);

    for (const highlight of highlights.docs) {
      transaction.update(highlight.ref, {
        subjectUid: toUid,
      });
    }
  });
}

// eslint-disable-next-line @typescript-eslint/no-floating-promises
main().then(() => {
  logger.info('Done');
});

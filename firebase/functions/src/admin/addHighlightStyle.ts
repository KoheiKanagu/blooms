import * as admin from 'firebase-admin';
import { logger } from 'firebase-functions';
import { HighlightStyle } from '../features/highlight/domain/highlight';
import { CollectionPath } from '../utils/collectionPath';
import { adminInitializeAppStg } from './adminInitializeApp';

/**
 * HighlightにHighlightStyleを追加する
 */
async function main(): Promise<void> {
  // adminInitializeAppProd();
  adminInitializeAppStg();

  const targetUid = 'xxxx';

  const conditionQuery = admin
    .firestore()
    .collection(CollectionPath.HIGHLIGHTS)
    .where('subjectUid', '==', targetUid);

  await admin.firestore().runTransaction(async (transaction) => {
    const conditions = await transaction.get(conditionQuery);
    logger.info(`Found ${conditions.size} conditions`);

    const style: HighlightStyle = 'private';

    for (const condition of conditions.docs) {
      if (condition.data()['content'] == null) {
        logger.info(`No content: ${condition.id}. Skip`);
        continue;
      }

      transaction.update(condition.ref, {
        style: style,
        content: {
          ...condition.data()['content'],
          style: style,
        },
      });
    }
  });
}

// eslint-disable-next-line @typescript-eslint/no-floating-promises
main().then(() => {
  logger.info('Done');
});

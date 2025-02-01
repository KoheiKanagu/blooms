import * as admin from 'firebase-admin';
import { Timestamp } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions';
import { ConditionContentText, conditionConverter } from '../condition/domain/condition';
import { CollectionPath } from '../utils/collectionPath';
import { adminInitializeAppStg } from './adminInitializeApp';

/**
 * 特定のUIDのConditionsをローカルに保存する
 */
async function main(): Promise<void> {
  // adminInitializeAppProd();
  adminInitializeAppStg();

  const sourceUid = 'xxxx';

  const results = await admin
    .firestore()
    .collection(CollectionPath.CONDITIONS)
    .withConverter(conditionConverter)
    .where('deletedAt', '==', null)
    .where('content.type', '==', 'text')
    .where('subjectUid', '==', sourceUid)
    .orderBy('createdAt', 'desc')
    .get();

  // JSONとして保存
  const records = results
    .docs
    .map(e => e.data())
    .map(e => ({
      日時: (e.createdAt as Timestamp).toDate().toISOString(),
      記録: (e.content as ConditionContentText).text,
    }));

  console.log(JSON.stringify(records, null, 2));
}

// eslint-disable-next-line @typescript-eslint/no-floating-promises
main().then(() => {
  logger.info('Done');
});

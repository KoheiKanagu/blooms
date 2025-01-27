import * as admin from 'firebase-admin';
import { Timestamp } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions';
import { conditionConverter } from '../models/condition';
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
    .where('state', '==', 'success')
    .where('type', '==', 'subjective')
    .where('createdBy', '==', sourceUid)
    .orderBy('createdAt', 'desc')
    .get();

  // JSONとして保存
  const records = results
    .docs
    .map(e => e.data())
    .map(e => ({
      日時: (e.createdAt as Timestamp).toDate().toLocaleString('ja-JP'),
      記録: e.record,
    }));

  console.log(JSON.stringify(records, null, 2));
}

// eslint-disable-next-line @typescript-eslint/no-floating-promises
main().then(() => {
  logger.info('Done');
});

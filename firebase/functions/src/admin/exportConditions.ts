import { getFirestore } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions';
import { conditionConverter } from '../features/condition/domain/condition';
import { CollectionPath } from '../utils/collectionPath';
import { adminInitializeAppStg } from './adminInitializeApp';

/**
 * 特定のUIDのConditionsをローカルに保存する
 */
async function main(): Promise<void> {
  // adminInitializeAppProd();
  adminInitializeAppStg();

  const sourceUid = 'xxxx';

  const results = await getFirestore()
    .collection(CollectionPath.CONDITIONS)
    .withConverter(conditionConverter)
    .where('deletedAt', '==', null)
    .where('subjectUid', '==', sourceUid)
    .orderBy('createdAt', 'asc')
    .get();

  const records = results
    .docs
    .map(e => e.data())
    .map((e) => {
      if (e.content.type === 'text') {
        return `${e.createdAtIso8601!} の記録: ${e.content.text}`;
      }
      return null;
    })
    .filter(record => record !== null);

  console.log(records);
}

// eslint-disable-next-line @typescript-eslint/no-floating-promises
main().then(() => {
  logger.info('Done');
});

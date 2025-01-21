import * as admin from 'firebase-admin';
import { Timestamp } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions';
import { Condition, conditionConverter } from '../models/condition';
import { CollectionPath } from '../utils/collectionPath';
import { adminInitializeAppStg } from './adminInitializeApp';

// adminInitializeAppProd();
adminInitializeAppStg();

const raw: {
  date: Date;
  record: string;
}[]
  = [
    { date: new Date('2025-01-21T10:00:00+09:00'), record: '頭痛がする' },
  ];

function create(
  date: Date,
  record: string,
): Condition {
  return new Condition(
    Timestamp.fromDate(date),
    Timestamp.fromDate(date),
    null,
    'uid',
    'subjective',
    [],
    'success',
    record,
  );
}

/**
 * Firestoreにデータをインポートする
 */
async function main(): Promise<void> {
  const conditions: Condition[] = raw.map(e => create(e.date, e.record));

  const collection = admin
    .firestore()
    .collection(CollectionPath.CONDITIONS)
    .withConverter(conditionConverter);

  for (const condition of conditions) {
    logger.debug(condition);
    await collection.add(condition);
  }
}

// eslint-disable-next-line @typescript-eslint/no-floating-promises
main().then(() => {
  logger.info('Done');
});

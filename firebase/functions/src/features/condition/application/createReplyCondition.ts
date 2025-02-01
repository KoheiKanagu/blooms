import * as admin from 'firebase-admin';
import { getFirestore, Timestamp } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions';
import { CollectionPath } from '../../../utils/collectionPath';
import { outSensitiveLog } from '../../../utils/sensitive_log';
import { Condition, conditionConverter, CreatorType } from '../domain/condition';
import { requestGenerativeModel } from './requestGenerativeModel';

export async function createReplyCondition(
  condition: Condition,
): Promise<void> {
  if (shouldSkipProcessing(condition)) {
    return;
  }

  // コンテキストとなるConditionを取得
  // 過去48時間が対象
  const targetDate = new Date(Date.now() - 48 * 60 * 60 * 1000);
  const contextConditions = await getFirestore()
    .collection(CollectionPath.CONDITIONS)
    .withConverter(conditionConverter)
    .where('subjectUid', '==', condition.subjectUid)
    .where('deletedAt', '==', null)
    .where('createdAt', '>=', Timestamp.fromDate(targetDate))
    .orderBy('createdAt', 'asc')
    .limit(20)
    .get()
    .then(e => e.docs.map(e => e.data()));

  outSensitiveLog(`contextConditions`, contextConditions);

  if (contextConditions.length === 0) {
    logger.warn('contextConditions is empty');
    return;
  }

  // 生成モデルにリクエストを送信
  const newCondition = await requestGenerativeModel(
    condition.subjectUid,
    contextConditions,
  );

  if (newCondition === null) {
    logger.warn('newCondition is null');
    return;
  }

  // 過去のcreatorTypeがmodelのConditionを削除
  const creatorTypeModel: CreatorType = 'model';
  const query = getFirestore()
    .collection(CollectionPath.CONDITIONS)
    .where('subjectUid', '==', condition.subjectUid)
    .where('deletedAt', '==', null)
    .where('creatorType', '==', creatorTypeModel);

  await admin
    .firestore()
    .runTransaction(async (transaction) => {
      const snapshot = await transaction.get(query);
      logger.info(`delete ${snapshot.size} conditions`);

      for (const doc of snapshot.docs) {
        transaction.update(doc.ref, {
          // 物理削除はTTLに任せる
          deletedAt: admin.firestore.FieldValue.serverTimestamp(),
        });
      }

      // 新しいConditionを追加
      transaction.set(
        getFirestore()
          .collection(CollectionPath.CONDITIONS)
          .doc(),
        newCondition,
      );
    });
}

/**
 * 処理をスキップするかどうか
 *
 * @param condition
 * @returns
 */
function shouldSkipProcessing(condition: Condition): boolean {
  // ユーザー以外の作成者のConditionはスキップ
  if (condition.creatorType !== 'user') {
    return true;
  }

  return false;
}

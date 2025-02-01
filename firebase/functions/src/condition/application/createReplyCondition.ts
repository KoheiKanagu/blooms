import { getFirestore } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions';
import { CollectionPath } from '../../utils/collectionPath';
import { outSensitiveLog } from '../../utils/sensitive_log';
import { Condition, conditionConverter } from '../domain/condition';
import { requestGenerativeModel } from './requestGenerativeModel';

export async function createReplyCondition(
  condition: Condition,
): Promise<void> {
  if (shouldSkipProcessing(condition)) {
    return;
  }

  const contextConditions = await getFirestore()
    .collection(CollectionPath.CONDITIONS)
    .withConverter(conditionConverter)
    .where('subjectUid', '==', condition.subjectUid)
    .where('deletedAt', '==', null)
    .where('creatorType', '==', 'user')
    .orderBy('createdAt', 'desc')
    .limit(42)
    .get()
    .then(e => e.docs.map(e => e.data()));

  outSensitiveLog(`contextConditions`, contextConditions);

  if (contextConditions.length === 0) {
    logger.warn('contextConditions is empty');
    return;
  }

  const newCondition = await requestGenerativeModel(
    condition.subjectUid,
    contextConditions,
  );

  if (newCondition === null) {
    return;
  }

  await getFirestore()
    .collection(CollectionPath.CONDITIONS)
    .add(newCondition);
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

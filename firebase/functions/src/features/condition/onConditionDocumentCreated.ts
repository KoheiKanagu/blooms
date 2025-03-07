import { logger } from 'firebase-functions';
import { onDocumentCreated } from 'firebase-functions/firestore';
import { CollectionPath } from '../../utils/collectionPath';
import { createReplyCondition } from './application/createReplyCondition';
import { conditionConverter } from './domain/condition';

/**
 * Conditionドキュメントが作成されたとき、リプライする
 */
export const onConditionDocumentCreated = onDocumentCreated(
  `${CollectionPath.CONDITIONS}/{documentId}`,
  async (event) => {
    const snapshot = event.data;
    if (snapshot == undefined) {
      logger.error(`Snapshot is undefined. Skip processing.`);
      return;
    }

    const condition = conditionConverter.fromFirestore(snapshot);
    await createReplyCondition(condition);
  });

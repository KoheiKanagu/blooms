import { logger } from 'firebase-functions';
import { onDocumentDeleted } from 'firebase-functions/firestore';
import { CollectionPath } from '../../utils/collectionPath';
import { deleteAttachment } from './application/deleteAttachment';
import { conditionConverter } from './domain/condition';

/**
 * Conditionドキュメントが削除されたとき、Storageのデータも削除する
 */
export const onConditionDocumentDeleted = onDocumentDeleted(
  `${CollectionPath.CONDITIONS}/{documentId}`,
  async (event) => {
    const snapshot = event.data;
    if (snapshot == undefined) {
      logger.error(`Snapshot is undefined. Skip processing.`);
      return;
    }

    const condition = conditionConverter.fromFirestore(snapshot);
    await deleteAttachment(condition.content);
  });

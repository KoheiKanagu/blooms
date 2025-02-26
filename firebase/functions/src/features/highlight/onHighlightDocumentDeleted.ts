import { logger } from 'firebase-functions';
import { onDocumentDeleted } from 'firebase-functions/firestore';
import { CollectionPath } from '../../utils/collectionPath';
import { deletePrompt } from './application/deletePrompt';
import { highlightConverter } from './domain/highlight';

/**
 * Highlightドキュメントが削除されたとき、Storageのデータも削除する
 */
export const onHighlightDocumentDeleted = onDocumentDeleted(
  `${CollectionPath.HIGHLIGHTS}/{documentId}`,
  async (event) => {
    const snapshot = event.data;
    if (snapshot == undefined) {
      logger.error(`Snapshot is undefined. Skip processing.`);
      return;
    }

    const highlight = highlightConverter.fromFirestore(snapshot);
    await deletePrompt(highlight.content);
  });

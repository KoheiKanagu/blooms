import { getStorage } from 'firebase-admin/storage';
import { logger } from 'firebase-functions';
import { onDocumentDeleted } from 'firebase-functions/firestore';
import { assertUnreachable } from '../../utils/assertUnreachable';
import { CollectionPath } from '../../utils/collectionPath';
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

    const type = highlight.content.type;
    switch (type) {
      case 'summary': {
        const uri = highlight.content.promptFileUri;
        if (uri == null) {
          logger.info(`No attachments to delete.`);
          break;
        }
        logger.info(`Delete file: ${uri}`);

        // Storageのデータを削除する
        await getStorage().bucket().file(uri).delete();
        break;
      }

      case 'empty':
        logger.info(`No attachments to delete.`);
        break;

      default:
        assertUnreachable(type);
    }
  });

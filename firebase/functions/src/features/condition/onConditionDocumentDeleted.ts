import { getStorage } from 'firebase-admin/storage';
import { logger } from 'firebase-functions';
import { onDocumentDeleted } from 'firebase-functions/firestore';
import { assertUnreachable } from '../../utils/assertUnreachable';
import { CollectionPath } from '../../utils/collectionPath';
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

    const type = condition.content.type;
    switch (type) {
      case 'image':
      case 'audio': {
        const attachments = condition.content.attachments;
        const bucket = getStorage().bucket();

        for (const attachment of attachments) {
          const fileUri = attachment.fileUri;
          logger.info(`Delete file: ${fileUri}`);

          // Storageのデータを削除する
          await bucket.file(fileUri).delete();
        }
        break;
      }

      case 'text':
      case 'textWithSearchKeywords':
      case 'empty':
        logger.info(`No attachments to delete.`);
        break;

      default:
        assertUnreachable(type);
    }
  });

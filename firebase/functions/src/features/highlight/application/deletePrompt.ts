import { logger } from 'firebase-functions';
import { assertUnreachable } from '../../../utils/assertUnreachable';
import { deleteStorageFile } from '../../storage/application/deleteStorageFile';
import { HighlightContentInterfaces } from '../domain/highlight';

export async function deletePrompt(content: HighlightContentInterfaces) {
  const type = content.type;

  switch (type) {
    case 'summary': {
      const uri = content.promptFileUri;
      if (uri == null) {
        logger.info(`No attachments to delete.`);
        break;
      }
      logger.info(`Delete file: ${uri}`);

      // Storageのデータを削除する
      await deleteStorageFile(uri);
      break;
    }

    case 'empty': {
      logger.info(`No attachments to delete.`);
      break;
    }
    default:
      assertUnreachable(type);
  }
}

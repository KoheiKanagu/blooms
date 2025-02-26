import { logger } from 'firebase-functions';
import { assertUnreachable } from '../../../utils/assertUnreachable';
import { deleteStorageFile } from '../../storage/application/deleteStorageFile';
import { HighlightContentInterfaces } from '../domain/highlight';

/**
 * Handles deletion of an attachment file based on the provided content.
 *
 * For a content type of "summary", if a prompt file URI exists, the function deletes the corresponding storage file.
 * If the URI is missing or the content type is "empty", it logs that there are no attachments to delete.
 * An unexpected content type results in an assertion error.
 *
 * @param content - An object containing metadata about the content, including its type and an optional prompt file URI.
 * @throws {Error} If the provided content type is not supported.
 */
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

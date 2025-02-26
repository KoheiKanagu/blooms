import { logger } from 'firebase-functions';
import { assertUnreachable } from '../../../utils/assertUnreachable';
import { deleteStorageFile } from '../../storage/application/deleteStorageFile';
import { ConditionContentInterfaces } from '../domain/condition';

/**
 * Deletes attachments associated with the provided content.
 *
 * For content of type 'image' or 'audio', iterates over the attachments and deletes each file via storage deletion. For
 * content of type 'text', 'textWithSearchKeywords', or 'empty', logs that there are no attachments to delete.
 * If the content type is unrecognized, triggers an assertion error.
 *
 * @param content - The content object containing the type and, if applicable, an array of attachments.
 *
 * @throws {Error} If the content type is not one of the expected values.
 */
export async function deleteAttachment(content: ConditionContentInterfaces): Promise<void> {
  const type = content.type;
  switch (type) {
    case 'image':
    case 'audio': {
      const attachments = content.attachments;
      for (const attachment of attachments) {
        const fileUri = attachment.fileUri;
        await deleteStorageFile(fileUri);
      }
      return;
    }

    case 'text':
    case 'textWithSearchKeywords':
    case 'empty':
      logger.info(`No attachments to delete.`);
      return;

    default:
      assertUnreachable(type);
  }
}

import { logger } from 'firebase-functions';
import { assertUnreachable } from '../../../utils/assertUnreachable';
import { deleteStorageFile } from '../../storage/application/deleteStorageFile';
import { ConditionContentInterfaces } from '../domain/condition';

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
      logger.info(`No attachments to delete for content type: ${type}.`);
      return;

    default:
      assertUnreachable(type);
  }
}

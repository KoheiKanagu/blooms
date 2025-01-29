import { FieldValue, FirestoreDataConverter, Timestamp } from 'firebase-admin/firestore';

export type ConditionType = 'text' | 'image' | 'audio' | 'empty';
export type ConditionState = 'pending' | 'inProgress' | 'success' | 'failure';

export class Condition {
  constructor(
    readonly createdAt: Timestamp | FieldValue,
    readonly updatedAt: Timestamp | FieldValue,
    readonly deletedAt: Timestamp | null,
    readonly createdBy: string,
    readonly createdAtIso8601: string,
    readonly content: ConditionContentText | ConditionContentImage | ConditionContentAudio | ConditionContentEmpty,
  ) { }
}

export interface ConditionContentText {
  type: 'text';
  text: string;
}

export interface ConditionContentImage {
  type: 'image';
  attachments: {
    fileUri: string;
    mimeType: string;
    width: number;
    height: number;
    additionalInfo: {
      blurHash: string | null;
    };
  }[];
}

export interface ConditionContentAudio {
  type: 'audio';
  attachments: {
    fileUri: string;
    mimeType: string;
  }[];
}

export interface ConditionContentEmpty {
  type: 'empty';
}

export const conditionConverter: FirestoreDataConverter<Condition> = {
  toFirestore: (condition: Condition) => ({
    createdAt: condition.createdAt,
    updatedAt: condition.updatedAt,
    deletedAt: condition.deletedAt,
    createdBy: condition.createdBy,
    timeZone: condition.createdAtIso8601,
    content: condition.content,
  }),
  fromFirestore: snapshot => new Condition(
    snapshot.get('createdAt') as Timestamp,
    snapshot.get('updatedAt') as Timestamp,
    snapshot.get('deletedAt') as Timestamp | null,
    snapshot.get('createdBy') as string,
    snapshot.get('createdAtIso8601') as string,
    conditionContentConverter(snapshot.get('content') as Record<string, unknown>),
  ),
};

function conditionContentConverter(value: Record<string, unknown>):
  ConditionContentText | ConditionContentImage | ConditionContentAudio | ConditionContentEmpty {
  if (value == null) {
    const empty: ConditionContentEmpty = {
      type: 'empty',
    };
    return empty;
  }

  const type = value['type'] as ConditionType;

  switch (type) {
    case 'text': {
      const content: ConditionContentText = {
        type: 'text',
        text: value['text'] as string,
      };
      return content;
    }

    case 'image': {
      const attachments = (value['attachments'] as Record<string, unknown>[])
        .map(attachment => ({
          fileUri: attachment['fileUri'] as string,
          mimeType: attachment['mimeType'] as string,
          width: attachment['width'] as number,
          height: attachment['height'] as number,
          additionalInfo: {
            blurHash: (attachment['additionalInfo'] as Record<string, unknown>)['blurHash'] as string | null,
          },
        }));

      const content: ConditionContentImage = {
        type: 'image',
        attachments: attachments,
      };
      return content;
    }

    case 'audio': {
      const attachments = (value['attachments'] as Record<string, unknown>[])
        .map(attachment => ({
          fileUri: attachment['fileUri'] as string,
          mimeType: attachment['mimeType'] as string,
        }));

      const content: ConditionContentAudio = {
        type: 'audio',
        attachments: attachments,
      };
      return content;
    }

    default: {
      const empty: ConditionContentEmpty = {
        type: 'empty',
      };
      return empty;
    }
  }
}

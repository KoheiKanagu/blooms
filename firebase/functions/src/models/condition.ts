import { FieldValue, FirestoreDataConverter, Timestamp } from 'firebase-admin/firestore';

export type ConditionType = 'subjective' | 'photo' | 'empty';
export type ConditionState = 'pending' | 'inProgress' | 'success' | 'failure';

export class Condition {
  constructor(
    readonly createdAt: Timestamp | FieldValue,
    readonly updatedAt: Timestamp | FieldValue,
    readonly deletedAt: Timestamp | null,
    readonly createdBy: string,
    readonly content: ConditionContentSubjective | ConditionContentPhoto | ConditionContentEmpty,
  ) { }
}

export interface ConditionContentSubjective {
  type: 'subjective';
  record: string;
}

export interface ConditionContentPhoto {
  type: 'photo';
  attachments: {
    gsPath: string;
    alt: string;
    state: ConditionState;
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
    content: condition.content,
  }),
  fromFirestore: snapshot => new Condition(
    snapshot.get('createdAt') as Timestamp,
    snapshot.get('updatedAt') as Timestamp,
    snapshot.get('deletedAt') as Timestamp | null,
    snapshot.get('createdBy') as string,
    conditionContentConverter(snapshot.get('content') as Record<string, unknown>),
  ),
};

function conditionContentConverter(value: Record<string, unknown>): ConditionContentSubjective | ConditionContentPhoto | ConditionContentEmpty {
  if (value == null) {
    const empty: ConditionContentEmpty = {
      type: 'empty',
    };
    return empty;
  }

  const type = value['type'] as ConditionType;

  switch (type) {
    case 'subjective': {
      const content: ConditionContentSubjective = {
        type: 'subjective',
        record: value['record'] as string,
      };
      return content;
    }
    case 'photo': {
      const attachments = (value['attachments'] as Record<string, unknown>[])
        .map(attachment => ({
          gsPath: attachment['gsPath'] as string,
          alt: attachment['alt'] as string,
          state: attachment['state'] as ConditionState,
        }));
      const content: ConditionContentPhoto = {
        type: 'photo',
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

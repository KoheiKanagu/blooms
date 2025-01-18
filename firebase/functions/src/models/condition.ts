import { FieldValue, FirestoreDataConverter, Timestamp } from 'firebase-admin/firestore';

export type ConditionType = 'unknown' | 'subjective' | 'photo';
export type ConditionState = 'unknown' | 'pending' | 'inProgress' | 'success' | 'failure';

export class Condition {
  constructor(
    readonly createdAt: Timestamp | FieldValue,
    readonly updatedAt: Timestamp | FieldValue,
    readonly deletedAt: Timestamp | null,
    readonly createdBy: string,
    readonly type: ConditionType,
    readonly attachments: string[],
    readonly state: ConditionState,
    readonly record: string | null,
  ) { }
}

export const conditionConverter: FirestoreDataConverter<Condition> = {
  toFirestore: (condition: Condition) => ({
    createdAt: condition.createdAt,
    updatedAt: condition.updatedAt,
    deletedAt: condition.deletedAt,
    createdBy: condition.createdBy,
    type: condition.type,
    attachments: condition.attachments,
    state: condition.state,
    record: condition.record,
  }),
  fromFirestore: snapshot => new Condition(
    snapshot.get('createdAt') as Timestamp,
    snapshot.get('updatedAt') as Timestamp,
    snapshot.get('deletedAt') as Timestamp | null,
    snapshot.get('createdBy') as string,
    (snapshot.get('type') as ConditionType) ?? 'unknown',
    snapshot.get('attachments') as string[],
    (snapshot.get('state') as ConditionState) ?? 'unknown',
    snapshot.get('record') as string | null,
  ),
};

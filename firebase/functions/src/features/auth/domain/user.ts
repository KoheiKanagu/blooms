import { FieldValue, FirestoreDataConverter, Timestamp } from 'firebase-admin/firestore';

export class User {
  constructor(
    readonly createdAt: Timestamp | FieldValue,
    readonly updatedAt: Timestamp | FieldValue,
    readonly deletedAt: Timestamp | null,
  ) { }
}

export const userConverter: FirestoreDataConverter<User> = {
  toFirestore: (user: User) => ({
    createdAt: user.createdAt,
    updatedAt: user.updatedAt,
    deletedAt: user.deletedAt,
  }),
  fromFirestore: snapshot => new User(
    snapshot.get('createdAt') as Timestamp,
    snapshot.get('updatedAt') as Timestamp,
    snapshot.get('deletedAt') as Timestamp | null,
  ),
};

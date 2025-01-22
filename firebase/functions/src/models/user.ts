import { FieldValue, FirestoreDataConverter, Timestamp } from 'firebase-admin/firestore';

export class User {
  constructor(
    readonly createdAt: Timestamp | FieldValue,
    readonly updatedAt: Timestamp | FieldValue,
    readonly deletedAt: Timestamp | null,
    readonly dailyHighlightTime: UserDailyHighlightTime,
    readonly weatherLocation: string | null,
  ) { }
}

export class UserDailyHighlightTime {
  constructor(
    readonly hour: number,
    readonly minute: number,
  ) { }
}

export const userConverter: FirestoreDataConverter<User> = {
  toFirestore: (user: User) => ({
    createdAt: user.createdAt,
    updatedAt: user.updatedAt,
    deletedAt: user.deletedAt,
    dailyHighlightTime: {
      hour: user.dailyHighlightTime.hour,
      minute: user.dailyHighlightTime.minute,
    },
    weatherLocation: user.weatherLocation,
  }),
  fromFirestore: snapshot => new User(
    snapshot.get('createdAt') as Timestamp,
    snapshot.get('updatedAt') as Timestamp,
    snapshot.get('deletedAt') as Timestamp | null,
    new UserDailyHighlightTime(
      snapshot.get('dailyHighlightTime.hour') as number,
      snapshot.get('dailyHighlightTime.minute') as number,
    ),
    snapshot.get('weatherLocation') as string | null,
  ),
};

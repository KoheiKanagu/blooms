import { FieldValue, FirestoreDataConverter, Timestamp } from 'firebase-admin/firestore';

export class User {
  constructor(
    readonly createdAt: Timestamp | FieldValue,
    readonly updatedAt: Timestamp | FieldValue,
    readonly deletedAt: Timestamp | null,
    readonly endOfDayReportTime: UserEndOfDayReportTime,
    readonly weatherLocation: string | null,
  ) { }
}

export class UserEndOfDayReportTime {
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
    reportTime: user.endOfDayReportTime,
    weatherLocation: user.weatherLocation,
  }),
  fromFirestore: snapshot => new User(
    snapshot.get('createdAt') as Timestamp,
    snapshot.get('updatedAt') as Timestamp,
    snapshot.get('deletedAt') as Timestamp | null,
    new UserEndOfDayReportTime(
      snapshot.get('endOfDayReportTime.hour') as number,
      snapshot.get('endOfDayReportTime.minute') as number,
    ),
    snapshot.get('weatherLocation') as string | null,
  ),
};

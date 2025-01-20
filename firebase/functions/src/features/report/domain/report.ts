import { FieldValue, FirestoreDataConverter, Timestamp } from 'firebase-admin/firestore';

export type ReportType = 'past1day' | 'past7days' | 'past14days' | 'past21days' | 'past28days';
export type ReportState = 'pending' | 'inProgress' | 'success' | 'failure';

export interface ReportContent {
  subjectiveConditionTendency: string | null;
  objectiveConditionTendency: string | null;
  analysisResult: string | null;
  advice: string | null;
}

export class Report {
  constructor(
    readonly createdAt: Timestamp | FieldValue,
    readonly updatedAt: Timestamp | FieldValue,
    readonly deletedAt: Timestamp | null,
    readonly subjectUid: string,
    readonly startAt: Timestamp,
    readonly prompt: string | null,
    readonly type: ReportType = 'past1day',
    readonly content: ReportContent | null,
    readonly state: ReportState = 'pending',
  ) { }
}

export const reportConverter: FirestoreDataConverter<Report> = {
  toFirestore: (report: Report) => ({
    createdAt: report.createdAt,
    updatedAt: report.updatedAt,
    deletedAt: report.deletedAt,
    subjectUid: report.subjectUid,
    startAt: report.startAt,
    prompt: report.prompt,
    type: report.type,
    content: report.content,
    state: report.state,
  }),
  fromFirestore: snapshot => new Report(
    snapshot.get('createdAt') as Timestamp,
    snapshot.get('updatedAt') as Timestamp,
    snapshot.get('deletedAt') as Timestamp | null,
    snapshot.get('subjectUid') as string,
    snapshot.get('startAt') as Timestamp,
    snapshot.get('prompt') as string | null,
    (snapshot.get('type') as ReportType) ?? 'past1day',
    snapshot.get('content') as ReportContent | null,
    (snapshot.get('state') as ReportState) ?? 'pending',
  ),
};

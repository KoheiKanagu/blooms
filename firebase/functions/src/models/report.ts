import { FieldValue, FirestoreDataConverter, Timestamp } from 'firebase-admin/firestore';

export type ReportType = 'last1day' | 'last7days' | 'last14days' | 'last21days' | 'last28days';
export type ReportState = 'pending' | 'inProgress' | 'success' | 'failure';

export class Report {
  constructor(
    readonly createdAt: Timestamp | FieldValue,
    readonly updatedAt: Timestamp | FieldValue,
    readonly deletedAt: Timestamp | null,
    readonly subjectUid: string,
    readonly targetDate: Timestamp,
    readonly prompt: string | null,
    readonly type: ReportType = 'last1day',
    readonly subjectiveConditionTendency: string,
    readonly objectiveConditionTendency: string,
    readonly analysisResult: string,
    readonly advice: string,
    readonly state: ReportState = 'pending',
  ) { }
}

export const reportConverter: FirestoreDataConverter<Report> = {
  toFirestore: (report: Report) => ({
    createdAt: report.createdAt,
    updatedAt: report.updatedAt,
    deletedAt: report.deletedAt,
    subjectUid: report.subjectUid,
    targetDate: report.targetDate,
    prompt: report.prompt,
    type: report.type,
    subjectiveConditionTendency: report.subjectiveConditionTendency,
    objectiveConditionTendency: report.objectiveConditionTendency,
    analysisResult: report.analysisResult,
    advice: report.advice,
    state: report.state,
  }),
  fromFirestore: snapshot => new Report(
    snapshot.get('createdAt') as Timestamp,
    snapshot.get('updatedAt') as Timestamp,
    snapshot.get('deletedAt') as Timestamp | null,
    snapshot.get('subjectUid') as string,
    snapshot.get('targetDate') as Timestamp,
    snapshot.get('prompt') as string | null,
    (snapshot.get('type') as ReportType) ?? 'last1day',
    snapshot.get('subjectiveConditionTendency') as string,
    snapshot.get('objectiveConditionTendency') as string,
    snapshot.get('analysisResult') as string,
    snapshot.get('advice') as string,
    (snapshot.get('state') as ReportState) ?? 'pending',
  ),
};

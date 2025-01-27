import { FieldValue, FirestoreDataConverter, Timestamp } from 'firebase-admin/firestore';

export type HighlightType = 'past1day' | 'past7days' | 'past14days' | 'past21days' | 'past28days';
export type HighlightStyle = 'forOwn' | 'forProfessional';
export type HighlightState = 'pending' | 'inProgress' | 'success' | 'failure';

export interface HighlightContent {
  subjectiveTrend: string;
  objectiveTrend: string;
  analysisResult: string;
  advice: string;
  abstract: string;
}

export class Highlight {
  constructor(
    readonly createdAt: Timestamp | FieldValue,
    readonly updatedAt: Timestamp | FieldValue,
    readonly deletedAt: Timestamp | null,
    readonly subjectUid: string,
    readonly startAt: Timestamp,
    readonly prompt: string | null,
    readonly type: HighlightType = 'past1day',
    readonly style: HighlightStyle = 'forOwn',
    readonly content: HighlightContent | null,
    readonly state: HighlightState = 'pending',
  ) { }
}

export const highlightConverter: FirestoreDataConverter<Highlight> = {
  toFirestore: (highlight: Highlight) => ({
    createdAt: highlight.createdAt,
    updatedAt: highlight.updatedAt,
    deletedAt: highlight.deletedAt,
    subjectUid: highlight.subjectUid,
    startAt: highlight.startAt,
    prompt: highlight.prompt,
    type: highlight.type,
    content: highlight.content,
    state: highlight.state,
  }),
  fromFirestore: snapshot => new Highlight(
    snapshot.get('createdAt') as Timestamp,
    snapshot.get('updatedAt') as Timestamp,
    snapshot.get('deletedAt') as Timestamp | null,
    snapshot.get('subjectUid') as string,
    snapshot.get('startAt') as Timestamp,
    snapshot.get('prompt') as string | null,
    (snapshot.get('type') as HighlightType) ?? 'past1day',
    (snapshot.get('style') as HighlightStyle) ?? 'forOwn',
    snapshot.get('content') as HighlightContent | null,
    (snapshot.get('state') as HighlightState) ?? 'pending',
  ),
};

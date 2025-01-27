import { FieldValue, FirestoreDataConverter, Timestamp } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions';

export type HighlightType = 'past1day' | 'past7days' | 'past14days' | 'past21days' | 'past28days';
export type HighlightStyle = 'forOwn' | 'forProfessional';
export type HighlightState = 'pending' | 'inProgress' | 'success' | 'failure';

export interface HighlightContentForOwn {
  style: HighlightStyle;
  subjectiveTrend: string;
  objectiveTrend: string;
  analysisResult: string;
  advice: string;
  abstract: string;
}

export interface HighlightContentForProfessional {
  style: HighlightStyle;
  analysisResults: string[];
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
    readonly content: HighlightContentForOwn | HighlightContentForProfessional | null,
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
    highlightContentConverter(snapshot.get('content') as Record<string, unknown>),
    (snapshot.get('state') as HighlightState) ?? 'pending',
  ),
};

function highlightContentConverter(value: Record<string, unknown>): HighlightContentForOwn | HighlightContentForProfessional | null {
  if (value == null) {
    return null;
  }

  const style = value['style'] as HighlightStyle | null;

  switch (style) {
    case 'forOwn':
      return {
        style: style,
        subjectiveTrend: value['subjectiveTrend'] as string,
        objectiveTrend: value['objectiveTrend'] as string,
        analysisResult: value['analysisResult'] as string,
        advice: value['advice'] as string,
        abstract: value['abstract'] as string,
      };
    case 'forProfessional':
      return {
        style: style,
        analysisResults: value['analysisResults'] as string[],
        abstract: value['abstract'] as string,
      };
    default:
      logger.error(`Invalid style: ${style}`);
      return null;
  }
}

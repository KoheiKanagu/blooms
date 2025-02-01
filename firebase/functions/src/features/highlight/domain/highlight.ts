import { FieldValue, FirestoreDataConverter, Timestamp } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions';

export type HighlightPeriod = 'past1day' | 'past7days' | 'past14days' | 'past21days' | 'past28days';
export type HighlightType = 'summary' | 'empty';
export type HighlightState = 'pending' | 'inProgress' | 'success' | 'failure';

export interface HighlightContentSummary {
  style: 'summary';
  startAt: Timestamp;
  period: HighlightPeriod;
  summary: string;
  abstract: string;
  state: HighlightState;
  promptFileUri: string | null;
}

export interface HighlightContentEmpty {
  style: 'empty';
}

export class Highlight {
  constructor(
    readonly createdAt: Timestamp | FieldValue,
    readonly updatedAt: Timestamp | FieldValue,
    readonly deletedAt: Timestamp | null,
    readonly subjectUid: string,
    readonly content: HighlightContentSummary | HighlightContentEmpty,
  ) { }
}

export const highlightConverter: FirestoreDataConverter<Highlight> = {
  toFirestore: (highlight: Highlight) => ({
    createdAt: highlight.createdAt,
    updatedAt: highlight.updatedAt,
    deletedAt: highlight.deletedAt,
    subjectUid: highlight.subjectUid,
    content: highlight.content,
  }),
  fromFirestore: snapshot => new Highlight(
    snapshot.get('createdAt') as Timestamp,
    snapshot.get('updatedAt') as Timestamp,
    snapshot.get('deletedAt') as Timestamp | null,
    snapshot.get('subjectUid') as string,
    highlightContentConverter(snapshot.get('content') as Record<string, unknown>),
  ),
};

function highlightContentConverter(value: Record<string, unknown>): HighlightContentSummary | HighlightContentEmpty {
  if (value == null) {
    return {
      style: 'empty',
    };
  }

  const style = value['style'] as HighlightType | null;

  switch (style) {
    case 'summary':
      return {
        style: style,
        startAt: value['startAt'] as Timestamp,
        period: value['period'] as HighlightPeriod,
        summary: value['summary'] as string,
        abstract: value['abstract'] as string,
        state: value['state'] as HighlightState,
        promptFileUri: value['promptFileUri'] as string | null,
      };
    default:
      logger.error(`Invalid style: ${style}`);
      return {
        style: 'empty',
      };
  }
}

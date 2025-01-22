import { logger } from 'firebase-functions';
import { onDocumentCreated } from 'firebase-functions/firestore';
import { CollectionPath } from '../../utils/collectionPath';
import { updateHighlightContent } from './application/updateHighlightContent';
import { highlightConverter } from './domain/highlight';

/**
 * Highlightドキュメントが作成されたとき、生成モデルでConditionsを解析してハイライトの内容を作成する。
 */
export const onHighlightDocumentCreated = onDocumentCreated(`${CollectionPath.REPORTS}/{documentId}`, async (event) => {
  const snapshot = event.data;
  if (snapshot == undefined) {
    logger.error(`Snapshot is undefined. Skip processing.`);
    return;
  }

  const highlight = highlightConverter.fromFirestore(snapshot);

  // highlight.startAtでハイライト作成開始時刻を検証しているので、highlight.typeは気にしなくても良い
  await updateHighlightContent(snapshot.ref, highlight);
});

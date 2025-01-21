import { logger } from 'firebase-functions';
import { onDocumentCreated } from 'firebase-functions/firestore';
import { CollectionPath } from '../../utils/collectionPath';
import { updateReportContent } from './application/updateReportContent';
import { reportConverter } from './domain/report';

/**
 * Reportドキュメントが作成されたとき、生成モデルでConditionsを解析してレポートの内容を作成する。
 */
export const onReportDocumentCreated = onDocumentCreated(`${CollectionPath.REPORTS}/{documentId}`, async (event) => {
  const snapshot = event.data;
  if (snapshot == undefined) {
    logger.error(`Snapshot is undefined. Skip processing.`);
    return;
  }

  const report = reportConverter.fromFirestore(snapshot);

  // report.startAtでレポート作成開始時刻を検証しているので、report.typeは気にしなくても良い
  await updateReportContent(snapshot.ref, report);
});

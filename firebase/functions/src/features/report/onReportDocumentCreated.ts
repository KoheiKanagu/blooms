import { logger } from 'firebase-functions';
import { onDocumentCreated } from 'firebase-functions/firestore';
import { CollectionPath } from '../../utils/collectionPath';
import { createGeminiReport } from './application/reportService';
import { reportConverter } from './domain/report';

export const onReportDocumentCreated = onDocumentCreated(`${CollectionPath.REPORTS}/{documentId}`, async (event) => {
  const snapshot = event.data;
  if (snapshot == undefined) {
    logger.error(`Snapshot is undefined. Skip processing.`);
    return;
  }

  const report = reportConverter.fromFirestore(snapshot);
  await createGeminiReport(snapshot.ref, report);
});

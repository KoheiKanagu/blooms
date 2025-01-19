import { logger } from 'firebase-functions';
import { onDocumentCreated } from 'firebase-functions/firestore';
import { reportConverter } from './models/report';
import { createGeminiReport } from './services/reportService';
import { CollectionPath } from './utils/collectionPath';

export const onReportDocumentCreated = onDocumentCreated(`${CollectionPath.REPORTS}/{documentId}`, async (event) => {
  const snapshot = event.data;
  if (snapshot == undefined) {
    logger.error(`Snapshot is undefined. Skip processing.`);
    return;
  }

  const report = reportConverter.fromFirestore(snapshot);
  await createGeminiReport(report);
});

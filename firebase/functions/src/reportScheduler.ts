import { getFirestore, Timestamp } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions';
import { onSchedule } from 'firebase-functions/scheduler';
import { reportConverter } from './models/report';
import { createGeminiReport } from './services/reportService';
import { CollectionPath } from './utils/collectionPath';

export const reportScheduler = onSchedule({
  schedule: 'every 15 minutes from 20:00 to 23:45',
  timeoutSeconds: 540,
  timeZone: 'Asia/Tokyo',
}, async () => {
  const query = getFirestore().collection(CollectionPath.REPORTS)
    .withConverter(reportConverter)
    .where('deletedAt', '==', null)
    .where('state', '==', 'pending')
    .where('startAt', '<=', Timestamp.now())
    .orderBy('createdAt')
    .limit(1);

  // 1つずつReportを処理
  let nextReport = await query.get();
  logger.info(`First report id: ${nextReport.docs[0]?.id}`);
  do {
    const doc = nextReport.docs[0];
    if (doc == null) {
      logger.warn('No report found.');
      break;
    }

    const report = doc.data();

    await createGeminiReport(doc.ref, report);

    // 次のReportを取得
    nextReport = await query.startAfter(doc).get();
    logger.info(`Next report id: ${nextReport.docs[0]?.id}`);
  } while (nextReport.empty === false);
});

import { getFirestore, Timestamp } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions';
import { onSchedule } from 'firebase-functions/scheduler';
import { CollectionPath } from '../../utils/collectionPath';
import { createNextDailyReport } from './application/createNextDailyReport';
import { updateReportContent } from './application/updateReportContent';
import { reportConverter } from './domain/report';

/**
 * デイリーのレポートを作成する
 *
 * ユーザが選択した30分刻みの希望時刻に合わせて実行する
 * もし30分以内に処理できなかった場合は次回の実行時刻に処理されることになる
 */
export const onReportSchedule = onSchedule({
  schedule: 'every 30 minutes from 20:00 to 0:00',
  timeoutSeconds: 29 * 60, // 29分
  timeZone: 'Asia/Tokyo',
}, async () => {
  // 処理時間を計測する
  const startTime = Date.now();
  const maxDuration = 8 * 60 * 1000; // 8 minutes in milliseconds

  // 対象のReportを探す
  const query = getFirestore()
    .collection(CollectionPath.REPORTS)
    .withConverter(reportConverter)
    .where('deletedAt', '==', null)
    .where('state', '==', 'pending')
    .where('startAt', '<=', Timestamp.now())
    .where('type', '==', 'past1day')
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

    try {
      // contentを更新
      await updateReportContent(doc.ref, report);

      // 次の日のデイリーレポートを作成
      await createNextDailyReport(report.subjectUid, report.startAt);
    } catch (error) {
      logger.error(`Failed to process report: ${doc.id}`, error);
    }

    // Check elapsed time
    const elapsedTime = Date.now() - startTime;
    if (elapsedTime > maxDuration) {
      // タイムアウトになりそうなことを検出できるようにログに残す
      logger.error('Processing time exceeded 8 minutes.');
    }

    // 次のReportを取得
    nextReport = await query.startAfter(doc).get();
    const nextReportId = nextReport.docs[0]?.id;
    logger.info(`Next report id: ${nextReportId}`, {
      nextReportId,
    });
  } while (nextReport.empty === false);
});

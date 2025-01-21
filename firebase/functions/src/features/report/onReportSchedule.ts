import { FieldValue, getFirestore, Timestamp } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions';
import { onSchedule } from 'firebase-functions/scheduler';
import { userConverter } from '../../models/user';
import { CollectionPath } from '../../utils/collectionPath';
import { outSensitiveLog } from '../../utils/sensitive_log';
import { createGeminiReport } from './application/reportApplications';
import { Report, reportConverter } from './domain/report';

/**
 * デイリーのレポートを作成する
 *
 * ユーザが選択した30分刻みの希望時刻に合わせて実行する
 * もし30分以内に処理できなかった場合は次回の実行時刻に処理されることになる
 */
export const onReportSchedule = onSchedule({
  schedule: 'every 30 minutes from 20:00 to 24:00',
  timeoutSeconds: 29 * 60, // 29分
  timeZone: 'Asia/Tokyo',
}, async () => {
  // 処理時間を計測する
  const startTime = Date.now();
  const maxDuration = 8 * 60 * 1000; // 8 minutes in milliseconds

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
      await createGeminiReport(doc.ref, report);
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

/**
 * 次の日のレポートを作成する
 * @param subjectUid レポートの対象ユーザのUID
 * @param lastStartAt 前回のレポートの開始時刻
 * @returns
 */
async function createNextDailyReport(subjectUid: string, lastStartAt: Timestamp): Promise<void> {
  const user = await getFirestore()
    .collection(CollectionPath.USERS)
    .withConverter(userConverter)
    .doc(subjectUid)
    .get()
    .then(e => e.data());

  if (user == undefined) {
    logger.error(`User is undefined. Skip processing.`);
    return;
  }

  const hour = user.endOfDayReportTime.hour;
  const minute = user.endOfDayReportTime.minute;

  // lastStartAtの次の日のhourとminuteの時刻
  const nextStartAt = new Date(lastStartAt.toDate());
  nextStartAt.setDate(nextStartAt.getDate() + 1);
  nextStartAt.setHours(hour, minute);
  logger.info(`Create next report at ${nextStartAt.toISOString()} for ${subjectUid}`, {
    subjectUid,
    nextStartAt: nextStartAt.toISOString(),
    lastStartAt: lastStartAt.toDate().toISOString(),
  });

  const newReport: Report = {
    createdAt: FieldValue.serverTimestamp(),
    updatedAt: FieldValue.serverTimestamp(),
    deletedAt: null,
    subjectUid: subjectUid,
    startAt: Timestamp.fromDate(nextStartAt),
    prompt: null,
    type: 'past1day',
    content: null,
    state: 'pending',
  };

  const result = await getFirestore()
    .collection(CollectionPath.REPORTS)
    .withConverter(reportConverter)
    .add(newReport);

  outSensitiveLog('Create next report', {
    documentId: result.id,
    subjectUid,
    newReport: newReport,
  });
}

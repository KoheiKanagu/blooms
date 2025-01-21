import { FieldValue, Timestamp } from '@google-cloud/firestore';
import { getFirestore } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions';
import { userConverter } from '../../../models/user';
import { CollectionPath } from '../../../utils/collectionPath';
import { outSensitiveLog } from '../../../utils/sensitive_log';
import { Report, reportConverter } from '../domain/report';

/**
 * 次の日のレポートを作成する
 * @param subjectUid レポートの対象ユーザのUID
 * @param lastStartAt 前回のレポートの開始時刻
 * @returns
 */
export async function createNextDailyReport(subjectUid: string, lastStartAt: Timestamp): Promise<void> {
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
  nextStartAt.setHours(hour, minute, 0, 0);
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

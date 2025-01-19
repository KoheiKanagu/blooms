import { DocumentData, DocumentReference, getFirestore } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions';
import { Condition, conditionConverter } from '../models/condition';
import { Report, reportConverter, ReportState } from '../models/report';
import { CollectionPath } from '../utils/collectionPath';

export async function createGeminiReport(
  documentReference: DocumentReference<DocumentData>,
  report: Report,
): Promise<void> {
  // stateがpendingでない場合は処理をスキップ
  if (report.state !== 'pending') {
    logger.info(`Report state is not 'pending'. Skip processing.`, { report });
    return;
  }

  // startAtを過ぎていない場合は処理をスキップ
  const startAt = report.startAt.toDate();
  const now = new Date();
  if (startAt > now) {
    logger.info(`Report startAt is not passed. Skip processing.`, { report });
    return;
  }

  // ReportのstateをinProgressに更新
  await updateReportState(documentReference, 'inProgress');

  try {
    const { startDate, endDate } = getDateRange(
      report.type,
      startAt,
    );

    const conditions = await getFirestore()
      .collection(CollectionPath.CONDITIONS)
      .withConverter(conditionConverter)
      .where('deletedAt', '==', null)
      .where('createdBy', '==', report.subjectUid)
      .where('state', '==', 'success')
      .orderBy('createdAt', 'desc')
      // 対象の範囲
      .where('createdAt', '>=', startDate)
      .where('createdAt', '<=', endDate)
      .get()
      .then(e => e.docs.map(e => e.data()));

    // Geminiにリクエストを送信
    const newReport = await requestGemini(conditions, report);

    // 結果を保存
    await documentReference.update(
      reportConverter.toFirestore(newReport),
    );
  } catch (error) {
    logger.error(`Failed to create Gemini report.`, { report, error });
    await updateReportState(documentReference, 'failure');
    return;
  }
}

async function requestGemini(conditions: Condition[], report: Report): Promise<Report> {
  // Geminiにリクエストを送信

  return report;
}

// stateをアップデート
async function updateReportState(
  documentReference: DocumentReference<DocumentData>,
  state: ReportState,
): Promise<void> {
  await documentReference.update({
    state,
  });
}

// conditionsを探すための日付範囲を取得
export function getDateRange(reportType: string, startAt: Date): {
  startDate: Date;
  endDate: Date;
} {
  let startDate: Date;
  switch (reportType) {
    case 'past1day':
      startDate = new Date(startAt.getFullYear(), startAt.getMonth(), startAt.getDate(), 0, 0, 0);
      break;
    case 'past7days':
      startDate = new Date(startAt.getFullYear(), startAt.getMonth(), startAt.getDate() - 6, 0, 0, 0);
      break;
    case 'past14days':
      startDate = new Date(startAt.getFullYear(), startAt.getMonth(), startAt.getDate() - 13, 0, 0, 0);
      break;
    case 'past21days':
      startDate = new Date(startAt.getFullYear(), startAt.getMonth(), startAt.getDate() - 20, 0, 0, 0);
      break;
    case 'past28days':
      startDate = new Date(startAt.getFullYear(), startAt.getMonth(), startAt.getDate() - 27, 0, 0, 0);
      break;
    default:
      throw new Error(`Unknown report type: ${reportType}`);
  }

  const endDate = new Date(startAt.getFullYear(), startAt.getMonth(), startAt.getDate(), 23, 59, 59);

  return {
    startDate,
    endDate,
  };
}

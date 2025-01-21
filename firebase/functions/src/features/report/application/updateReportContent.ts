import { DocumentData, DocumentReference, FieldValue, getFirestore } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions';
import { conditionConverter } from '../../../models/condition';
import { CollectionPath } from '../../../utils/collectionPath';
import { outSensitiveLog } from '../../../utils/sensitive_log';
import { Report, reportConverter } from '../domain/report';
import { requestGenerativeModel } from './requestGenerativeModel';
import { updateReportState } from './updateReportState';

/**
 * レポートのcontentを更新する
 *
 * @param documentReference
 * @param report
 * @returns
 */
export async function updateReportContent(
  documentReference: DocumentReference<DocumentData>,
  report: Report,
): Promise<void> {
  if (shouldSkipProcessing(report)) {
    return;
  }

  try {
    // ReportのstateをinProgressに更新
    await updateReportState(documentReference, 'inProgress');

    // 解析の対処となるConditionsの範囲
    const { startDate, endDate } = getDateRange(
      report.type,
      report.startAt.toDate(),
    );

    // 解析対象のConditionsを探す
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
    outSensitiveLog(`conditions`, conditions);

    // 生成モデルにリクエストを送信
    const { content, prompt } = await requestGenerativeModel(conditions);
    const updatedReport: Report = {
      ...report,
      content: content,
      state: 'success',
      updatedAt: FieldValue.serverTimestamp(),
      prompt: prompt,
    };
    outSensitiveLog(`updatedReport`, updatedReport);

    // 結果を保存
    await documentReference.update(
      reportConverter.toFirestore(updatedReport),
    );
  } catch (error) {
    logger.error(`Failed to create report content.`, {
      report,
      // errorをそのまま渡すとなぜか空で出力されるのでStringにする
      error: String(error),
    });

    // Reportのstateをfailureに変更
    await updateReportState(documentReference, 'failure');

    throw error;
  }
}

/**
 * 処理をスキップするかどうか
 *
 * @param report
 * @returns
 */
function shouldSkipProcessing(report: Report): boolean {
  // stateがpendingでない場合は処理をスキップ
  if (report.state !== 'pending') {
    logger.info(`Report state is not 'pending'. Skip processing.`, { report });
    return true;
  }

  // startAtを過ぎていない場合は処理をスキップ
  const startAt = report.startAt.toDate();
  const now = new Date();
  if (startAt > now) {
    logger.info(`Report startAt is not passed. Skip processing.`, { report });
    return true;
  }

  return false;
}

/**
 * conditionsを探すための日付範囲を取得
 *
 * @param reportType
 * @param startAt
 * @returns
 */
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

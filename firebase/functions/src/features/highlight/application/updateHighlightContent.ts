import { DocumentData, DocumentReference, FieldValue, getFirestore } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions';
import { conditionConverter } from '../../../condition/domain/condition';
import { CollectionPath } from '../../../utils/collectionPath';
import { outSensitiveLog } from '../../../utils/sensitive_log';
import { Highlight, HighlightContentSummary, highlightConverter, HighlightPeriod } from '../domain/highlight';
import { requestGenerativeModel } from './requestGenerativeModel';
import { updateHighlightContentState } from './updateHighlightContentState';

/**
 * ハイライトのcontentを更新する
 *
 * @param documentReference
 * @param highlight
 * @returns
 */
export async function updateHighlightContent(
  documentReference: DocumentReference<DocumentData>,
  highlight: Highlight,
): Promise<void> {
  if (shouldSkipProcessing(highlight)) {
    return;
  }

  try {
    const content = highlight.content as HighlightContentSummary;
    // HighlightContentのstateをinProgressに更新
    await updateHighlightContentState(documentReference, 'inProgress');

    // 解析の対処となるConditionsの範囲
    const { startDate, endDate } = getDateRange(
      content.period,
      content.startAt.toDate(),
    );

    // 解析対象のConditionsを探す
    const conditions = await getFirestore()
      .collection(CollectionPath.CONDITIONS)
      .withConverter(conditionConverter)
      .where('deletedAt', '==', null)
      .where('subjectUid', '==', highlight.subjectUid)
      .orderBy('createdAt', 'desc')
      // 対象の範囲
      .where('createdAt', '>=', startDate)
      .where('createdAt', '<=', endDate)
      .get()
      .then(e => e.docs.map(e => e.data()));
    outSensitiveLog(`conditions`, conditions);

    // 生成モデルにリクエストを送信
    const newContent = await requestGenerativeModel(
      highlight.subjectUid,
      conditions,
      content,
    );
    const updatedHighlight: Highlight = {
      ...highlight,
      content: newContent,
      updatedAt: FieldValue.serverTimestamp(),
    };
    outSensitiveLog(`updatedHighlight`, updatedHighlight);

    // 結果を保存
    await documentReference.update(
      highlightConverter.toFirestore(updatedHighlight),
    );
  } catch (error) {
    logger.error(`Failed to create highlight content.`, {
      highlight,
      // errorをそのまま渡すとなぜか空で出力されるのでStringにする
      error: String(error),
    });

    // Highlightのstateをfailureに変更
    await updateHighlightContentState(documentReference, 'failure');

    throw error;
  }
}

/**
 * 処理をスキップするかどうか
 *
 * @param highlight
 * @returns
 */
function shouldSkipProcessing(highlight: Highlight): boolean {
  if (highlight.content.style !== 'summary') {
    logger.error(`Highlight style is invalid.`, { highlight });
    return true;
  }

  // stateがpendingでない場合は処理をスキップ
  if (highlight.content.state !== 'pending') {
    logger.info(`Highlight state is not 'pending'. Skip processing.`, { highlight });
    return true;
  }

  // startAtを過ぎていない場合は処理をスキップ
  const startAt = highlight.content.startAt.toDate();
  const now = new Date();
  if (startAt > now) {
    logger.info(`Highlight startAt is not passed. Skip processing.`, { highlight });
    return true;
  }

  return false;
}

/**
 * conditionsを探すための日付範囲を取得
 *
 * @param period
 * @param startAt
 * @returns
 */
export function getDateRange(period: HighlightPeriod, startAt: Date): {
  startDate: Date;
  endDate: Date;
} {
  let startDate: Date;
  switch (period) {
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
  }

  const endDate = new Date(startAt.getFullYear(), startAt.getMonth(), startAt.getDate(), 23, 59, 59);

  return {
    startDate,
    endDate,
  };
}

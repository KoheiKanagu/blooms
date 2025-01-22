import { DocumentData, DocumentReference, FieldValue, getFirestore } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions';
import { conditionConverter } from '../../../models/condition';
import { CollectionPath } from '../../../utils/collectionPath';
import { outSensitiveLog } from '../../../utils/sensitive_log';
import { Highlight, highlightConverter } from '../domain/highlight';
import { requestGenerativeModel } from './requestGenerativeModel';
import { updateHighlightState } from './updateHighlightState';

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
    // HighlightのstateをinProgressに更新
    await updateHighlightState(documentReference, 'inProgress');

    // 解析の対処となるConditionsの範囲
    const { startDate, endDate } = getDateRange(
      highlight.type,
      highlight.startAt.toDate(),
    );

    // 解析対象のConditionsを探す
    const conditions = await getFirestore()
      .collection(CollectionPath.CONDITIONS)
      .withConverter(conditionConverter)
      .where('deletedAt', '==', null)
      .where('createdBy', '==', highlight.subjectUid)
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
    const updatedHighlight: Highlight = {
      ...highlight,
      content: content,
      state: 'success',
      updatedAt: FieldValue.serverTimestamp(),
      prompt: prompt,
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
    await updateHighlightState(documentReference, 'failure');

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
  // stateがpendingでない場合は処理をスキップ
  if (highlight.state !== 'pending') {
    logger.info(`Highlight state is not 'pending'. Skip processing.`, { highlight });
    return true;
  }

  // startAtを過ぎていない場合は処理をスキップ
  const startAt = highlight.startAt.toDate();
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
 * @param highlightType
 * @param startAt
 * @returns
 */
export function getDateRange(highlightType: string, startAt: Date): {
  startDate: Date;
  endDate: Date;
} {
  let startDate: Date;
  switch (highlightType) {
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
      throw new Error(`Unknown highlight type: ${highlightType}`);
  }

  const endDate = new Date(startAt.getFullYear(), startAt.getMonth(), startAt.getDate(), 23, 59, 59);

  return {
    startDate,
    endDate,
  };
}

import { getFirestore, Timestamp } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions';
import { onSchedule } from 'firebase-functions/scheduler';
import { CollectionPath } from '../../utils/collectionPath';
import { createNextDailyHighlight } from './application/createNextDailyHighlight';
import { updateHighlightContent } from './application/updateHighlightContent';
import { highlightConverter } from './domain/highlight';

/**
 * デイリーのハイライトを作成する
 *
 * ユーザが選択した30分刻みの希望時刻に合わせて実行する
 * もし30分以内に処理できなかった場合は次回の実行時刻に処理されることになる
 */
export const onHighlightSchedule = onSchedule({
  schedule: '*/30 0,20-23 * * *', // 20時~0時の間、30分毎に実行
  timeoutSeconds: 29 * 60, // 29分
  timeZone: 'Asia/Tokyo',
}, async () => {
  // 処理時間を計測する
  const startTime = Date.now();
  const maxDuration = 8 * 60 * 1000; // 8 minutes in milliseconds

  // 対象のHighlightを探す
  const query = getFirestore()
    .collection(CollectionPath.HIGHLIGHTS)
    .withConverter(highlightConverter)
    .where('deletedAt', '==', null)
    .where('state', '==', 'pending')
    .where('startAt', '<=', Timestamp.now())
    .where('type', '==', 'past1day')
    .orderBy('createdAt')
    .limit(1);

  // 1つずつHighlightを処理
  let nextHighlight = await query.get();
  logger.info(`First highlight id: ${nextHighlight.docs[0]?.id}`);

  do {
    const doc = nextHighlight.docs[0];
    if (doc == null) {
      logger.warn('No highlight found.');
      break;
    }

    const highlight = doc.data();

    try {
      // contentを更新
      await updateHighlightContent(doc.ref, highlight);

      // 次の日のデイリーハイライトを作成
      await createNextDailyHighlight(highlight.subjectUid, highlight.startAt);
    } catch (error) {
      logger.error(`Failed to process highlight: ${doc.id}`, error);
    }

    // Check elapsed time
    const elapsedTime = Date.now() - startTime;
    if (elapsedTime > maxDuration) {
      // タイムアウトになりそうなことを検出できるようにログに残す
      logger.error('Processing time exceeded 8 minutes.');
    }

    // 次のHighlightを取得
    nextHighlight = await query.startAfter(doc).get();
    const nextHighlightId = nextHighlight.docs[0]?.id;
    logger.info(`Next highlight id: ${nextHighlightId}`, {
      nextHighlightId,
    });
  } while (nextHighlight.empty === false);
});

import { FieldValue, Timestamp } from '@google-cloud/firestore';
import { getFirestore } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions';
import { userConverter } from '../../../models/user';
import { CollectionPath } from '../../../utils/collectionPath';
import { outSensitiveLog } from '../../../utils/sensitive_log';
import { Highlight, highlightConverter } from '../domain/highlight';

/**
 * 次の日のハイライトを作成する
 * @param subjectUid ハイライトの対象ユーザのUID
 * @param lastStartAt 前回のハイライトの開始時刻
 * @returns
 */
export async function createNextDailyHighlight(subjectUid: string, lastStartAt: Timestamp): Promise<void> {
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

  const hour = user.dailyHighlightTime.hour;
  const minute = user.dailyHighlightTime.minute;

  // lastStartAtの次の日のhourとminuteの時刻
  const nextStartAt = new Date(lastStartAt.toDate());
  nextStartAt.setDate(nextStartAt.getDate() + 1);
  nextStartAt.setHours(hour, minute, 0, 0);
  logger.info(`Create next highlight at ${nextStartAt.toISOString()} for ${subjectUid}`, {
    subjectUid,
    nextStartAt: nextStartAt.toISOString(),
    lastStartAt: lastStartAt.toDate().toISOString(),
  });

  const newHighlight: Highlight = {
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
    .collection(CollectionPath.HIGHLIGHTS)
    .withConverter(highlightConverter)
    .add(newHighlight);

  outSensitiveLog('Create next highlight', {
    documentId: result.id,
    subjectUid,
    newHighlight: newHighlight,
  });
}

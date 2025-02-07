import { FieldValue, getFirestore } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions/v1';
import { functionsV1 } from '../..';
import { CollectionPath } from '../../utils/collectionPath';
import { Condition, conditionConverter } from '../condition/domain/condition';
import { User, userConverter } from './domain/user';

export const onCreateAuthUser = functionsV1()
  .auth
  .user()
  .onCreate(async (user, context) => {
    logger.info('uid', user.uid);

    const eventAgeMs = Date.now() - Date.parse(context.timestamp);
    const eventMaxAgeMs = 1000 * 60 * 3; // 3 minutes
    if (eventAgeMs > eventMaxAgeMs) {
      console.warn(`Dropping event ${context.eventId} with age[ms]: ${eventAgeMs}`);
      return;
    }

    const data = new User(
      FieldValue.serverTimestamp(),
      FieldValue.serverTimestamp(),
      null,
    );

    await getFirestore()
      .collection(CollectionPath.USERS)
      .withConverter(userConverter)
      .doc(user.uid)
      .create(data)
      .catch((error) => {
        logger.warn(error);
      });

    // イントロコンテンツを作成
    const newIntroCondition: Condition = {
      createdAt: FieldValue.serverTimestamp(),
      updatedAt: FieldValue.serverTimestamp(),
      deletedAt: null,
      subjectUid: user.uid,
      creatorType: 'model',
      createdAtIso8601: null,
      content: {
        type: 'text',
        text: `はじめまして、BLOOMSです。
私は、妊婦の方の体調に関する記録を支援するパーソナルアシスタントです。

まずは、あなたの今の体調を記録してみましょう。
体調を記録すると、あなたに合った情報を提供することができます。`,
      },
    };

    await getFirestore()
      .collection(CollectionPath.CONDITIONS)
      .doc()
      .withConverter(conditionConverter)
      .create(newIntroCondition)
      .catch((error) => {
        logger.warn(error);
      });
  });

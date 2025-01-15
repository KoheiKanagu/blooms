import { firestore } from 'firebase-admin';
import { FieldValue } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions/v1';
import { functions } from '.';
import { User, userConverter, UserEndOfDayReportTime } from './models/user';
import { CollectionPath } from './utils/collectionPath';

export const onCreateAuthUser = functions()
  .auth
  .user()
  .onCreate(async (user, context) => {
    logger.info('uid', user.uid);

    const eventAgeMs = Date.now() - Date.parse(context.timestamp);
    const eventMaxAgeMs = 1000 * 60 * 3; // 3 minutes
    if (eventAgeMs > eventMaxAgeMs) {
      logger.error('Event is too old to process.');
      return;
    }

    const data = new User(
      FieldValue.serverTimestamp(),
      FieldValue.serverTimestamp(),
      null,
      new UserEndOfDayReportTime(11, 0), // 20:00 JST
      null,
    );

    await firestore()
      .collection(CollectionPath.USERS)
      .withConverter(userConverter)
      .doc(user.uid)
      .create(data)
      .catch((error) => {
        logger.warn(error);
      });
  });

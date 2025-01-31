import { firestore } from 'firebase-admin';
import { FieldValue } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions/v1';
import { functionsV1 } from '.';
import { User, userConverter } from './models/user';
import { CollectionPath } from './utils/collectionPath';

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

    await firestore()
      .collection(CollectionPath.USERS)
      .withConverter(userConverter)
      .doc(user.uid)
      .create(data)
      .catch((error) => {
        logger.warn(error);
      });
  });

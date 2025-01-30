import { getAuth } from 'firebase-admin/auth';
import { getFirestore } from 'firebase-admin/firestore';
import { onSchedule } from 'firebase-functions/scheduler';
import { CollectionPath } from '../../../utils/collectionPath';

/**
 * users_v1コレクションでdeletedAtが経過したユーザーを削除する
 */
export const onUserDeleteSchedule = onSchedule({
  schedule: '12 */12 * * *', // 12時間12分ごと
  timeoutSeconds: 60 * 5, // 5 minutes
}, async () => {
  const now = new Date();

  const deletedUsers = await getFirestore()
    .collection(CollectionPath.USERS)
    .where('deletedAt', '<', now)
    .limit(50)
    .get();

  for (const user of deletedUsers.docs) {
    // Delete User Data Extensionを使っているため、onDeleteイベントを発生させる必要がある
    // しかしauth.deleteUsersを利用するとonDeleteイベントは発生しないため、deleteUserを利用する
    // https://extensions.dev/extensions/firebase/delete-user-data
    // https://firebase.google.com/docs/auth/admin/manage-users?hl=ja#delete_multiple_users
    await getAuth().deleteUser(user.id);
  };
});

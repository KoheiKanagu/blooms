import { RulesTestEnvironment, initializeTestEnvironment } from '@firebase/rules-unit-testing';
import { Timestamp } from 'firebase-admin/firestore';
import { addDoc, doc, getDoc, getDocs, setDoc, setLogLevel, updateDoc } from 'firebase/firestore';
import { readFileSync, writeFileSync } from 'fs';
import { Condition } from '../src/features/condition/domain/condition';
import { Highlight } from '../src/features/highlight/domain/highlight';
import { User } from '../src/models/user';
import { CollectionPath } from '../src/utils/collectionPath';
import {
  expectFirestorePermissionDenied,
  expectFirestorePermissionSucceeds,
  getFirestoreCoverageMeta,
} from './utils/utils';

let testEnv: RulesTestEnvironment;
const PROJECT_ID = 'my-project';

beforeAll(async () => {
  setLogLevel('debug');

  testEnv = await initializeTestEnvironment({
    projectId: PROJECT_ID,
    firestore: {
      rules: readFileSync('../firestore/firestore.rules', 'utf8'),
      host: 'localhost',
      port: 8080,
    },
  });
},
);

beforeEach(async () => {
  await testEnv.clearFirestore();
});

afterAll(async () => {
  await testEnv.cleanup();

  const url = getFirestoreCoverageMeta(PROJECT_ID);
  const outPath = './firestore-coverage.html';

  const response = await fetch(url);
  const data = await response.text();

  writeFileSync(outPath, data);
});

describe('users_v1', () => {
  const collectionPath = CollectionPath.USERS;

  function createUserData(): User {
    return {
      createdAt: Timestamp.now(),
      updatedAt: Timestamp.now(),
      deletedAt: null,
    };
  }

  it('自分のuserの作成が許可されないこと', async () => {
    const userUid = 'user1';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const userData = createUserData();

    await expectFirestorePermissionDenied(
      setDoc(
        db.doc(`${collectionPath}/${userUid}`),
        userData,
      ),
    );
  });

  it('異なるユーザーがuserを作成できないこと', async () => {
    const userUid = 'user1';
    const otherUserUid = 'user2';
    const db = testEnv.authenticatedContext(otherUserUid).firestore();
    const userData = createUserData();

    await expectFirestorePermissionDenied(
      setDoc(
        db.doc(`${collectionPath}/${userUid}`),
        userData,
      ),
    );
  });

  it('認証されていないユーザーがuserを作成できないこと', async () => {
    const userUid = 'user1';
    const db = testEnv.unauthenticatedContext().firestore();
    const userData = createUserData();

    await expectFirestorePermissionDenied(
      setDoc(
        db.doc(`${collectionPath}/${userUid}`),
        userData,
      ),
    );
  });

  it('自分のuserの取得が許可されること', async () => {
    const userUid = 'user1';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const userData = createUserData();
    await setDoc(
      db.doc(`${collectionPath}/${userUid}`),
      userData,
    );

    await expectFirestorePermissionSucceeds(
      getDoc(
        db.doc(`${collectionPath}/${userUid}`),
      ),
    );
  });

  it('異なるユーザーのuserの取得が拒否されること', async () => {
    const userUid = 'user1';
    const otherUserUid = 'user2';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const userData = createUserData();
    await setDoc(
      db.doc(`${collectionPath}/${userUid}`),
      userData,
    );

    const otherDb = testEnv.authenticatedContext(otherUserUid).firestore();
    await expectFirestorePermissionDenied(
      getDoc(
        otherDb.doc(`${collectionPath}/${userUid}`),
      ),
    );
  });

  it('認証されていないユーザーがuserを取得できないこと', async () => {
    const userUid = 'user1';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const userData = createUserData();
    await setDoc(
      db.doc(`${collectionPath}/${userUid}`),
      userData,
    );

    const unauthDb = testEnv.unauthenticatedContext().firestore();
    await expectFirestorePermissionDenied(
      getDoc(
        unauthDb.doc(`${collectionPath}/${userUid}`),
      ),
    );
  });

  it('自分のuserの更新が許可されること', async () => {
    const userUid = 'user1';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const userData = createUserData();
    await setDoc(
      db.doc(`${collectionPath}/${userUid}`),
      userData,
    );

    await expectFirestorePermissionSucceeds(
      updateDoc(
        db.doc(`${collectionPath}/${userUid}`),
        {
          deletedAt: Timestamp.now(),
        },
      ),
    );
  });

  it('異なるユーザーがuserを更新できないこと', async () => {
    const userUid = 'user1';
    const otherUserUid = 'user2';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const userData = createUserData();
    await setDoc(
      db.doc(`${collectionPath}/${userUid}`),
      userData,
    );

    const otherDb = testEnv.authenticatedContext(otherUserUid).firestore();
    await expectFirestorePermissionDenied(
      updateDoc(
        otherDb.doc(`${collectionPath}/${userUid}`),
        {
          deletedAt: Timestamp.now(),
        },
      ),
    );
  });

  it('認証されていないユーザーがuserを更新できないこと', async () => {
    const userUid = 'user1';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const userData = createUserData();
    await setDoc(
      db.doc(`${collectionPath}/${userUid}`),
      userData,
    );

    const unauthDb = testEnv.unauthenticatedContext().firestore();
    await expectFirestorePermissionDenied(
      updateDoc(
        unauthDb.doc(`${collectionPath}/${userUid}`),
        {
          deletedAt: Timestamp.now(),
        },
      ),
    );
  });

  it('自分のuserの削除が拒否されること', async () => {
    const userUid = 'user1';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const userData = createUserData();
    await setDoc(
      db.doc(`${collectionPath}/${userUid}`),
      userData,
    );

    await expectFirestorePermissionDenied(
      db.collection(collectionPath).doc(userUid).delete(),
    );
  });

  it('異なるユーザーがuserを削除できないこと', async () => {
    const userUid = 'user1';
    const otherUserUid = 'user2';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const userData = createUserData();
    await setDoc(
      db.doc(`${collectionPath}/${userUid}`),
      userData,
    );

    await expectFirestorePermissionDenied(
      testEnv.authenticatedContext(otherUserUid).firestore().collection(collectionPath).doc(userUid).delete(),
    );
  });

  it('認証されていないユーザーがuserを削除できないこと', async () => {
    const userUid = 'user1';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const userData = createUserData();
    await setDoc(
      db.doc(`${collectionPath}/${userUid}`),
      userData,
    );

    await expectFirestorePermissionDenied(
      testEnv.unauthenticatedContext().firestore().collection(collectionPath).doc(userUid).delete(),
    );
  });
});

describe('conditions_v1', () => {
  const collectionPath = CollectionPath.CONDITIONS;

  function createConditionData(subjectUid: string): Condition {
    return {
      subjectUid: subjectUid,
      creatorType: 'user',
      createdAtIso8601: new Date().toISOString(),
      content: {
        type: 'text',
        text: 'This is a test condition.',
      },
      createdAt: Timestamp.now(),
      updatedAt: Timestamp.now(),
      deletedAt: null,
    };
  }

  it('自分のconditionの作成が許可されること', async () => {
    const userUid = 'user1';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const conditionData = createConditionData(userUid);

    await expectFirestorePermissionSucceeds(
      addDoc(
        db.collection(collectionPath),
        conditionData,
      ),
    );
  });

  it('異なるユーザーがconditionを作成できないこと', async () => {
    const userUid = 'user1';
    const otherUserUid = 'user2';
    const db = testEnv.authenticatedContext(otherUserUid).firestore();
    const conditionData = createConditionData(userUid);

    await expectFirestorePermissionDenied(
      addDoc(
        db.collection(collectionPath),
        conditionData,
      ),
    );
  });

  it('認証されていないユーザーがconditionを作成できないこと', async () => {
    const db = testEnv.unauthenticatedContext().firestore();
    const conditionData = createConditionData('user1');

    await expectFirestorePermissionDenied(
      addDoc(
        db.collection(collectionPath),
        conditionData,
      ),
    );
  });

  it('自分のconditionの取得が許可されること', async () => {
    const userUid = 'user1';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const conditionData = createConditionData(userUid);
    const docRef = await addDoc(
      db.collection(collectionPath),
      conditionData,
    );

    await expectFirestorePermissionSucceeds(
      getDoc(
        doc(db, collectionPath, docRef.id),
      ),
    );
  });

  it('異なるユーザーのconditionの取得が拒否されること', async () => {
    const userUid = 'user1';
    const otherUserUid = 'user2';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const conditionData = createConditionData(userUid);
    const docRef = await addDoc(
      db.collection(collectionPath),
      conditionData,
    );

    const otherDb = testEnv.authenticatedContext(otherUserUid).firestore();
    await expectFirestorePermissionDenied(
      getDoc(
        doc(otherDb, collectionPath, docRef.id),
      ),
    );
  });

  it('認証されていないユーザーがconditionを取得できないこと', async () => {
    const userUid = 'user1';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const conditionData = createConditionData(userUid);
    const docRef = await addDoc(
      db.collection(collectionPath),
      conditionData,
    );

    const unauthDb = testEnv.unauthenticatedContext().firestore();
    await expectFirestorePermissionDenied(
      getDoc(
        doc(unauthDb, collectionPath, docRef.id),
      ),
    );
  });

  it('自分のconditionのリスト表示が許可されること', async () => {
    const userUid = 'user1';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const conditionData = createConditionData(userUid);
    await addDoc(
      db.collection(collectionPath),
      conditionData,
    );

    await expectFirestorePermissionSucceeds(
      getDocs(
        db.collection(collectionPath)
          .where('subjectUid', '==', userUid),
      ),
    );
  });

  it('異なるユーザーのconditionのリスト表示が拒否されること', async () => {
    const userUid = 'user1';
    const otherUserUid = 'user2';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const conditionData = createConditionData(userUid);
    await addDoc(
      db.collection(collectionPath),
      conditionData,
    );

    const otherDb = testEnv.authenticatedContext(otherUserUid).firestore();
    await expectFirestorePermissionDenied(
      getDocs(
        otherDb.collection(collectionPath)
          .where('subjectUid', '==', userUid),
      ),
    );
  });

  it('認証されていないユーザーがconditionをリスト表示できないこと', async () => {
    const userUid = 'user1';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const conditionData = createConditionData(userUid);
    await addDoc(
      db.collection(collectionPath),
      conditionData,
    );

    const unauthDb = testEnv.unauthenticatedContext().firestore();
    await expectFirestorePermissionDenied(
      getDocs(
        unauthDb.collection(collectionPath)
          .where('subjectUid', '==', userUid),
      ),
    );
  });

  it('自分のconditionの更新が許可されること', async () => {
    const userUid = 'user1';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const conditionData = createConditionData(userUid);
    const docRef = await addDoc(
      db.collection(collectionPath),
      conditionData,
    );

    await expectFirestorePermissionSucceeds(
      updateDoc(
        doc(db, collectionPath, docRef.id),
        {
          deletedAt: Timestamp.now(),
        },
      ),
    );
  });

  it('異なるユーザーがconditionを更新できないこと', async () => {
    const userUid = 'user1';
    const otherUserUid = 'user2';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const conditionData = createConditionData(userUid);
    const docRef = await addDoc(
      db.collection(collectionPath),
      conditionData,
    );

    const otherDb = testEnv.authenticatedContext(otherUserUid).firestore();
    await expectFirestorePermissionDenied(
      updateDoc(
        doc(otherDb, collectionPath, docRef.id),
        {
          deletedAt: Timestamp.now(),
        },
      ),
    );
  });

  it('認証されていないユーザーがconditionを更新できないこと', async () => {
    const userUid = 'user1';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const conditionData = createConditionData(userUid);
    const docRef = await addDoc(
      db.collection(collectionPath),
      conditionData,
    );

    const unauthDb = testEnv.unauthenticatedContext().firestore();
    await expectFirestorePermissionDenied(
      updateDoc(
        doc(unauthDb, collectionPath, docRef.id),
        {
          deletedAt: Timestamp.now(),
        },
      ),
    );
  });

  it('deletedAt以外のフィールドの更新が拒否されること', async () => {
    const userUid = 'user1';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const conditionData = createConditionData(userUid);
    const docRef = await addDoc(
      db.collection(collectionPath),
      conditionData,
    );

    await expectFirestorePermissionDenied(
      updateDoc(
        doc(db, collectionPath, docRef.id),
        {
          updatedAt: Timestamp.now(),
        },
      ),
    );
  });

  it('conditionの削除が拒否されること', async () => {
    const userUid = 'user1';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const conditionData = createConditionData(userUid);
    const docRef = await addDoc(
      db.collection(collectionPath),
      conditionData,
    );

    await expectFirestorePermissionDenied(
      db.collection(collectionPath).doc(docRef.id).delete(),
    );
  });

  it('異なるユーザーがconditionを削除できないこと', async () => {
    const userUid = 'user1';
    const otherUserUid = 'user2';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const conditionData = createConditionData(userUid);
    const docRef = await addDoc(
      db.collection(collectionPath),
      conditionData,
    );

    const otherDb = testEnv.authenticatedContext(otherUserUid).firestore();
    await expectFirestorePermissionDenied(
      otherDb.collection(collectionPath).doc(docRef.id).delete(),
    );
  });

  it('認証されていないユーザーがconditionを削除できないこと', async () => {
    const userUid = 'user1';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const conditionData = createConditionData(userUid);
    const docRef = await addDoc(
      db.collection(collectionPath),
      conditionData,
    );

    const unauthDb = testEnv.unauthenticatedContext().firestore();
    await expectFirestorePermissionDenied(
      unauthDb.collection(collectionPath).doc(docRef.id).delete(),
    );
  });
});

describe('highlights_v1', () => {
  const collectionPath = CollectionPath.HIGHLIGHTS;

  function createHighlightData(subjectUid: string, deletedAt: Timestamp | null = null): Highlight {
    return {
      subjectUid: subjectUid,
      content: {
        type: 'summary',
        startAt: Timestamp.now(),
        period: 'past1day',
        summary: 'This is a summary.',
        abstract: 'This is an abstract.',
        state: 'success',
        promptFileUri: null,
      },
      createdAt: Timestamp.now(),
      updatedAt: Timestamp.now(),
      deletedAt: deletedAt,
    };
  }

  it('highlightの作成が許可されること', async () => {
    const userUid = 'user1';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const highlightData = createHighlightData(userUid);

    await expectFirestorePermissionSucceeds(
      addDoc(
        db.collection(collectionPath),
        highlightData,
      ),
    );
  });

  it('異なるユーザーがhighlightを作成できないこと', async () => {
    const userUid = 'user1';
    const otherUserUid = 'user2';
    const db = testEnv.authenticatedContext(otherUserUid).firestore();
    const highlightData = createHighlightData(userUid);

    await expectFirestorePermissionDenied(
      addDoc(
        db.collection(collectionPath),
        highlightData,
      ),
    );
  });

  it('認証されていないユーザーがhighlightを作成できないこと', async () => {
    const db = testEnv.unauthenticatedContext().firestore();
    const highlightData = createHighlightData('user1');

    await expectFirestorePermissionDenied(
      addDoc(
        db.collection(collectionPath),
        highlightData,
      ),
    );
  });

  it('自分のhighlightの取得が許可されること', async () => {
    const userUid = 'user1';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const highlightData = createHighlightData(userUid);
    const docRef = await addDoc(
      db.collection(collectionPath),
      highlightData,
    );

    await expectFirestorePermissionSucceeds(
      getDoc(
        doc(db, collectionPath, docRef.id),
      ),
    );
  });

  it('異なるユーザーのhighlightの取得が拒否されること', async () => {
    const userUid = 'user1';
    const otherUserUid = 'user2';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const highlightData = createHighlightData(userUid);
    const docRef = await addDoc(
      db.collection(collectionPath),
      highlightData,
    );

    const otherDb = testEnv.authenticatedContext(otherUserUid).firestore();
    await expectFirestorePermissionDenied(
      getDoc(
        doc(otherDb, collectionPath, docRef.id),
      ),
    );
  });

  it('認証されていないユーザーがhighlightを取得できないこと', async () => {
    const userUid = 'user1';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const highlightData = createHighlightData(userUid);
    const docRef = await addDoc(
      db.collection(collectionPath),
      highlightData,
    );

    const unauthDb = testEnv.unauthenticatedContext().firestore();
    await expectFirestorePermissionDenied(
      getDoc(
        doc(unauthDb, collectionPath, docRef.id),
      ),
    );
  });

  it('自分のhighlightのリスト表示が許可されること', async () => {
    const userUid = 'user1';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const highlightData = createHighlightData(userUid);
    await addDoc(
      db.collection(collectionPath),
      highlightData,
    );

    await expectFirestorePermissionSucceeds(
      getDocs(
        db.collection(collectionPath)
          .where('subjectUid', '==', userUid),
      ),
    );
  });

  it('異なるユーザーのhighlightのリスト表示が拒否されること', async () => {
    const userUid = 'user1';
    const otherUserUid = 'user2';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const highlightData = createHighlightData(userUid);
    await addDoc(
      db.collection(collectionPath),
      highlightData,
    );

    const otherDb = testEnv.authenticatedContext(otherUserUid).firestore();
    await expectFirestorePermissionDenied(
      getDocs(
        otherDb.collection(collectionPath)
          .where('subjectUid', '==', userUid),
      ),
    );
  });

  it('認証されていないユーザーがhighlightをリスト表示できないこと', async () => {
    const userUid = 'user1';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const highlightData = createHighlightData(userUid);
    await addDoc(
      db.collection(collectionPath),
      highlightData,
    );

    const unauthDb = testEnv.unauthenticatedContext().firestore();
    await expectFirestorePermissionDenied(
      getDocs(
        unauthDb.collection(collectionPath)
          .where('subjectUid', '==', userUid),
      ),
    );
  });

  it('自分のhighlightの削除 (update deletedAt) が許可されること', async () => {
    const userUid = 'user1';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const highlightData = createHighlightData(userUid);
    const docRef = await addDoc(
      db.collection(collectionPath),
      highlightData,
    );

    await expectFirestorePermissionSucceeds(
      updateDoc(
        doc(db, collectionPath, docRef.id),
        { deletedAt: Timestamp.now() },
      ),
    );
  });

  it('異なるユーザーがhighlightを削除できないこと', async () => {
    const userUid = 'user1';
    const otherUserUid = 'user2';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const highlightData = createHighlightData(userUid);
    const docRef = await addDoc(
      db.collection(collectionPath),
      highlightData,
    );

    const otherDb = testEnv.authenticatedContext(otherUserUid).firestore();
    await expectFirestorePermissionDenied(
      updateDoc(
        doc(otherDb, collectionPath, docRef.id),
        { deletedAt: Timestamp.now() },
      ),
    );
  });

  it('認証されていないユーザーがhighlightを削除できないこと', async () => {
    const userUid = 'user1';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const highlightData = createHighlightData(userUid);
    const docRef = await addDoc(
      db.collection(collectionPath),
      highlightData,
    );

    const unauthDb = testEnv.unauthenticatedContext().firestore();
    await expectFirestorePermissionDenied(
      updateDoc(
        doc(unauthDb, collectionPath, docRef.id),
        { deletedAt: Timestamp.now() },
      ),
    );
  });

  it('deletedAt以外のフィールドの更新が拒否されること', async () => {
    const userUid = 'user1';
    const db = testEnv.authenticatedContext(userUid).firestore();
    const highlightData = createHighlightData(userUid);
    const docRef = await addDoc(
      db.collection(collectionPath),
      highlightData,
    );

    await expectFirestorePermissionDenied(
      updateDoc(
        doc(db, collectionPath, docRef.id),
        { updatedAt: Timestamp.now() },
      ),
    );
  });
});

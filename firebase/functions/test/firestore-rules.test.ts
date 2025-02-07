import { assertSucceeds, initializeTestEnvironment, RulesTestEnvironment } from '@firebase/rules-unit-testing';
import { addDoc, collection, deleteDoc, doc, getDoc, getDocs, query, setDoc, setLogLevel, Timestamp, updateDoc, where } from 'firebase/firestore';
import { readFileSync, writeFileSync } from 'fs';
import { Condition } from '../src/features/condition/domain/condition';
import { Highlight } from '../src/features/highlight/domain/highlight';
import { User } from '../src/models/user';
import { CollectionPath } from '../src/utils/collectionPath';
import {
  expectFirestorePermissionDenied,
  expectPermissionSucceeds,
  getFirestoreCoverageMeta,
} from './utils/utils';

let testEnv: RulesTestEnvironment;
const PROJECT_ID = 'my-project';

beforeAll(async () => {
  setLogLevel('error');

  testEnv = await initializeTestEnvironment({
    projectId: PROJECT_ID,
    firestore: {
      rules: readFileSync('../firestore/firestore.rules', 'utf8'),
      host: 'localhost',
      port: 8080,
    },
  });
});

beforeEach(async () => {
  await testEnv.clearFirestore();
});

afterAll(async () => {
  await testEnv.clearFirestore();

  const url = getFirestoreCoverageMeta(PROJECT_ID);
  const outPath = './firestore-coverage.html';

  const data = await fetch(url).then(e => e.text());
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

  async function setupUserDocument(userUid: string) {
    await testEnv.withSecurityRulesDisabled(async (context) => {
      await setDoc(
        doc(context.firestore(), collectionPath, userUid),
        createUserData(),
      );
    });
  }

  describe('create', () => {
    it('自分のuserが作成できないこと', async () => {
      const userUid = 'user1';
      const db = testEnv.authenticatedContext(userUid).firestore();

      await expectFirestorePermissionDenied(
        setDoc(
          doc(db, collectionPath, userUid),
          createUserData(),
        ),
      );
    });

    it('異なるユーザーがuserを作成できないこと', async () => {
      const userUid = 'user1';
      const otherUserUid = 'user2';
      const db = testEnv.authenticatedContext(otherUserUid).firestore();

      await expectFirestorePermissionDenied(
        setDoc(
          doc(db, collectionPath, userUid),
          createUserData(),
        ),
      );
    });

    it('認証されていないユーザーがuserを作成できないこと', async () => {
      const userUid = 'user1';
      const db = testEnv.unauthenticatedContext().firestore();

      await expectFirestorePermissionDenied(
        setDoc(
          doc(db, collectionPath, userUid),
          createUserData(),
        ),
      );
    });
  });

  describe('get', () => {
    it('自分のuserが取得できること', async () => {
      const userUid = 'user1';
      const db = testEnv.authenticatedContext(userUid).firestore();
      await setupUserDocument(userUid);

      await expectPermissionSucceeds(
        getDoc(
          doc(db, collectionPath, userUid),
        ),
      );
    });

    it('異なるユーザーがuserを取得できないこと', async () => {
      const userUid = 'user1';
      const otherUserUid = 'user2';
      await setupUserDocument(userUid);

      const otherDb = testEnv.authenticatedContext(otherUserUid).firestore();
      await expectFirestorePermissionDenied(
        getDoc(
          doc(otherDb, collectionPath, userUid),
        ),
      );
    });

    it('認証されていないユーザーがuserを取得できないこと', async () => {
      const userUid = 'user1';
      await setupUserDocument(userUid);

      const unauthDb = testEnv.unauthenticatedContext().firestore();
      await expectFirestorePermissionDenied(
        getDoc(
          doc(unauthDb, collectionPath, userUid),
        ),
      );
    });
  });

  describe('update', () => {
    it('自分のuserが更新できること', async () => {
      const userUid = 'user1';
      const db = testEnv.authenticatedContext(userUid).firestore();
      await setupUserDocument(userUid);

      await assertSucceeds(
        updateDoc(
          doc(db, collectionPath, userUid),
          {
            deletedAt: Timestamp.now(),
          },
        ),
      );
    });

    it('異なるユーザーがuserを更新できないこと', async () => {
      const userUid = 'user1';
      const otherUserUid = 'user2';
      await setupUserDocument(userUid);

      const otherDb = testEnv.authenticatedContext(otherUserUid).firestore();
      await expectFirestorePermissionDenied(
        updateDoc(
          doc(otherDb, collectionPath, userUid),
          {
            deletedAt: Timestamp.now(),
          },
        ),
      );
    });

    it('認証されていないユーザーがuserを更新できないこと', async () => {
      const userUid = 'user1';
      await setupUserDocument(userUid);

      const unauthDb = testEnv.unauthenticatedContext().firestore();
      await expectFirestorePermissionDenied(
        updateDoc(
          doc(unauthDb, collectionPath, userUid),
          {
            deletedAt: Timestamp.now(),
          },
        ),
      );
    });
  });

  describe('delete', () => {
    it('自分のuserが削除できないこと', async () => {
      const userUid = 'user1';
      const db = testEnv.authenticatedContext(userUid).firestore();
      await setupUserDocument(userUid);

      await expectFirestorePermissionDenied(
        deleteDoc(
          doc(db, collectionPath, userUid),
        ),
      );
    });

    it('異なるユーザーがuserを削除できないこと', async () => {
      const userUid = 'user1';
      const otherUserUid = 'user2';
      await setupUserDocument(userUid);

      await expectFirestorePermissionDenied(
        testEnv.authenticatedContext(otherUserUid).firestore().collection(collectionPath).doc(userUid).delete(),
      );
    });

    it('認証されていないユーザーがuserを削除できないこと', async () => {
      const userUid = 'user1';
      await setupUserDocument(userUid);

      await expectFirestorePermissionDenied(
        testEnv.unauthenticatedContext().firestore().collection(collectionPath).doc(userUid).delete(),
      );
    });
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

  describe('create', () => {
    it('自分のconditionが作成できること', async () => {
      const userUid = 'user1';
      const db = testEnv.authenticatedContext(userUid).firestore();
      const conditionData = createConditionData(userUid);

      await expectPermissionSucceeds(
        addDoc(
          collection(db, collectionPath),
          conditionData,
        ),
      );
    });

    it('異なるユーザーがconditionを作成できないこと', async () => {
      const userUid = 'user1';
      const otherUserUid = 'user2';
      const db = testEnv.authenticatedContext(otherUserUid).firestore();

      await expectFirestorePermissionDenied(
        addDoc(
          collection(db, collectionPath),
          createConditionData(userUid),
        ),
      );
    });

    it('認証されていないユーザーがconditionを作成できないこと', async () => {
      const db = testEnv.unauthenticatedContext().firestore();

      await expectFirestorePermissionDenied(
        addDoc(
          collection(db, collectionPath),
          createConditionData('user1'),
        ),
      );
    });
  });

  describe('get', () => {
    it('自分のconditionが取得できること', async () => {
      const userUid = 'user1';
      const db = testEnv.authenticatedContext(userUid).firestore();
      const docRef = await addDoc(
        collection(db, collectionPath),
        createConditionData(userUid),
      );

      await expectPermissionSucceeds(
        getDoc(
          doc(db, collectionPath, docRef.id),
        ),
      );
    });

    it('異なるユーザーがconditionを作成できないこと', async () => {
      const userUid = 'user1';
      const otherUserUid = 'user2';
      const db = testEnv.authenticatedContext(userUid).firestore();
      const docRef = await addDoc(
        collection(db, collectionPath),
        createConditionData(userUid),
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
      const docRef = await addDoc(
        collection(db, collectionPath),
        createConditionData(userUid),
      );

      const unauthDb = testEnv.unauthenticatedContext().firestore();
      await expectFirestorePermissionDenied(
        getDoc(
          doc(unauthDb, collectionPath, docRef.id),
        ),
      );
    });
  });

  describe('list', () => {
    it('自分のconditionのリスト表示できること', async () => {
      const userUid = 'user1';
      const db = testEnv.authenticatedContext(userUid).firestore();
      await addDoc(
        collection(db, collectionPath),
        createConditionData(userUid),
      );

      await expectPermissionSucceeds(
        getDocs(
          query(
            collection(db, collectionPath),
            where('subjectUid', '==', userUid),
          ),
        ),
      );
    });

    it('異なるユーザーのconditionのリスト表示できないこと', async () => {
      const userUid = 'user1';
      const otherUserUid = 'user2';
      const db = testEnv.authenticatedContext(userUid).firestore();
      await addDoc(
        collection(db, collectionPath),
        createConditionData(userUid),
      );

      const otherDb = testEnv.authenticatedContext(otherUserUid).firestore();
      await expectFirestorePermissionDenied(
        getDocs(
          query(
            collection(otherDb, collectionPath),
            where('subjectUid', '==', userUid),
          ),
        ),
      );
    });

    it('認証されていないユーザーがconditionをリスト表示できないこと', async () => {
      const userUid = 'user1';
      const db = testEnv.authenticatedContext(userUid).firestore();
      await addDoc(
        collection(db, collectionPath),
        createConditionData(userUid),
      );

      const unauthDb = testEnv.unauthenticatedContext().firestore();
      await expectFirestorePermissionDenied(
        getDocs(
          query(
            collection(unauthDb, collectionPath),
            where('subjectUid', '==', userUid),
          ),
        ),
      );
    });
  });

  describe('update', () => {
    it('自分のconditionが更新できること', async () => {
      const userUid = 'user1';
      const db = testEnv.authenticatedContext(userUid).firestore();
      const docRef = await addDoc(
        collection(db, collectionPath),
        createConditionData(userUid),
      );

      await assertSucceeds(
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
      const docRef = await addDoc(
        collection(db, collectionPath),
        createConditionData(userUid),
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
      const docRef = await addDoc(
        collection(db, collectionPath),
        createConditionData(userUid),
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

    it('deletedAt以外のフィールドの更新ができないこと', async () => {
      const userUid = 'user1';
      const db = testEnv.authenticatedContext(userUid).firestore();
      const docRef = await addDoc(
        collection(db, collectionPath),
        createConditionData(userUid),
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
  });

  describe('delete', () => {
    it('conditionが削除できないこと', async () => {
      const userUid = 'user1';
      const db = testEnv.authenticatedContext(userUid).firestore();
      const docRef = await addDoc(
        collection(db, collectionPath),
        createConditionData(userUid),
      );

      await expectFirestorePermissionDenied(
        deleteDoc(
          doc(db, collectionPath, docRef.id),
        ),
      );
    });

    it('異なるユーザーがconditionを削除できないこと', async () => {
      const userUid = 'user1';
      const otherUserUid = 'user2';
      const db = testEnv.authenticatedContext(userUid).firestore();
      const docRef = await addDoc(
        collection(db, collectionPath),
        createConditionData(userUid),
      );

      const otherDb = testEnv.authenticatedContext(otherUserUid).firestore();
      await expectFirestorePermissionDenied(
        deleteDoc(
          doc(otherDb, collectionPath, docRef.id),
        ),
      );
    });

    it('認証されていないユーザーがconditionを削除できないこと', async () => {
      const userUid = 'user1';
      const db = testEnv.authenticatedContext(userUid).firestore();
      const docRef = await addDoc(
        collection(db, collectionPath),
        createConditionData(userUid),
      );

      const unauthDb = testEnv.unauthenticatedContext().firestore();
      await expectFirestorePermissionDenied(
        deleteDoc(
          doc(unauthDb, collectionPath, docRef.id),
        ),
      );
    });
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

  describe('create', () => {
    it('highlightが作成できること', async () => {
      const userUid = 'user1';
      const db = testEnv.authenticatedContext(userUid).firestore();

      await expectPermissionSucceeds(
        addDoc(
          collection(db, collectionPath),
          createHighlightData(userUid),
        ),
      );
    });

    it('異なるユーザーがhighlightを作成できないこと', async () => {
      const userUid = 'user1';
      const otherUserUid = 'user2';
      const db = testEnv.authenticatedContext(otherUserUid).firestore();

      await expectFirestorePermissionDenied(
        addDoc(
          collection(db, collectionPath),
          createHighlightData(userUid),
        ),
      );
    });

    it('認証されていないユーザーがhighlightを作成できないこと', async () => {
      const db = testEnv.unauthenticatedContext().firestore();

      await expectFirestorePermissionDenied(
        addDoc(
          collection(db, collectionPath),
          createHighlightData('user1'),
        ),
      );
    });
  });

  describe('get', () => {
    it('自分のhighlightが取得できること', async () => {
      const userUid = 'user1';
      const db = testEnv.authenticatedContext(userUid).firestore();
      const docRef = await addDoc(
        collection(db, collectionPath),
        createHighlightData(userUid),
      );

      await expectPermissionSucceeds(
        getDoc(
          doc(db, collectionPath, docRef.id),
        ),
      );
    });

    it('異なるユーザーのhighlightの取得ができないこと', async () => {
      const userUid = 'user1';
      const otherUserUid = 'user2';
      const db = testEnv.authenticatedContext(userUid).firestore();
      const docRef = await addDoc(
        collection(db, collectionPath),
        createHighlightData(userUid),
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
      const docRef = await addDoc(
        collection(db, collectionPath),
        createHighlightData(userUid),
      );

      const unauthDb = testEnv.unauthenticatedContext().firestore();
      await expectFirestorePermissionDenied(
        getDoc(
          doc(unauthDb, collectionPath, docRef.id),
        ),
      );
    });
  });

  describe('list', () => {
    it('自分のhighlightのリスト表示できること', async () => {
      const userUid = 'user1';
      const db = testEnv.authenticatedContext(userUid).firestore();
      await addDoc(
        collection(db, collectionPath),
        createHighlightData(userUid),
      );

      await expectPermissionSucceeds(
        getDocs(
          query(
            collection(db, collectionPath),
            where('subjectUid', '==', userUid),
          ),
        ),
      );
    });

    it('異なるユーザーのhighlightのリスト表示できないこと', async () => {
      const userUid = 'user1';
      const otherUserUid = 'user2';
      const db = testEnv.authenticatedContext(userUid).firestore();
      await addDoc(
        collection(db, collectionPath),
        createHighlightData(userUid),
      );

      const otherDb = testEnv.authenticatedContext(otherUserUid).firestore();
      await expectFirestorePermissionDenied(
        getDocs(
          query(
            collection(otherDb, collectionPath),
            where('subjectUid', '==', userUid),
          ),
        ),
      );
    });

    it('認証されていないユーザーがhighlightをリスト表示できないこと', async () => {
      const userUid = 'user1';
      const db = testEnv.authenticatedContext(userUid).firestore();
      await addDoc(
        collection(db, collectionPath),
        createHighlightData(userUid),
      );

      const unauthDb = testEnv.unauthenticatedContext().firestore();
      await expectFirestorePermissionDenied(
        getDocs(
          query(
            collection(unauthDb, collectionPath),
            where('subjectUid', '==', userUid),
          ),
        ),
      );
    });
  });

  describe('update', () => {
    it('自分のhighlightを削除 (update deletedAt) できること', async () => {
      const userUid = 'user1';
      const db = testEnv.authenticatedContext(userUid).firestore();
      const docRef = await addDoc(
        collection(db, collectionPath),
        createHighlightData(userUid),
      );

      await assertSucceeds(
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
      const docRef = await addDoc(
        collection(db, collectionPath),
        createHighlightData(userUid),
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
      const docRef = await addDoc(
        collection(db, collectionPath),
        createHighlightData(userUid),
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
      const docRef = await addDoc(
        collection(db, collectionPath),
        createHighlightData(userUid),
      );

      await expectFirestorePermissionDenied(
        updateDoc(
          doc(db, collectionPath, docRef.id),
          { updatedAt: Timestamp.now() },
        ),
      );
    });
  });

  describe('delete', () => {
    it('highlightが削除できないこと', async () => {
      const userUid = 'user1';
      const db = testEnv.authenticatedContext(userUid).firestore();
      const docRef = await addDoc(
        collection(db, collectionPath),
        createHighlightData(userUid),
      );

      await expectFirestorePermissionDenied(
        deleteDoc(
          doc(db, collectionPath, docRef.id),
        ),
      );
    });

    it('異なるユーザーがhighlightを削除できないこと', async () => {
      const userUid = 'user1';
      const otherUserUid = 'user2';
      const db = testEnv.authenticatedContext(userUid).firestore();
      const docRef = await addDoc(
        collection(db, collectionPath),
        createHighlightData(userUid),
      );

      const otherDb = testEnv.authenticatedContext(otherUserUid).firestore();
      await expectFirestorePermissionDenied(
        deleteDoc(
          doc(otherDb, collectionPath, docRef.id),
        ),
      );
    });

    it('認証されていないユーザーがhighlightを削除できないこと', async () => {
      const userUid = 'user1';
      const db = testEnv.authenticatedContext(userUid).firestore();
      const docRef = await addDoc(
        collection(db, collectionPath),
        createHighlightData(userUid),
      );

      const unauthDb = testEnv.unauthenticatedContext().firestore();
      await expectFirestorePermissionDenied(
        deleteDoc(
          doc(unauthDb, collectionPath, docRef.id),
        ),
      );
    });
  });
});

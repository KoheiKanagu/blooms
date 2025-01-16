import * as admin from 'firebase-admin';
import { initializeFirestore } from 'firebase-admin/firestore';
import { setGlobalOptions } from 'firebase-functions';
import * as f from 'firebase-functions/v1';

const app = admin.initializeApp();

initializeFirestore(app, {
  preferRest: true,
});

// for v2
setGlobalOptions({
  region: 'asia-northeast1',
  minInstances: 0,
  timeoutSeconds: 20,
  memory: '256MiB',
  enforceAppCheck: true,
});

// for v1
export function functionsV1(): f.FunctionBuilder {
  return f
    .runWith({
      memory: '256MB',
      timeoutSeconds: 10,
      failurePolicy: true,
      enforceAppCheck: true,
    })
    .region('asia-northeast1');
}

export { onCreateAuthUser } from './onCreateAuthUser';

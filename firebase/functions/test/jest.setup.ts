import { initializeApp } from 'firebase-admin/app';
import firebaseFunctionsTest from 'firebase-functions-test';

process.env['FIREBASE_AUTH_EMULATOR_HOST'] = '127.0.0.1:9099';
process.env['FIRESTORE_EMULATOR_HOST'] = '127.0.0.1:8080';
process.env['FIREBASE_STORAGE_EMULATOR_HOST'] = '127.0.0.1:9199';

initializeApp({
  storageBucket: 'test-bucket',
});

export const functionsTest = firebaseFunctionsTest({
  projectId: 'test-project',
}, process.env['GOOGLE_APPLICATION_CREDENTIALS']);

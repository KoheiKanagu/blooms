import { initializeApp } from 'firebase-admin/app';

export function adminInitializeAppStg() {
  process.env['GOOGLE_APPLICATION_CREDENTIALS'] = '../secrets/blooms-stg-firebase-adminsdk-4o7mx-3947c5abfa.json';
  initializeApp();
}

export function adminInitializeAppProd() {
  process.env['GOOGLE_APPLICATION_CREDENTIALS'] = '../secrets/blooms-prod-43d74-firebase-adminsdk-jh3i4-6dfb8d09a7.json';
  initializeApp();
}

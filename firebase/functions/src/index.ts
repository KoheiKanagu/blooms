import { setGlobalOptions } from 'firebase-functions';
import * as logger from 'firebase-functions/logger';
import { onRequest } from 'firebase-functions/v2/https';

setGlobalOptions({
  region: 'asia-northeast1',
  minInstances: 0,
  timeoutSeconds: 20,
  memory: '256MiB',
  enforceAppCheck: true,
});

export const helloWorld = onRequest((_, response) => {
  logger.info('Hello logs!', { structuredData: true });
  response.send('Hello from Firebase!');
});

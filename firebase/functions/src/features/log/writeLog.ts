import { logger } from 'firebase-functions';
import { onCall } from 'firebase-functions/https';
import { WriteLogRequest } from './domain/writeLogRequest';

export const writeLog = onCall({
  maxInstances: 5,
}, (request) => {
  // 未認証でも呼べるようにする
  // App Checkしてるので問題ないはず
  const data = request.data as WriteLogRequest;

  for (const log of data.logs) {
    switch (log.level) {
      case 'info':
        logger.info(log.log);
        break;
      case 'debug':
        logger.debug(log.log);
        break;
      case 'verbose':
        logger.debug(log.log);
        break;
      case 'warning':
        logger.warn(log.log);
        break;
      case 'error':
        logger.error(log.log);
        break;
      case 'critical':
        logger.error(log.log);
        break;
    }
  }
});

import { logger } from 'firebase-functions';
import { kAppEnvStg } from '../constants/appEnv';

/**
 * プライベートな情報が含まれる可能性があるため、stg環境のみログに出力する
 * @param args
 */
export function outSensitiveLog(...args: unknown[]) {
  if (kAppEnvStg) {
    logger.debug('[Sensitive Log]', ...args);
  }
}

export function outSensitiveLogWithJsonStringify(...args: unknown[]) {
  if (kAppEnvStg) {
    logger.debug('[Sensitive Log]',
      ...args.map(arg => JSON.stringify(arg, null, 2),
      ),
    );
  }
}

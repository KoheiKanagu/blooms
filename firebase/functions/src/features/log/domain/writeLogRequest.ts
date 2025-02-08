// https://pub.dev/documentation/talker/latest/talker/LogLevel.html
export type LogLevel = 'error' | 'critical' | 'info' | 'debug' | 'verbose' | 'warning';

export interface WriteLogRequest {
  logs: WriteLogData[];
}

export interface WriteLogData {
  level: LogLevel;
  log: Record<string, unknown>[];
}

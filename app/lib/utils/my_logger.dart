import 'package:blooms/constants/app_env.dart';
import 'package:blooms/features/log/domain/write_log_data.dart';
import 'package:blooms/features/log/domain/write_log_request.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger.dart';

final logger = TalkerFlutter.init(
  observer: () {
    if (!kReleaseMode) {
      return null;
    }

    if (kIsWeb) {
      return WriteLogTalkerObserver();
    } else {
      return CrashlyticsTalkerObserver();
    }
  }(),
);

class WriteLogTalkerObserver extends TalkerObserver {
  /// ログのバッファ
  /// エラーが発生したら一括送信
  final List<WriteLogData> logBuffer = [];

  static const int _bufferSize = 64;

  Future<void> sendLog() async {
    await FirebaseFunctions.instanceFor(
      region: 'asia-northeast1',
    ).httpsCallable('writeLog').call<void>(
          WriteLogRequest(logs: logBuffer).toJson(),
        );
    logBuffer.clear();
  }

  @override
  void onError(TalkerError err) {
    logBuffer.add(
      WriteLogData(
        level: LogLevel.error,
        log: {
          'error': err.error.toString(),
          'stackTrace': err.stackTrace.toString(),
          'reason': err.message,
        },
      ),
    );
    sendLog();

    super.onError(err);
  }

  @override
  void onException(TalkerException err) {
    logBuffer.add(
      WriteLogData(
        level: LogLevel.error,
        log: {
          'exception': err.exception.toString(),
          'stackTrace': err.stackTrace.toString(),
          'reason': err.message,
        },
      ),
    );
    sendLog();

    super.onException(err);
  }

  @override
  void onLog(TalkerData log) {
    final data = log.generateTextMessage();

    logBuffer.add(
      WriteLogData(
        level: log.logLevel ?? LogLevel.verbose,
        log: {
          'text': data,
        },
      ),
    );

    // バッファサイズを超えた場合は古いログを削除
    if (logBuffer.length > _bufferSize) {
      logBuffer.removeAt(0);
    }

    super.onLog(log);
  }
}

class CrashlyticsTalkerObserver extends TalkerObserver {
  @override
  void onError(TalkerError err) {
    FirebaseCrashlytics.instance.recordError(
      err.error,
      err.stackTrace,
      reason: err.message,
    );

    super.onError(err);
  }

  @override
  void onException(TalkerException err) {
    FirebaseCrashlytics.instance.recordError(
      err.exception,
      err.stackTrace,
      reason: err.message,
    );

    super.onException(err);
  }

  @override
  void onLog(TalkerData log) {
    final data = log.generateTextMessage();

    FirebaseCrashlytics.instance.log(data);
    super.onLog(log);
  }
}

/// [Riverpod] logger on [Talker] base
///
/// 機密情報が含まれるProviderはログを抑制
final talkerRiverpodObserver = TalkerRiverpodObserver(
  talker: logger,
  settings: TalkerRiverpodLoggerSettings(
    providerFilter: (provider) {
      if (kAppEnvProd) {
        final hidden = {
          'firebaseUserProvider',
          'highlightPromptProvider',
          'firebaseStorageGsFileDownloadUrlProvider',
        };

        //　機密情報が含まれるため、[kAppEnvProd]の場合はログを抑制
        if (hidden.contains(provider.name)) {
          return false;
        }
      }

      final hidden = {
        'conditionFormHeightControllerProvider',
      };
      // 冗長なログを抑制
      if (hidden.contains(provider.name)) {
        return false;
      }

      return true;
    },
  ),
);

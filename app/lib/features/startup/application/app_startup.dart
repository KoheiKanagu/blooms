import 'package:blooms/constants/app_env.dart';
import 'package:blooms/features/authentication/application/auth_providers.dart';
import 'package:blooms/utils/configure/device_info_providers.dart';
import 'package:blooms/utils/configure/package_info_providers.dart';
import 'package:blooms/utils/firebase/firebase_analytics.dart';
import 'package:blooms/utils/firebase/firebase_providers.dart';
import 'package:blooms/utils/my_logger.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker/talker.dart';

part 'app_startup.g.dart';

/// アプリ起動時に非同期で初期化が必要な処理を行う
@riverpod
Future<void> appStartup(Ref ref) async {
  ref.onDispose(() {
    ref
      ..invalidate(packageInfoProvider)
      ..invalidate(deviceInfoProvider);
  });

  // error handling
  if (kIsWeb) {
    // Webの場合はTalkerに送る
    FlutterError.onError = (details) {
      logger.handle(
        TalkerException(
          Exception(details.exceptionAsString()),
          message: details.context?.toString(),
          stackTrace: details.stack,
          logLevel: LogLevel.error,
        ),
      );
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      logger.handle(
        TalkerException(
          Exception(error.toString()),
          message: error.toString(),
          stackTrace: stack,
          logLevel: LogLevel.error,
        ),
      );
      return true;
    };
  } else {
    // モバイルの場合はCrashlyticsに送る
    FlutterError.onError =
        ref.watch(firebaseCrashlyticsProvider).recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (error, stack) {
      ref
          .watch(firebaseCrashlyticsProvider)
          .recordError(error, stack, fatal: true);
      return true;
    };
  }

  /// initialize AppCheck
  await Future.wait([
    if (kAppEnvStg)
      FirebaseAppCheck.instance.activate(
        appleProvider: AppleProvider.debug,
        webProvider: ReCaptchaEnterpriseProvider(kReCaptchaV3SiteKey),
      ),
    if (kAppEnvProd)
      FirebaseAppCheck.instance.activate(
        appleProvider: AppleProvider.appAttest,
        webProvider: ReCaptchaEnterpriseProvider(kReCaptchaV3SiteKey),
      ),
  ]);

  /// initialize
  await Future.wait([
    // リリースモードの場合のみCrashlyticsを有効化
    if (!kIsWeb)
      ref
          .watch(firebaseCrashlyticsProvider)
          .setCrashlyticsCollectionEnabled(kReleaseMode),
    // リリースモードの場合のみAnalyticsを有効化
    ref
        .watch(firebaseAnalyticsProvider)
        .setAnalyticsCollectionEnabled(kReleaseMode),
    ref.watch(packageInfoProvider.future),
    ref.watch(deviceInfoProvider.future),
    ref.watch(firebaseAuthProvider).setSettings(
          userAccessGroup: kKeychainGroup,
        ),
    ref.watch(authSignOutWhenFirstRunProvider.future),
  ]);

  await Future.wait([
    // authStateChangesが取得できたらFirebase Authの初期化が完了したと言える
    ref.watch(firebaseAuthProvider).authStateChanges().first,
  ]);
}

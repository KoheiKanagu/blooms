import 'package:blooms/constants/app_env.dart';
import 'package:blooms/features/authentication/application/auth_providers.dart';
import 'package:blooms/utils/configure/device_info_providers.dart';
import 'package:blooms/utils/configure/package_info_providers.dart';
import 'package:blooms/utils/firebase/firebase_analytics.dart';
import 'package:blooms/utils/firebase/firebase_providers.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_startup.g.dart';

/// アプリ起動時に非同期で初期化が必要な処理を行う
@riverpod
Future<void> appStartup(Ref ref) async {
  ref.onDispose(() {
    ref
      ..invalidate(packageInfoProvider)
      ..invalidate(deviceInfoProvider);
  });

  if (!kIsWeb) {
    /// error handling
    FlutterError.onError =
        ref.read(firebaseCrashlyticsProvider).recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (error, stack) {
      ref
          .read(firebaseCrashlyticsProvider)
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
          .read(firebaseCrashlyticsProvider)
          .setCrashlyticsCollectionEnabled(kReleaseMode),
    // リリースモードの場合のみAnalyticsを有効化
    ref
        .read(firebaseAnalyticsProvider)
        .setAnalyticsCollectionEnabled(kReleaseMode),
    ref.read(packageInfoProvider.future),
    ref.read(deviceInfoProvider.future),
    ref.read(firebaseAuthProvider).setSettings(
          userAccessGroup: kKeychainGroup,
        ),
    ref.read(authSignOutWhenFirstRunProvider.future),
  ]);

  await Future.wait([
    // authStateChangesが取得できたらFirebase Authの初期化が完了したと言える
    ref.read(firebaseAuthProvider).authStateChanges().first,
  ]);
}

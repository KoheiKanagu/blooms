import 'package:blooms/features/authentication/application/firebase_user_providers.dart';
import 'package:blooms/utils/configure/package_info_providers.dart';
import 'package:blooms/utils/configure/shared_preferences_providers.dart';
import 'package:blooms/utils/firebase/firebase_analytics.dart';
import 'package:blooms/utils/firebase/firebase_providers.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_startup.g.dart';

/// アプリ起動時に非同期で初期化が必要な処理を行う
@riverpod
Future<void> appStartup(Ref ref) async {
  ref.onDispose(() {
    ref
      ..invalidate(sharedPreferencesProvider)
      ..invalidate(packageInfoProvider);
  });

  /// error handling
  FlutterError.onError =
      ref.watch(firebaseCrashlyticsProvider).recordFlutterFatalError;

  PlatformDispatcher.instance.onError = (error, stack) {
    ref.watch(firebaseCrashlyticsProvider).recordError(
          error,
          stack,
          fatal: true,
        );
    return true;
  };

  /// initialize
  await Future.wait([
    // リリースモードの場合のみCrashlyticsを有効化
    ref
        .watch(firebaseCrashlyticsProvider)
        .setCrashlyticsCollectionEnabled(kReleaseMode),
    // リリースモードの場合のみAnalyticsを有効化
    ref
        .watch(firebaseAnalyticsProvider)
        .setAnalyticsCollectionEnabled(kReleaseMode),
    // authStateChangesが取得できたらFirebase Authの初期化が完了したと言える
    ref.watch(firebaseAuthProvider).authStateChanges().first,
    ref.watch(sharedPreferencesProvider.future),
    ref.watch(packageInfoProvider.future),
  ]);

  // sharedPreferencesProviderが初期化されている必要があるので後から初期化
  await ref.watch(firebaseUserSignOutWhenFirstRunProvider.future);
}

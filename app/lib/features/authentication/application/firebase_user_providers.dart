import 'dart:async';

import 'package:blooms/constants/app_env.dart';
import 'package:blooms/features/user/application/user_providers.dart';
import 'package:blooms/utils/configure/shared_preferences_providers.dart';
import 'package:blooms/utils/firebase/firebase_analytics.dart';
import 'package:blooms/utils/firebase/firebase_providers.dart';
import 'package:blooms/utils/my_logger.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_user_providers.g.dart';

/// [fb_auth.User]を取得する
///
/// 機密情報が含まれるため、[kAppEnvProd]の場合はログを抑制している
/// Providerの名称を変える場合は、[talkerRiverpodObserver] も変更すること
@riverpod
Stream<fb_auth.User?> firebaseUser(
  Ref ref,
) =>
    ref.watch(firebaseAuthProvider).userChanges();

/// UIDを取得する
///
/// サインインしていない場合はnullを返す
@riverpod
Future<String?> firebaseUserUid(
  Ref ref,
) =>
    ref.watch(
      firebaseUserProvider.selectAsync(
        (value) => value?.uid,
      ),
    );

/// サインインをした後、Userドキュメントが取得できるまで待つ
@riverpod
Future<void> firebaseUserSignIn(
  Ref ref,
) async {
  logger.debug('signIn');

  // 初期化が完了するまで待つ
  final current =
      await ref.watch(firebaseAuthProvider).authStateChanges().first;

  final String uid;
  if (current == null) {
    logger.info('not signed in');

    final credential =
        await ref.watch(firebaseAuthProvider).signInAnonymously();
    uid = credential.user?.uid ?? '';
  } else {
    logger.info('already signed in');

    uid = current.uid;
  }

  if (uid.isEmpty) {
    throw Exception('uid is empty');
  }

  logger.debug('await user document');
  // Cloud FunctionsでUserドキュメントが作成されるまで待つ
  await ref.watch(userDocumentSnapshotProvider(uid).future).catchError(
    (_, __) async {
      logger.warning('error. signOut and throw error');
      await ref.watch(firebaseUserSignOutProvider.future);
      throw Exception('not found user document: $uid');
    },
  );

  logger.debug('signIn succeeded');
}

@riverpod
Future<void> firebaseUserDelete(
  Ref ref,
) async {
  await ref.watch(firebaseAnalyticsProvider).logEvent(
        name: 'user_delete',
      );

  logger.debug('add deletedAt');
  await ref.watch(userControllerProvider.notifier).delete();

  await ref.watch(firebaseUserSignOutProvider.future);
  logger.debug('deleteUser succeeded');
}

@riverpod
Future<void> firebaseUserSignOut(
  Ref ref,
) async {
  await ref.watch(firebaseAnalyticsProvider).logEvent(
        name: 'sign_out',
      );

  logger.debug('clear local data');
  await Future.wait(
    [
      ref.watch(sharedPreferencesProvider).requireValue.clear(),
      ref.watch(firebaseAnalyticsControllerProvider).resetAnalyticsData(),
    ],
  );

  await ref.watch(firebaseAuthProvider).signOut();
  logger.debug('signOut succeeded');
}

/// アプリが初回起動かチェックして、初回起動の場合はサインアウトを実行する
///
/// Firebase Authの認証情報はiCloudでバックアップされるため、
/// アプリを再インストールしたり、別の端末であっても認証情報が復元されてしまう可能性がある
@riverpod
Future<void> firebaseUserSignOutWhenFirstRun(Ref ref) async {
  final preferences = ref.watch(sharedPreferencesProvider).requireValue;
  const key = 'isFirstRun';

  final firstRun = preferences.getBool(key) ?? true;

  if (firstRun) {
    await ref.watch(firebaseAuthProvider).signOut();
    await preferences.setBool(key, false);
  }
}

import 'dart:async';

import 'package:blooms/features/user/application/user_providers.dart';
import 'package:blooms/utils/configure/shared_preferences_providers.dart';
import 'package:blooms/utils/firebase/firebase_analytics.dart';
import 'package:blooms/utils/firebase/firebase_providers.dart';
import 'package:blooms/utils/my_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

/// サインインをした後、Userドキュメントが取得できるまで待つ
@riverpod
Future<void> authSignIn(Ref ref) async {
  logger.debug('signIn');

  // 初期化が完了するまで待つ
  final current = await ref.read(firebaseAuthProvider).authStateChanges().first;

  final String uid;
  if (current == null) {
    logger.info('not signed in');

    final credential = await ref.read(firebaseAuthProvider).signInAnonymously();
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
  await ref.read(userDocumentSnapshotProvider(uid).future).catchError(
    (_, __) async {
      logger.warning('error. signOut and throw error');
      await ref.read(authSignOutProvider.future);
      throw Exception('not found user document: $uid');
    },
  );

  logger.debug('signIn succeeded');
}

@riverpod
Future<void> authSignOut(Ref ref) async {
  await ref.read(firebaseAnalyticsProvider).logEvent(
        name: 'sign_out',
      );

  logger.debug('clear local data');
  await Future.wait(
    [
      ref.read(sharedPreferencesProvider).requireValue.clear(),
      ref.read(firebaseAnalyticsControllerProvider).resetAnalyticsData(),
    ],
  );

  await ref.read(firebaseAuthProvider).signOut();
  logger.debug('signOut succeeded');
}

/// アプリが初回起動かチェックして、初回起動の場合はサインアウトを実行する
///
/// Firebase Authの認証情報はiCloudでバックアップされるため、
/// アプリを再インストールしたり、別の端末であっても認証情報が復元されてしまう可能性がある
@riverpod
Future<void> authSignOutWhenFirstRun(Ref ref) async {
  final preferences = ref.read(sharedPreferencesProvider).requireValue;
  const key = 'isFirstRun';

  final firstRun = preferences.getBool(key) ?? true;

  if (firstRun) {
    await ref.read(firebaseAuthProvider).signOut();
    await preferences.setBool(key, false);
  }
}

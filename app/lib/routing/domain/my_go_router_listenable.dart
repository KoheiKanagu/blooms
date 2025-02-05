import 'dart:core';

import 'package:blooms/features/authentication/application/firebase_user_providers.dart';
import 'package:blooms/features/startup/application/app_startup.dart';
import 'package:blooms/features/user/application/user_providers.dart';
import 'package:blooms/utils/firebase/firebase_providers.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_go_router_listenable.freezed.dart';
part 'my_go_router_listenable.g.dart';

@freezed
class MyGoRouterListenable with _$MyGoRouterListenable {
  const factory MyGoRouterListenable({
    @Default(false) bool signedIn,
    @Default(false) bool createdUserDocument,
    AsyncValue<void>? appStartupState,
  }) = _MyGoRouterListenable;
}

// リダイレクトに必要な値を監視するためのNotifier
@riverpod
Raw<ValueNotifier<MyGoRouterListenable>> refreshListenable(Ref ref) {
  final listenable = ValueNotifier<MyGoRouterListenable>(
    const MyGoRouterListenable(),
  );

  ref
    ..listen(
      // アプリの初期化状態を監視
      appStartupProvider,
      (_, next) {
        listenable.value = listenable.value.copyWith(appStartupState: next);
      },
    )
    ..listen(
      // FirebaseUserのuidが取得できるまで待つ
      firebaseUserUidProvider.select((e) => e.value),
      (_, uid) async {
        listenable.value = listenable.value.copyWith(signedIn: uid != null);
      },
    )
    ..listen(
      // Crashlyticsにuidを設定
      firebaseUserUidProvider.select((e) => e.value),
      (_, uid) async {
        if (!kIsWeb) {
          await ref
              .watch(firebaseCrashlyticsProvider)
              .setUserIdentifier(uid ?? '');
        }
      },
    )
    ..listen(
      // FirestoreにUserドキュメントが作成されるまで待つ
      userProvider.select((e) => e.value?.reference),
      (_, reference) async {
        listenable.value = listenable.value.copyWith(
          createdUserDocument: reference != null,
        );
      },
    )
    ..onDispose(listenable.dispose);

  return listenable;
}

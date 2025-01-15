import 'dart:core';

import 'package:blooms/features/authentication/application/firebase_user_providers.dart';
import 'package:blooms/features/startup/application/app_startup.dart';
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
        listenable.value = listenable.value.copyWith(
          appStartupState: next,
        );
      },
    )
    ..listen(
      // Firebase Authでのサインイン状態を監視
      firebaseUserIsSignedInProvider,
      (_, next) {
        final value = next.value;
        if (value != null) {
          listenable.value = listenable.value.copyWith(
            signedIn: value,
          );
        }
      },
    )
    ..onDispose(listenable.dispose);

  return listenable;
}

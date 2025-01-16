import 'dart:core';

import 'package:blooms/features/startup/application/app_startup.dart';
import 'package:blooms/features/user/application/user_providers.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_go_router_listenable.freezed.dart';
part 'my_go_router_listenable.g.dart';

@freezed
class MyGoRouterListenable with _$MyGoRouterListenable {
  const factory MyGoRouterListenable({
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
        listenable.value = listenable.value.copyWith(
          appStartupState: next,
        );
      },
    )
    ..listen(
      userControllerProvider,
      (_, next) async {
        // FirestoreにUserドキュメントが作成されるまで待つ
        await next;

        listenable.value = listenable.value.copyWith(
          createdUserDocument: true,
        );
      },
    )
    ..onDispose(listenable.dispose);

  return listenable;
}

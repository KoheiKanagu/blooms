import 'dart:core';

import 'package:blooms/features/home/application/home_route.dart' as home_route;
import 'package:blooms/features/onboarding/application/onboarding_page_route.dart'
    as onboarding_route;
import 'package:blooms/features/onboarding/application/onboarding_providers.dart';
import 'package:blooms/features/startup/application/startup_page_route.dart'
    as startup_route;
import 'package:blooms/features/startup/presentation/startup_page.dart';
import 'package:blooms/routing/domain/my_go_router_listenable.dart';
import 'package:blooms/utils/firebase/firebase_analytics.dart';
import 'package:blooms/utils/firebase/firebase_providers.dart';
import 'package:blooms/utils/my_logger.dart';
import 'package:blooms/utils/my_navigator_observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_go_router.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
const _initialLocation = startup_route.AppStartupPageRoute.path;

BuildContext? get rootContext =>
    rootNavigatorKey.currentState?.overlay?.context;

@riverpod
GoRouter myGoRouter(Ref ref) => GoRouter(
  navigatorKey: rootNavigatorKey,
  routes: [
    ...startup_route.$appRoutes,
    ...onboarding_route.$appRoutes,
    ...home_route.$appRoutes,
  ],
  errorBuilder: (context, state) {
    logger.handle(state.error.toString(), StackTrace.current, {
      'name': state.name,
      'fullPath': state.fullPath,
      'pathParameters': state.pathParameters,
      'queryParameters': state.uri.queryParameters,
      'location': state.uri,
      'queryParametersAll': state.uri.queryParametersAll,
    });

    return const AppStartupLoadingWidget();
  },
  refreshListenable: ref.watch(refreshListenableProvider),
  redirect: (context, state) async {
    final refreshListenable = ref.watch(refreshListenableProvider).value;

    final appStartupState =
        refreshListenable.appStartupState ?? const AsyncLoading();

    // 初期化が完了するのを待つ
    if (appStartupState.isLoading || appStartupState.hasError) {
      return startup_route.AppStartupPageRoute.path;
    }

    // _initialLocation判定で複雑化するので、一旦オンボーディングに遷移させる
    // すぐにredirectが呼ばれるので実際には画面は表示されない
    // 実際の遷移先は以後の処理で決定される
    if (state.fullPath == _initialLocation) {
      return onboarding_route.OnboardingPageRoute.path;
    }

    // 未サインインで到達できる画面かどうか
    final isUnauthorizedRoute = [
      onboarding_route.OnboardingPageRoute.path,
    ].any((e) => e == state.fullPath);

    if (refreshListenable.signedIn && refreshListenable.createdUserDocument) {
      // サインイン済みなのに、未サインインRouteの場合はホーム画面に遷移
      if (isUnauthorizedRoute) {
        // オンボーディングが完了している場合はホーム画面に遷移
        final onboarding = await ref.watch(
          onboardingIsCompletedProvider.future,
        );
        if (onboarding) {
          return home_route.HomeTabRoute.path;
        } else {
          return onboarding_route.OnboardingPageRoute.path;
        }
      }

      // サインイン済みの場合は何もしない
      return null;
    } else {
      // 未サインイン状態でも遷移できるページの場合は何もしない
      if (isUnauthorizedRoute) {
        return null;
      } else {
        // 未サインイン状態で遷移できないページの場合はオンボーディング画面に遷移
        return onboarding_route.OnboardingPageRoute.path;
      }
    }
  },
  observers: [
    MyNavigatorObserver(ref.watch(firebaseCrashlyticsProvider)),
    FirebaseAnalyticsObserver(analytics: ref.watch(firebaseAnalyticsProvider)),
  ],
  debugLogDiagnostics: kDebugMode,
  initialLocation: _initialLocation,
);

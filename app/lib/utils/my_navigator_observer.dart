import 'package:blooms/utils/my_logger.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class MyNavigatorObserver extends NavigatorObserver {
  MyNavigatorObserver(this.firebaseCrashlytics);

  final FirebaseCrashlytics firebaseCrashlytics;

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _setCustomKey(route: route, previousRoute: previousRoute, didPush: false);
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _setCustomKey(route: route, previousRoute: previousRoute, didPush: true);
  }

  void _setCustomKey({
    required Route<dynamic> route,
    required Route<dynamic>? previousRoute,
    required bool didPush,
  }) {
    final routeName = '${route.settings.name}';
    final routeArguments = '${route.settings.arguments}';

    final previousRouteName = '${previousRoute?.settings.name}';
    final previousRouteArguments = '${previousRoute?.settings.arguments}';

    if (!kIsWeb) {
      // Crashlyticsへのエラーレポートが発生した際に、どこの画面で発生したか追跡しやすくする
      firebaseCrashlytics
        ..setCustomKey('route', routeName)
        ..setCustomKey('routeArguments', routeArguments)
        ..setCustomKey('previousRoute', previousRouteName)
        ..setCustomKey('previousRouteArguments', previousRouteArguments)
        ..setCustomKey('didPush', didPush);
    }

    logger.verbose({
      'route': routeName,
      'routeArguments': routeArguments,
      'previousRoute': previousRouteName,
      'previousRouteArguments': previousRouteArguments,
      'didPush': didPush,
    });
  }
}

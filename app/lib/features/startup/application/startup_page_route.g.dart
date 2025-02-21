// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'startup_page_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $appStartupPageRoute,
    ];

RouteBase get $appStartupPageRoute => GoRouteData.$route(
      path: '/startup',
      factory: $AppStartupPageRouteExtension._fromState,
    );

extension $AppStartupPageRouteExtension on AppStartupPageRoute {
  static AppStartupPageRoute _fromState(GoRouterState state) =>
      const AppStartupPageRoute();

  String get location => GoRouteData.$location(
        '/startup',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

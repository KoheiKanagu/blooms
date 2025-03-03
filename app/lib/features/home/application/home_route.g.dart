// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'home_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$homeTabRoute];

RouteBase get $homeTabRoute => GoRouteData.$route(
  path: '/home',

  factory: $HomeTabRouteExtension._fromState,
);

extension $HomeTabRouteExtension on HomeTabRoute {
  static HomeTabRoute _fromState(GoRouterState state) => const HomeTabRoute();

  String get location => GoRouteData.$location('/home');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

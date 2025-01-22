import 'package:blooms/features/home/presentation/home_tab.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

part 'home_route.g.dart';

@TypedGoRoute<HomeTabRoute>(
  path: HomeTabRoute.path,
)
class HomeTabRoute extends GoRouteData {
  const HomeTabRoute();

  static const path = '/home';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeTab();
  }
}

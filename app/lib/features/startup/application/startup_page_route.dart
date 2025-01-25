import 'package:blooms/features/startup/presentation/startup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

part 'startup_page_route.g.dart';

@TypedGoRoute<AppStartupPageRoute>(path: AppStartupPageRoute.path)
class AppStartupPageRoute extends GoRouteData {
  const AppStartupPageRoute();

  static const path = '/startup';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: AppStartupWidget(), name: path);
  }
}

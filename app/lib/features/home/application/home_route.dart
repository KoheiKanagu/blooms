import 'package:blooms/features/home/presentation/home_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

part 'home_route.g.dart';

@TypedGoRoute<HomeTabRoute>(
  path: HomeTabRoute.path,
)
class HomeTabRoute extends GoRouteData {
  const HomeTabRoute();

  static const path = '/home';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      child: const HomeTab(),
      name: state.matchedLocation,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}

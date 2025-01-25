import 'package:blooms/features/onboarding/presentation/onboarding_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

part 'onboarding_page_route.g.dart';

@TypedGoRoute<OnboardingPageRoute>(path: OnboardingPageRoute.path)
class OnboardingPageRoute extends GoRouteData {
  const OnboardingPageRoute();

  static const path = '/onboarding';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CupertinoPage(
      child: const OnboardingPage(),
      name: state.matchedLocation,
    );
  }
}

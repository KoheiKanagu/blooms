import 'package:blooms/features/condition/presentation/condition_page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

part 'condition_page_route.g.dart';

@TypedGoRoute<ConditionPageRoute>(
  path: ConditionPageRoute.path,
)
class ConditionPageRoute extends GoRouteData {
  const ConditionPageRoute();

  static const path = '/condition';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ConditionPage();
  }
}

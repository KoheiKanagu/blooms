import 'package:blooms/features/highlight/presentation/highlight_page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

part 'highlight_route.g.dart';

@TypedGoRoute<HighlightPageRoute>(
  path: HighlightPageRoute.path,
)
class HighlightPageRoute extends GoRouteData {
  const HighlightPageRoute();

  static const path = '/highlight';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HighlightPage();
  }
}

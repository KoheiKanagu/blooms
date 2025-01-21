import 'package:blooms/features/report/presentaion/report_page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

part 'report_route.g.dart';

@TypedGoRoute<ReportPageRoute>(
  path: ReportPageRoute.path,
)
class ReportPageRoute extends GoRouteData {
  const ReportPageRoute();

  static const path = '/report';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ReportPage();
  }
}

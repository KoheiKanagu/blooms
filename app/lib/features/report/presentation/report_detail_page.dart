import 'package:blooms/features/report/domain/report.dart';
import 'package:blooms/features/report/presentation/report_detail_tile.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReportDetailPage extends HookConsumerWidget {
  const ReportDetailPage({
    required this.report,
    super.key,
  });

  final Report report;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      backgroundColor:
          CupertinoColors.systemGroupedBackground.resolveFrom(context),
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          i18n.report.xToY(
            x: report.reportPeriod.endDate,
            y: report.reportPeriod.startDate,
          ),
        ),
      ),
      child: ListView(
        children: [
          ReportDetailTile(
            report: report,
          ),
        ],
      ),
    );
  }
}

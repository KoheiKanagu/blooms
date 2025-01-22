import 'package:blooms/features/report/domain/report.dart';
import 'package:blooms/features/report/domain/report_type.dart';
import 'package:blooms/features/report/presentation/report_type_badge.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class ReportPageListTile extends StatelessWidget {
  const ReportPageListTile({
    required this.report,
    required this.reportPeriod,
    required this.onPressed,
    super.key,
  });

  final Report report;

  final ({
    String endDate,
    String startDate,
  }) reportPeriod;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      children: [
        CupertinoListTile.notched(
          backgroundColor:
              CupertinoColors.systemBackground.resolveFrom(context),
          title: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  // TODO: summary
                  '午前中に眠気、喉の痛み、食欲の増加が確認されました。',
                  maxLines: 10,
                ),
                const Gap(8),
                ReportTypeBadge(report.type),
              ],
            ),
          ),
          trailing: Row(
            children: [
              Column(
                children: [
                  Text(
                    reportPeriod.startDate,
                    style:
                        CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                              fontSize: 14,
                              color: CupertinoColors.label.resolveFrom(context),
                            ),
                  ),
                  Visibility(
                    visible: report.type != ReportType.past1day,
                    child: Text(
                      reportPeriod.endDate,
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(
                            fontSize: 14,
                            color: CupertinoColors.secondaryLabel
                                .resolveFrom(context),
                          ),
                    ),
                  ),
                ],
              ),
              const Icon(CupertinoIcons.forward),
            ],
          ),
          onTap: onPressed,
        ),
      ],
    );
  }
}

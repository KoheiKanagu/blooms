import 'package:blooms/features/report/application/report_providers.dart';
import 'package:blooms/features/report/domain/report.dart';
import 'package:blooms/features/report/domain/report_type.dart';
import 'package:blooms/features/report/presentaion/report_type_badge.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReportPage extends HookConsumerWidget {
  const ReportPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      backgroundColor:
          CupertinoColors.systemGroupedBackground.resolveFrom(context),
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          i18n.report.report,
        ),
      ),
      child: ref.watch(reportQueryProvider).maybeWhen(
            orElse: () => const CircularProgressIndicator.adaptive(),
            data: (query) => FirestoreListView<Report>(
              query: query,
              itemBuilder: (context, snapshot) {
                final report = snapshot.data();
                final reportPeriod = report.reportPeriod;

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
                                style: CupertinoTheme.of(context)
                                    .textTheme
                                    .textStyle
                                    .copyWith(
                                      fontSize: 14,
                                      color: CupertinoColors.label
                                          .resolveFrom(context),
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
                      onTap: () {},
                    ),
                  ],
                );
              },
            ),
          ),
    );
  }
}

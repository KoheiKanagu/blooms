import 'package:blooms/features/report/application/report_providers.dart';
import 'package:blooms/features/report/domain/report.dart';
import 'package:blooms/features/report/presentaion/report_page_list_tile.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

                return ReportPageListTile(
                  report: report,
                  reportPeriod: reportPeriod,
                  onPressed: () {},
                );
              },
            ),
          ),
    );
  }
}

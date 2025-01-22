import 'package:blooms/features/report/domain/report.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReportDetailTile extends HookConsumerWidget {
  const ReportDetailTile({
    required this.report,
    super.key,
  });

  final Report report;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoListSection.insetGrouped(
      children: const [
        CupertinoListTile(
          title: Text(
            'TODO',
          ),
        ),
      ],
    );
  }
}

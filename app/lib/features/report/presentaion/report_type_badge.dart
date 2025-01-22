import 'package:blooms/features/report/domain/report_type.dart';
import 'package:flutter/cupertino.dart';

class ReportTypeBadge extends StatelessWidget {
  const ReportTypeBadge(
    this.type, {
    super.key,
  });

  final ReportType type;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.tinted(
      sizeStyle: CupertinoButtonSize.small,
      padding: EdgeInsets.zero,
      color: switch (type) {
        ReportType.past1day => CupertinoColors.systemGreen.resolveFrom(context),
        ReportType.past7days => CupertinoColors.systemBlue.resolveFrom(context),
        ReportType.past14days =>
          CupertinoColors.systemYellow.resolveFrom(context),
        ReportType.past21days =>
          CupertinoColors.systemOrange.resolveFrom(context),
        ReportType.past28days => CupertinoColors.systemRed.resolveFrom(context),
      },
      child: Text(
        type.days.toString(),
      ),
      onPressed: () {},
    );
  }
}

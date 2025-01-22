import 'package:blooms/features/report/domain/report_state.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';

class ReportStateBadge extends StatelessWidget {
  const ReportStateBadge(
    this.state, {
    super.key,
  });

  final ReportState state;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CupertinoButton.tinted(
        sizeStyle: CupertinoButtonSize.small,
        color: switch (state) {
          ReportState.pending =>
            CupertinoColors.systemGrey.resolveFrom(context),
          ReportState.inProgress =>
            CupertinoColors.systemGrey.resolveFrom(context),
          ReportState.success =>
            CupertinoColors.systemGreen.resolveFrom(context),
          ReportState.failure => CupertinoColors.systemRed.resolveFrom(context),
        },
        child: switch (state) {
          ReportState.pending => Text(i18n.report.state.pending),
          ReportState.inProgress => const CupertinoActivityIndicator(),
          ReportState.success => const SizedBox.shrink(),
          ReportState.failure => Text(i18n.report.state.failure),
        },
        onPressed: () {},
      ),
    );
  }
}

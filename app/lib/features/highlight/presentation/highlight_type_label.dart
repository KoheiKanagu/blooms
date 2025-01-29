import 'package:blooms/features/highlight/domain/highlight_period.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class HighlightTypeLabel extends StatelessWidget {
  const HighlightTypeLabel(
    this.period, {
    super.key,
  });

  final HighlightPeriod period;

  @override
  Widget build(BuildContext context) {
    return Text(
      switch (period) {
        HighlightPeriod.past1day => i18n.highlight.onTheDay,
        HighlightPeriod.past7days ||
        HighlightPeriod.past14days ||
        HighlightPeriod.past21days ||
        HighlightPeriod.past28days =>
          i18n.highlight.pastDays(n: period.days),
      },
      style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
            fontWeight: FontWeight.bold,
            color: switch (period) {
              HighlightPeriod.past1day =>
                CupertinoColors.systemRed.resolveFrom(context),
              HighlightPeriod.past7days =>
                CupertinoColors.systemOrange.resolveFrom(context),
              HighlightPeriod.past14days =>
                CupertinoColors.systemGreen.resolveFrom(context),
              HighlightPeriod.past21days =>
                CupertinoColors.systemCyan.resolveFrom(context),
              HighlightPeriod.past28days =>
                CupertinoColors.systemPurple.resolveFrom(context),
            },
          ),
    );
  }
}

@widgetbook.UseCase(
  name: 'HighlightTypeLabel',
  type: HighlightTypeLabel,
)
Widget highlightTypeLabel(BuildContext context) {
  return CupertinoPageScaffold(
    child: ListView(
      children: const [
        HighlightTypeLabel(HighlightPeriod.past1day),
        HighlightTypeLabel(HighlightPeriod.past7days),
        HighlightTypeLabel(HighlightPeriod.past14days),
        HighlightTypeLabel(HighlightPeriod.past21days),
        HighlightTypeLabel(HighlightPeriod.past28days),
      ],
    ),
  );
}

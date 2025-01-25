import 'package:blooms/features/highlight/domain/highlight_type.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class HighlightTypeLabel extends StatelessWidget {
  const HighlightTypeLabel(
    this.type, {
    super.key,
  });

  final HighlightType type;

  @override
  Widget build(BuildContext context) {
    return Text(
      switch (type) {
        HighlightType.past1day => i18n.highlight.onTheDay,
        HighlightType.past7days ||
        HighlightType.past14days ||
        HighlightType.past21days ||
        HighlightType.past28days =>
          i18n.highlight.pastDays(n: type.days),
      },
      style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
            fontWeight: FontWeight.bold,
            color: switch (type) {
              HighlightType.past1day =>
                CupertinoColors.systemRed.resolveFrom(context),
              HighlightType.past7days =>
                CupertinoColors.systemOrange.resolveFrom(context),
              HighlightType.past14days =>
                CupertinoColors.systemGreen.resolveFrom(context),
              HighlightType.past21days =>
                CupertinoColors.systemCyan.resolveFrom(context),
              HighlightType.past28days =>
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
        HighlightTypeLabel(HighlightType.past1day),
        HighlightTypeLabel(HighlightType.past7days),
        HighlightTypeLabel(HighlightType.past14days),
        HighlightTypeLabel(HighlightType.past21days),
        HighlightTypeLabel(HighlightType.past28days),
      ],
    ),
  );
}

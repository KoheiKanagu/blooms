import 'package:blooms/features/highlight/domain/highlight_period.dart';
import 'package:blooms/features/highlight/presentation/highlight_tile.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/theme/my_date_format.dart';
import 'package:clock/clock.dart';
import 'package:flutter/cupertino.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class HighlightCreatePageTile extends StatelessWidget {
  HighlightCreatePageTile({
    required this.period,
    required this.selected,
    required this.onTap,
    DateTime? today,
    super.key,
  }) {
    this.today = today ??= clock.now();
  }

  final HighlightPeriod period;

  final bool selected;

  late final DateTime today;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HighlightTile(
      period: period,
      description: descriptionText(),
      onTap: onTap,
      selected: selected,
      contentText: i18n.highlight.nDaysConditionSummary(
        n: period.localizedName,
      ),
    );
  }

  String descriptionText() {
    final nowDate = myDateFormat(today);
    final pastDate = myDateFormat(period.pastDate(today));

    return switch (period) {
      HighlightPeriod.past1day => i18n.highlight.onTheDayTarget(date: nowDate),
      HighlightPeriod.past7days ||
      HighlightPeriod.past14days ||
      HighlightPeriod.past21days ||
      HighlightPeriod
          .past28days => i18n.highlight.xToYTarget(x: pastDate, y: nowDate),
    };
  }
}

@widgetbook.UseCase(
  name: 'HighlightCreatePageTile',
  type: HighlightCreatePageTile,
)
Widget highlightCreatePageTile(BuildContext context) {
  return CupertinoPageScaffold(
    child: ListView(
      children:
          HighlightPeriod.values
              .map(
                (period) => HighlightCreatePageTile(
                  period: period,
                  selected: context.knobs.boolean(label: 'Selected'),
                  today: context.knobs.dateTime(
                    label: 'Today',
                    initialValue: DateTime(2025),
                    start: DateTime(2025),
                    end: DateTime(2025, 12, 31),
                  ),
                  onTap: () {},
                ),
              )
              .toList(),
    ),
  );
}

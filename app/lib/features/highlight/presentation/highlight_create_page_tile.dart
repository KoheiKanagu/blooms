import 'package:blooms/features/highlight/domain/highlight_type.dart';
import 'package:blooms/features/highlight/presentation/highlight_type_label.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:clock/clock.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class HighlightCreatePageTile extends HookConsumerWidget {
  const HighlightCreatePageTile({
    required this.type,
    required this.selected,
    required this.onTap,
    super.key,
  });

  final HighlightType type;

  final bool selected;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: CupertinoListSection.insetGrouped(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: CupertinoTheme.of(context).primaryColor,
            width: selected ? 2 : 0,
          ),
          borderRadius: BorderRadius.circular(20),
          color: CupertinoColors.systemBackground.resolveFrom(context),
        ),
        additionalDividerMargin: 0,
        dividerMargin: 0,
        children: [
          CupertinoListTile.notched(
            title: HighlightTypeLabel(type),
            subtitle: Text(
              subtitleText(),
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              maxLines: 10,
            ),
            trailing: Icon(
              selected
                  ? CupertinoIcons.check_mark_circled_solid
                  : CupertinoIcons.circle,
            ),
          ),
          CupertinoListTile.notched(
            title: Text(
              i18n.highlight.nDaysConditionSummary(n: type.localizedName),
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    fontSize: 14,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  String subtitleText() {
    final format = DateFormat.MMMEd();

    final nowDate = format.format(clock.now());
    final pastDate = format.format(type.pastDate);

    return switch (type) {
      HighlightType.past1day => i18n.highlight.onTheDayTarget(date: nowDate),
      HighlightType.past7days ||
      HighlightType.past14days ||
      HighlightType.past21days ||
      HighlightType.past28days =>
        i18n.highlight.xToYTarget(x: pastDate, y: nowDate),
    };
  }
}

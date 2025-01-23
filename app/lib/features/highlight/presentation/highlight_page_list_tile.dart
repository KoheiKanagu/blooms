import 'package:blooms/features/highlight/domain/highlight.dart';
import 'package:blooms/features/highlight/domain/highlight_state.dart';
import 'package:blooms/features/highlight/domain/highlight_type.dart';
import 'package:blooms/features/highlight/presentation/highlight_state_label.dart';
import 'package:blooms/features/highlight/presentation/highlight_type_label.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class HighlightPageListTile extends StatelessWidget {
  const HighlightPageListTile({
    required this.highlight,
    required this.onPressed,
    super.key,
  });

  final Highlight highlight;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: highlight.state == HighlightState.success ? onPressed : null,
      child: CupertinoListSection.insetGrouped(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 4,
        ),
        additionalDividerMargin: 0,
        dividerMargin: 0,
        children: [
          CupertinoListTile.notched(
            backgroundColor:
                CupertinoColors.systemBackground.resolveFrom(context),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    HighlightTypeLabel(highlight.type),
                    const Spacer(),
                    Icon(
                      CupertinoIcons.forward,
                      color: highlight.state == HighlightState.success
                          ? CupertinoColors.systemGrey2.resolveFrom(context)
                          : CupertinoColors.systemGrey5.resolveFrom(context),
                    ),
                  ],
                ),
                HighlightStateLabel(highlight.state),
                const Gap(8),
                Text(
                  highlight.type == HighlightType.past1day
                      ? highlight.highlightPeriod.endDate
                      : i18n.highlight.xToY(
                          x: highlight.highlightPeriod.startDate,
                          y: highlight.highlightPeriod.endDate,
                        ),
                  style:
                      CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                ),
              ],
            ),
          ),
          if (highlight.state == HighlightState.success)
            CupertinoListTile.notched(
              title: Column(
                children: [
                  Text(
                    highlight.content?.abstract ?? '',
                    maxLines: 10,
                  ),
                  const Gap(8),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

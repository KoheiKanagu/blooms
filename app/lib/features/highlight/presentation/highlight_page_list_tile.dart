import 'package:blooms/features/highlight/domain/highlight.dart';
import 'package:blooms/features/highlight/domain/highlight_state.dart';
import 'package:blooms/features/highlight/domain/highlight_type.dart';
import 'package:blooms/features/highlight/presentation/highlight_state_badge.dart';
import 'package:blooms/features/highlight/presentation/highlight_type_badge.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class HighlightPageListTile extends StatelessWidget {
  const HighlightPageListTile({
    required this.highlight,
    required this.highlightPeriod,
    required this.onPressed,
    super.key,
  });

  final Highlight highlight;

  final ({
    String endDate,
    String startDate,
  }) highlightPeriod;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
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
                Visibility(
                  visible: highlight.state == HighlightState.success,
                  child: Column(
                    children: [
                      Text(
                        highlight.content?.abstract ?? '',
                        maxLines: 10,
                      ),
                      const Gap(8),
                    ],
                  ),
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    HighlightTypeBadge(highlight.type),
                    HighlightStateBadge(highlight.state),
                  ],
                ),
              ],
            ),
          ),
          trailing: Row(
            children: [
              Column(
                children: [
                  Text(
                    highlightPeriod.startDate,
                    style:
                        CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                              fontSize: 14,
                              color: CupertinoColors.label.resolveFrom(context),
                            ),
                  ),
                  Visibility(
                    visible: highlight.type != HighlightType.past1day,
                    child: Text(
                      highlightPeriod.endDate,
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
              Icon(
                CupertinoIcons.forward,
                color: highlight.state == HighlightState.success
                    ? CupertinoTheme.of(context).primaryColor
                    : CupertinoColors.systemGrey4.resolveFrom(context),
              ),
            ],
          ),
          onTap: highlight.state == HighlightState.success ? onPressed : null,
        ),
      ],
    );
  }
}

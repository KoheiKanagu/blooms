import 'package:blooms/features/condition/presentation/condition_bubble_blooms_icon.dart';
import 'package:blooms/features/highlight/domain/highlight_content.dart';
import 'package:blooms/features/highlight/presentation/highlight_prompt_page.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/theme/my_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HighlightDetailTile extends HookConsumerWidget {
  const HighlightDetailTile({
    required this.content,
    super.key,
  });

  final HighlightContent content;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (content is HighlightContentEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(i18n.unknownContent),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        switch (content) {
          HighlightContentSummary(:final summary) => Padding(
              padding: const EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: myColorGreen2.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ConditionBubbleBloomsIcon(),
                    Text(
                      summary,
                      maxLines: 100,
                    ),
                  ],
                ),
              ),
            ),
          HighlightContentEmpty() => throw UnimplementedError(),
        },
        const Gap(8),
        CupertinoButton(
          sizeStyle: CupertinoButtonSize.small,
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Builder(
              builder: (context) {
                final textStyle = CupertinoTheme.of(context)
                    .textTheme
                    .actionSmallTextStyle
                    .copyWith(
                      fontSize: 14,
                    );

                return Row(
                  children: [
                    Text(
                      i18n.highlight.createdFromThisRecords,
                      style: textStyle,
                    ),
                    const Gap(4),
                    Icon(
                      CupertinoIcons.right_chevron,
                      size: textStyle.fontSize,
                      color: textStyle.color,
                    ),
                  ],
                );
              },
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(
              CupertinoPageRoute<void>(
                builder: (_) => HighlightPromptPage(
                  promptFileUri: content.promptFileUri,
                ),
                settings: const RouteSettings(
                  name: HighlightPromptPage.path,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

import 'package:blooms/features/highlight/domain/highlight_style.dart';
import 'package:blooms/features/highlight/presentation/highlight_icon.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/theme/my_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class HighlightCreatePageHeader extends StatelessWidget {
  const HighlightCreatePageHeader({
    required this.style,
    super.key,
  });

  final HighlightStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          DecoratedBox(
            decoration: MyDecoration.dropShadow(context).copyWith(
              color: CupertinoColors.secondarySystemGroupedBackground
                  .resolveFrom(context),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const SizedBox.square(
              dimension: 96,
              child: HighlightIcon(),
            ),
          ),
          const Gap(16),
          Text(
            i18n.highlight.createNewHighlight.title,
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const Gap(8),
          Column(
            key: ValueKey(style),
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: switch (style) {
              HighlightStyle.private => [
                  Text(i18n.highlight.createNewHighlight.privateDescription1),
                  Text(i18n.highlight.createNewHighlight.privateDescription2),
                ],
              HighlightStyle.professional => [
                  Text(
                    i18n.highlight.createNewHighlight.professionalDescription1,
                  ),
                  Text(
                    i18n.highlight.createNewHighlight.professionalDescription2,
                  ),
                ]
            },
          ),
        ],
      ),
    );
  }
}

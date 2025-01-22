import 'package:blooms/features/highlight/domain/highlight_type.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';

class HighlightTypeBadge extends StatelessWidget {
  const HighlightTypeBadge(
    this.type, {
    super.key,
  });

  final HighlightType type;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CupertinoButton.tinted(
        sizeStyle: CupertinoButtonSize.small,
        color: switch (type) {
          HighlightType.past1day =>
            CupertinoColors.systemGreen.resolveFrom(context),
          HighlightType.past7days =>
            CupertinoColors.systemBlue.resolveFrom(context),
          HighlightType.past14days =>
            CupertinoColors.systemYellow.resolveFrom(context),
          HighlightType.past21days =>
            CupertinoColors.systemOrange.resolveFrom(context),
          HighlightType.past28days =>
            CupertinoColors.systemRed.resolveFrom(context),
        },
        child: Text(
          switch (type) {
            HighlightType.past1day => i18n.highlight.onTheDay,
            HighlightType.past7days ||
            HighlightType.past14days ||
            HighlightType.past21days ||
            HighlightType.past28days =>
              i18n.highlight.pastDays(n: type.days),
          },
        ),
        onPressed: () {},
      ),
    );
  }
}

import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class HighlightStyleFeaturesList extends StatelessWidget {
  const HighlightStyleFeaturesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final featureTextStyle =
        CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontSize: 14,
            );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Text(
            i18n.highlight.features.description,
            style: featureTextStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Gap(8),
        const _Features(),
      ],
    );
  }
}

class _Features extends StatelessWidget {
  const _Features();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SimpleText(
          text: i18n.highlight.features.summary.care,
          icon: const Icon(
            CupertinoIcons.heart_circle_fill,
            color: CupertinoColors.systemPink,
          ),
        ),
        _SimpleText(
          text: i18n.highlight.features.summary.summary,
          icon: const Icon(
            CupertinoIcons.search_circle_fill,
            color: CupertinoColors.systemBlue,
          ),
        ),
        _SimpleText(
          text: i18n.highlight.features.summary.disclaimer,
          icon: const Icon(
            CupertinoIcons.xmark_circle_fill,
            color: CupertinoColors.systemRed,
          ),
        ),
      ],
    );
  }
}

class _SimpleText extends StatelessWidget {
  const _SimpleText({
    required this.text,
    required this.icon,
  });

  final String text;

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      title: Text(
        text,
        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontSize: 14,
            ),
        maxLines: 10,
      ),
      leading: icon,
    );
  }
}

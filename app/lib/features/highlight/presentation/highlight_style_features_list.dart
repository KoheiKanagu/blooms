import 'package:blooms/features/highlight/domain/highlight_style.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/widgets/show_grounding_modal_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

class HighlightStyleFeaturesList extends StatelessWidget {
  const HighlightStyleFeaturesList({
    required this.style,
    super.key,
  });

  final HighlightStyle style;

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
        switch (style) {
          HighlightStyle.private => const _PrivateFeatures(),
          HighlightStyle.professional => const _ProfessionalFeatures(),
        },
      ],
    );
  }
}

class _ProfessionalFeatures extends StatelessWidget {
  const _ProfessionalFeatures();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SimpleText(
          text: i18n.highlight.features.professional.medical,
          icon: const Icon(
            CupertinoIcons.person_circle_fill,
            color: CupertinoColors.systemPink,
          ),
        ),
        _SimpleText(
          text: i18n.highlight.features.professional.summary,
          icon: const Icon(
            CupertinoIcons.equal_circle_fill,
            color: CupertinoColors.systemCyan,
          ),
        ),
        _SimpleText(
          text: i18n.highlight.features.professional.disclaimer,
          icon: const Icon(
            CupertinoIcons.xmark_circle_fill,
            color: CupertinoColors.systemRed,
          ),
        ),
      ],
    );
  }
}

class _PrivateFeatures extends StatelessWidget {
  const _PrivateFeatures();

  @override
  Widget build(BuildContext context) {
    final featureTextStyle =
        CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontSize: 14,
            );

    return Column(
      children: [
        _SimpleText(
          text: i18n.highlight.features.private.care,
          icon: const Icon(
            CupertinoIcons.heart_circle_fill,
            color: CupertinoColors.systemPink,
          ),
        ),
        _SimpleText(
          text: i18n.highlight.features.private.trend,
          icon: const Icon(
            CupertinoIcons.search_circle_fill,
            color: CupertinoColors.systemBlue,
          ),
        ),
        _SimpleText(
          text: i18n.highlight.features.private.advice,
          icon: const Icon(
            CupertinoIcons.star_circle_fill,
            color: CupertinoColors.systemOrange,
          ),
        ),
        CupertinoListTile(
          title: Text.rich(
            i18n.highlight.features.private.grounding(
              grounding: TextSpan(
                text: i18n.grounding,
                style: featureTextStyle.copyWith(
                  color: CupertinoColors.activeBlue,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    showGroundingModalSheet(context);
                  },
              ),
            ),
            style: featureTextStyle,
            maxLines: 10,
          ),
          leading: const Icon(
            CupertinoIcons.checkmark_circle_fill,
            color: CupertinoColors.systemGreen,
          ),
        ),
        _SimpleText(
          text: i18n.highlight.features.private.disclaimer,
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

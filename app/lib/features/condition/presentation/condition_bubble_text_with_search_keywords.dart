import 'package:blooms/constants/my_url.dart';
import 'package:blooms/features/condition/domain/condition_content.dart';
import 'package:blooms/gen/assets.gen.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class ConditionBubbleTextWithSearchKeywords extends StatelessWidget {
  const ConditionBubbleTextWithSearchKeywords(
    this.content, {
    super.key,
  });

  final ConditionContentTextWithSearchKeywords content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Assets.blooms.image(
              width: 20,
              height: 20,
            ),
            const Gap(4),
            Text(
              i18n.blooms,
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    fontSize: 12,
                    color: CupertinoColors.secondaryLabel.resolveFrom(context),
                  ),
            ),
          ],
        ),
        const Gap(4),
        Text(
          content.text,
          style: CupertinoTheme.of(context).textTheme.textStyle,
        ),
        Visibility(
          visible: content.searchKeywords.isNotEmpty,
          child: Column(
            spacing: 4,
            children: [
              const Gap(4),
              ...content.searchKeywords.map(
                (e) => CupertinoButton.tinted(
                  sizeStyle: CupertinoButtonSize.small,
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.compass,
                        color: CupertinoColors.systemBlue.resolveFrom(context),
                      ),
                      const Gap(4),
                      Text(e),
                      const Spacer(),
                      Icon(
                        CupertinoIcons.right_chevron,
                        color: CupertinoColors.systemBlue.resolveFrom(context),
                      ),
                    ],
                  ),
                  onPressed: () {
                    launchUrl(
                      MyUrl.buildSearchURL(e),
                    );
                  },
                ),
              ),
            ].toList(),
          ),
        ),
      ],
    );
  }
}

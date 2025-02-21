import 'package:blooms/constants/my_url.dart';
import 'package:blooms/features/condition/domain/condition_content.dart';
import 'package:blooms/features/condition/domain/condition_creator_type.dart';
import 'package:blooms/features/condition/presentation/condition_bubble_blooms_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class ConditionBubbleTextWithSearchKeywords extends StatelessWidget {
  const ConditionBubbleTextWithSearchKeywords(
    this.content, {
    required this.creatorType,
    super.key,
  });

  final ConditionContentTextWithSearchKeywords content;

  final ConditionCreatorType creatorType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (creatorType == ConditionCreatorType.model)
          const ConditionBubbleBloomsIcon(),
        Text(
          content.text,
          style: CupertinoTheme.of(context).textTheme.textStyle,
        ),
        Visibility(
          visible: content.searchKeywords.isNotEmpty,
          child: Column(
            spacing: 4,
            children:
                [
                  const Gap(4),
                  ...content.searchKeywords.map(
                    (e) => CupertinoButton.tinted(
                      sizeStyle: CupertinoButtonSize.small,
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.compass,
                            color: CupertinoColors.systemBlue.resolveFrom(
                              context,
                            ),
                          ),
                          const Gap(4),
                          Text(e),
                          const Spacer(),
                          Icon(
                            CupertinoIcons.right_chevron,
                            color: CupertinoColors.systemBlue.resolveFrom(
                              context,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        launchUrl(MyUrl.buildSearchURL(e));
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

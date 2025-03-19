import 'package:blooms/features/condition/domain/condition_content.dart';
import 'package:blooms/features/condition/domain/condition_creator_type.dart';
import 'package:blooms/features/condition/presentation/condition_bubble_blooms_icon.dart';
import 'package:blooms/features/condition/presentation/condition_bubble_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConditionBubbleImages extends HookConsumerWidget {
  const ConditionBubbleImages(
    this.content, {
    required this.creatorType,
    super.key,
  });

  final ConditionContentImage content;

  final ConditionCreatorType creatorType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        if (creatorType == ConditionCreatorType.model)
          const ConditionBubbleBloomsIcon(),
        Column(
          spacing: 4,
          children:
              content.attachments
                  .map<Widget>(
                    (attachment) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ConditionBubbleImage(attachment),
                    ),
                  )
                  .toList(),
        ),
      ],
    );
  }
}

import 'package:blooms/features/condition/domain/condition_content.dart';
import 'package:blooms/features/condition/domain/condition_creator_type.dart';
import 'package:blooms/features/condition/presentation/condition_bubble_blooms_icon.dart';
import 'package:flutter/cupertino.dart';

class ConditionBubbleText extends StatelessWidget {
  const ConditionBubbleText(
    this.content, {
    required this.creatorType,
    super.key,
  });

  final ConditionContentText content;

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
      ],
    );
  }
}

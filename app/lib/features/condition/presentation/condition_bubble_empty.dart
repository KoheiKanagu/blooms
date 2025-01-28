import 'package:blooms/features/condition/domain/condition_content.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';

class ConditionBubbleEmpty extends StatelessWidget {
  const ConditionBubbleEmpty(
    this.content, {
    super.key,
  });

  final ConditionContentEmpty content;

  @override
  Widget build(BuildContext context) {
    return Text(
      i18n.unknownContent,
      style: CupertinoTheme.of(context).textTheme.textStyle,
    );
  }
}

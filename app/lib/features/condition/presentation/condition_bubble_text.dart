import 'package:blooms/features/condition/domain/condition_content.dart';
import 'package:flutter/cupertino.dart';

class ConditionBubbleText extends StatelessWidget {
  const ConditionBubbleText(
    this.content, {
    super.key,
  });

  final ConditionContentText content;

  @override
  Widget build(BuildContext context) {
    return Text(
      content.text,
      style: CupertinoTheme.of(context).textTheme.textStyle,
    );
  }
}

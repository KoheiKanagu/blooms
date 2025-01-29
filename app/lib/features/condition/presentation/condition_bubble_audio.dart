import 'package:blooms/features/condition/domain/condition_content.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';

class ConditionBubbleAudio extends StatelessWidget {
  const ConditionBubbleAudio(
    this.content, {
    super.key,
  });

  final ConditionContentAudio content;

  @override
  Widget build(BuildContext context) {
    return Text(
      i18n.unknownContent,
      style: CupertinoTheme.of(context).textTheme.textStyle,
    );
  }
}

import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/widgets/blooms_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class ConditionBubbleBloomsIcon extends StatelessWidget {
  const ConditionBubbleBloomsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const BloomsLogo(dimension: 20),
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
      ],
    );
  }
}

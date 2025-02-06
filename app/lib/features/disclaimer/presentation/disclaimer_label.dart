import 'package:blooms/features/disclaimer/presentation/disclaimer_page.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class DisclaimerLabel extends StatelessWidget {
  const DisclaimerLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(8),
        CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: 0,
          child: Row(
            children: [
              Icon(
                CupertinoIcons.exclamationmark_triangle_fill,
                color: CupertinoColors.systemYellow.resolveFrom(context),
                size: 16,
              ),
              const Gap(4),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    i18n.disclaimer.label,
                    style:
                        CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                              color: CupertinoColors.secondaryLabel
                                  .resolveFrom(context),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                  ),
                ),
              ),
            ],
          ),
          onPressed: () {
            showCupertinoModalPopup<bool>(
              context: context,
              builder: (context) => const DisclaimerPage(),
            );
          },
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    required this.descriptions,
    required this.disclaimers,
    super.key,
  });

  final List<Text> descriptions;

  final List<Text> disclaimers;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: DefaultTextStyle(
        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontSize: 14,
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            ...descriptions,
            if (disclaimers.isNotEmpty) const Gap(8),
            DefaultTextStyle(
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    fontSize: 12,
                    color: CupertinoColors.secondaryLabel.resolveFrom(context),
                  ),
              child: Column(
                spacing: 4,
                children: disclaimers
                    .map(
                      (e) => Row(
                        children: [
                          Icon(
                            CupertinoIcons.exclamationmark_triangle,
                            size: 14,
                            color: CupertinoColors.secondaryLabel
                                .resolveFrom(context),
                          ),
                          const Gap(4),
                          Expanded(
                            child: e,
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

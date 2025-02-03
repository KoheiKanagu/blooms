import 'package:blooms/utils/budoux.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({
    required this.child,
    required this.title,
    required this.subtitle,
    super.key,
  });

  final Widget child;

  final String title;

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          IgnorePointer(
            child: child,
          ),
          const Gap(12),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              style:
                  CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
            ),
          ),
          const Gap(8),
          subtitle.wrapBudouXText(
            style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
            alignment: WrapAlignment.center,
          ),
          const Gap(32),
        ],
      ),
    );
  }
}

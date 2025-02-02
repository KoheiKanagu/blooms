import 'package:blooms/features/onboarding/presentation/onboarding_app_icon.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class OnboardingPageBodyName extends StatelessWidget {
  const OnboardingPageBodyName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      children: [
        const OnboardingAppIcon(),
        const Gap(32),
        Text(
          i18n.blooms,
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
          textAlign: TextAlign.center,
        ),
        const Gap(8),
        DefaultTextStyle(
          style: CupertinoTheme.of(context)
              .textTheme
              .navLargeTitleTextStyle
              .copyWith(
                fontSize: 24,
              ),
          child: const Wrap(
            alignment: WrapAlignment.center,
            children: [
              Text('妊娠中のあなたの体調を'),
              Text('理解しやすくします'),
            ],
          ),
        ),
        const Gap(64),
        Text(
          'あなたの日々の体調の記録し、分析することで、体調の変化を深く理解しましょう。',
          style: CupertinoTheme.of(context).textTheme.textStyle,
        ),
      ],
    );
  }
}

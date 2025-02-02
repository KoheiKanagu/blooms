import 'package:blooms/features/onboarding/presentation/onboarding_app_icon.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_body.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_header.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';

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
        OnboardingHeader(
          title: i18n.blooms,
          subtitle: i18n.onboarding.subtitle,
          child: const OnboardingAppIcon(),
        ),
        const OnboardingBody(
          descriptions: [
            'あなたの日々の体調の記録し、分析することで、体調の変化を深く理解しましょう。',
          ],
        ),
      ],
    );
  }
}

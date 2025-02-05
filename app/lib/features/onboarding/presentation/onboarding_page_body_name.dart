import 'package:blooms/features/onboarding/presentation/onboarding_app_icon.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_body.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_header.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_page.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class OnboardingPageBodyName extends StatelessWidget {
  const OnboardingPageBodyName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OnboardingHeader(
          title: i18n.onboarding.name.title,
          subtitle: i18n.onboarding.name.subtitle,
          child: const OnboardingAppIcon(),
        ),
        OnboardingBody(
          descriptions: [
            Text(i18n.onboarding.name.description1),
            Text(i18n.onboarding.name.description2),
          ],
          disclaimers: const [],
        ),
      ],
    );
  }
}

@widgetbook.UseCase(
  name: 'name',
  type: OnboardingPage,
)
Widget onboardingPageBodyName(BuildContext context) {
  return const CupertinoPageScaffold(
    child: SafeArea(
      child: OnboardingPageBodyName(),
    ),
  );
}

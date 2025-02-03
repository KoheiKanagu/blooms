import 'package:blooms/features/onboarding/presentation/onboarding_app_icon.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_footer.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_header.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_page.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class OnboardingPageBodyLetsStart extends HookConsumerWidget {
  const OnboardingPageBodyLetsStart({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        OnboardingHeader(
          title: i18n.onboarding.letsGetStarted,
          subtitle: '',
          child: const OnboardingAppIcon(),
        ),
        const Spacer(),
        const OnboardingFooter(),
      ],
    );
  }
}

@widgetbook.UseCase(
  name: 'lets start',
  type: OnboardingPage,
)
Widget onboardingPageBodyLetsStart(BuildContext context) {
  return const CupertinoPageScaffold(
    child: SafeArea(
      child: OnboardingPageBodyLetsStart(),
    ),
  );
}

import 'package:blooms/features/onboarding/presentation/onboarding_app_icon.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_footer.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_header.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnboardingPageBodyLetsStart extends HookConsumerWidget {
  const OnboardingPageBodyLetsStart({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          OnboardingHeader(
            title: i18n.onboarding.letsGetStarted,
            subtitle: '',
            child: const OnboardingAppIcon(),
          ),
          const Spacer(),
          const OnboardingFooter(),
        ],
      ),
    );
  }
}

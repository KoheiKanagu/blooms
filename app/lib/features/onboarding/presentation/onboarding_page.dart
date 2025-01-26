import 'package:blooms/features/onboarding/presentation/onboarding_page_body1.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_page_body2.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_page_body3.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_page_body4.dart';
import 'package:blooms/theme/my_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class OnboardingPage extends HookConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();

    final bodyItems = [
      const OnboardingPageBody4(),
      const OnboardingPageBody1(),
      const OnboardingPageBody2(),
      const OnboardingPageBody3(),
    ];

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: bodyItems.length,
                itemBuilder: (context, index) {
                  return bodyItems[index];
                },
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: bodyItems.length,
              effect: SlideEffect(
                dotColor: CupertinoColors.systemGrey5.resolveFrom(context),
                activeDotColor: myColorPink1.resolveFrom(context),
              ),
            ),
            const Gap(8),
          ],
        ),
      ),
    );
  }
}

@widgetbook.UseCase(
  name: 'OnboardingPage',
  type: OnboardingPage,
)
Widget onboardingPage(BuildContext context) {
  return const OnboardingPage();
}

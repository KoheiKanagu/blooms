import 'package:blooms/features/onboarding/presentation/onboarding_page_body_highlight.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_page_body_lets_start.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_page_body_name.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_page_body_privacy.dart';
import 'package:blooms/gen/strings.g.dart';
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
    final visibleSkipButton = useState(false);

    final bodyItems = [
      const OnboardingPageBodyName(),
      const OnboardingPageBodyHighlight(),
      const OnboardingPageBodyPrivacy(),
      const OnboardingPageBodyLetsStart(),
    ];

    useEffect(
      () {
        pageController.addListener(() {
          // 最後のページではスキップボタンを表示しない
          visibleSkipButton.value = pageController.page == bodyItems.length - 1;
        });
        return null;
      },
      [context],
    );

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: Visibility(
          visible: !visibleSkipButton.value,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            sizeStyle: CupertinoButtonSize.small,
            child: Text(i18n.skip),
            onPressed: () {
              pageController.animateToPage(
                bodyItems.length - 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
      ),
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
              effect: ColorTransitionEffect(
                dotColor: CupertinoColors.systemGrey5.resolveFrom(context),
                activeDotColor: myColorPink1.resolveFrom(context),
                dotWidth: 10,
                dotHeight: 10,
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

@widgetbook.UseCase(
  name: 'name',
  type: OnboardingPage,
)
Widget onboardingPageBody1(BuildContext context) {
  return const CupertinoPageScaffold(
    child: SafeArea(
      child: OnboardingPageBodyName(),
    ),
  );
}

@widgetbook.UseCase(
  name: 'highlight',
  type: OnboardingPage,
)
Widget onboardingPageBody2(BuildContext context) {
  return const CupertinoPageScaffold(
    child: SafeArea(
      child: OnboardingPageBodyHighlight(),
    ),
  );
}

@widgetbook.UseCase(
  name: 'privacy',
  type: OnboardingPage,
)
Widget onboardingPageBody3(BuildContext context) {
  return const CupertinoPageScaffold(
    child: SafeArea(
      child: OnboardingPageBodyPrivacy(),
    ),
  );
}

@widgetbook.UseCase(
  name: 'lets start',
  type: OnboardingPage,
)
Widget onboardingPageBody4(BuildContext context) {
  return const CupertinoPageScaffold(
    child: SafeArea(
      child: OnboardingPageBodyLetsStart(),
    ),
  );
}

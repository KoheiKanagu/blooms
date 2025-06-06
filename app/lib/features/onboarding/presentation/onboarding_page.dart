import 'package:blooms/features/onboarding/presentation/onboarding_page_body_assistant.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_page_body_highlight.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_page_body_image.dart';
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
  const OnboardingPage({super.key, this.enableLetsStartPage = true});

  final bool enableLetsStartPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final visibleSkipButton = useState(false);

    final enableMoveToPreviousButton = useState(false);
    final enableMoveToNextButton = useState(true);

    final bodyItems = [
      Semantics(
        identifier: 'OnboardingPageBodyName',
        container: true,
        explicitChildNodes: true,
        child: const OnboardingPageBodyName(),
      ),
      Semantics(
        identifier: 'OnboardingPageBodyAssistant',
        container: true,
        explicitChildNodes: true,
        child: const OnboardingPageBodyAssistant(),
      ),
      Semantics(
        identifier: 'OnboardingPageBodyImage',
        container: true,
        explicitChildNodes: true,
        child: const OnboardingPageBodyImage(),
      ),
      Semantics(
        identifier: 'OnboardingPageBodyHighlight',
        container: true,
        explicitChildNodes: true,
        child: const OnboardingPageBodyHighlight(),
      ),
      Semantics(
        identifier: 'OnboardingPageBodyPrivacy',
        container: true,
        explicitChildNodes: true,
        child: const OnboardingPageBodyPrivacy(),
      ),
      if (enableLetsStartPage)
        Semantics(
          identifier: 'OnboardingPageBodyLetsStart',
          container: true,
          explicitChildNodes: true,
          child: const OnboardingPageBodyLetsStart(),
        ),
    ];

    useEffect(() {
      pageController.addListener(() {
        // 最後のページではスキップボタンを表示しない
        visibleSkipButton.value = pageController.page == bodyItems.length - 1;

        // 最初のページでは前に戻るボタンは無効
        enableMoveToPreviousButton.value = pageController.page != 0;

        // 最後のページでは次に進むボタンは無効
        enableMoveToNextButton.value =
            pageController.page != bodyItems.length - 1;
      });
      return null;
    }, [context]);

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
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: bodyItems.length,
                    itemBuilder: (context, index) => bodyItems[index],
                  ),
                ),
                const Gap(4),
                SmoothPageIndicator(
                  controller: pageController,
                  count: bodyItems.length,
                  effect: ColorTransitionEffect(
                    dotColor: CupertinoColors.systemGrey5.resolveFrom(context),
                    activeDotColor: myColorGreen1.resolveFrom(context),
                    dotWidth: 10,
                    dotHeight: 10,
                  ),
                ),
                const Gap(8),
              ],
            ),
            Positioned.fill(
              child: Row(
                children: [
                  const Gap(8),
                  Semantics(
                    identifier: 'previousButton',
                    child: CupertinoButton.tinted(
                      sizeStyle: CupertinoButtonSize.small,
                      padding: EdgeInsets.zero,
                      onPressed:
                          enableMoveToPreviousButton.value
                              ? () {
                                pageController.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              }
                              : null,
                      child: const Icon(CupertinoIcons.back),
                    ),
                  ),
                  const Spacer(),
                  Semantics(
                    identifier: 'nextButton',
                    child: CupertinoButton.tinted(
                      sizeStyle: CupertinoButtonSize.small,
                      padding: EdgeInsets.zero,
                      onPressed:
                          enableMoveToNextButton.value
                              ? () {
                                pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              }
                              : null,
                      child: const Icon(CupertinoIcons.forward),
                    ),
                  ),
                  const Gap(8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

@widgetbook.UseCase(name: 'OnboardingPage', type: OnboardingPage)
Widget onboardingPage(BuildContext context) {
  return const OnboardingPage();
}

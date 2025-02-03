import 'package:blooms/features/condition/domain/condition_content.dart';
import 'package:blooms/features/condition/domain/condition_creator_type.dart';
import 'package:blooms/features/condition/presentation/condition_bubble.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_body.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_header.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_page.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/theme/my_decoration.dart';
import 'package:clock/clock.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class OnboardingPageBodyAssistant extends HookConsumerWidget {
  const OnboardingPageBodyAssistant({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        OnboardingHeader(
          title: i18n.onboarding.assistant.title,
          subtitle: i18n.onboarding.assistant.subtitle,
          child: Container(
            decoration: BoxDecoration(
              color:
                  CupertinoColors.systemGroupedBackground.resolveFrom(context),
              borderRadius: BorderRadius.circular(10),
              boxShadow: MyDecoration.dropShadow(context).boxShadow,
            ),
            child: Column(
              children: [
                const Gap(8),
                ConditionBubble(
                  documentId: '',
                  createdAt: DateTime(2025, 2, 10, 9, 41),
                  content: const ConditionContentText(
                    text: '腰が痛い',
                  ),
                  showDateTime: true,
                  creatorType: ConditionCreatorType.user,
                ),
                const Gap(8),
                ConditionBubble(
                  documentId: '',
                  createdAt: clock.now(),
                  content: const ConditionContentTextWithSearchKeywords(
                    text: '腰が痛いのですね、つらいですね。少しでも楽になるように、調べてみると良いかもしれません。',
                    searchKeywords: [
                      '妊婦　腰痛',
                      '妊婦　腰痛　対処法',
                      '妊婦　腰痛　原因',
                    ],
                  ),
                  showDateTime: false,
                  creatorType: ConditionCreatorType.model,
                ),
                const Gap(8),
              ],
            ),
          ),
        ),
        OnboardingBody(
          descriptions: [
            Text(i18n.onboarding.assistant.description1),
            Text(i18n.onboarding.assistant.description2),
          ],
        ),
      ],
    );
  }
}

@widgetbook.UseCase(
  name: 'assistant',
  type: OnboardingPage,
)
Widget onboardingPageBodyAssistant(BuildContext context) {
  return const CupertinoPageScaffold(
    child: SafeArea(
      child: OnboardingPageBodyAssistant(),
    ),
  );
}

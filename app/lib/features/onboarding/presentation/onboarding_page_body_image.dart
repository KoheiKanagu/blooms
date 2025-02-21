import 'package:blooms/features/condition/domain/condition_content.dart';
import 'package:blooms/features/condition/domain/condition_content_image_attachment.dart';
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

class OnboardingPageBodyImage extends HookConsumerWidget {
  const OnboardingPageBodyImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        OnboardingHeader(
          title: i18n.onboarding.image.title,
          subtitle: i18n.onboarding.image.subtitle,
          child: Container(
            decoration: BoxDecoration(
              color: CupertinoColors.systemGroupedBackground.resolveFrom(
                context,
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: MyDecoration.dropShadow(context).boxShadow,
            ),
            child: Column(
              children: [
                const Gap(8),
                ConditionBubble(
                  documentId: '',
                  createdAt: DateTime(2025, 2, 10, 9, 41),
                  content: const ConditionContentImage(
                    attachments: [
                      ConditionContentImageAttachment(
                        fileUri:
                            // blooms.kingu.dev ドメインだとCORSエラーになる
                            'https://blooms-prod-43d74.web.app/assets/images/IMG_5176.jpg',
                        mimeType: 'image/jpeg',
                        width: 640,
                        height: 480,
                        additionalInfo:
                            ConditionContentImageAttachmentAdditionalInfo(
                              blurHash: r'LDJ7s_$#~U.7RjWW$%xZ?Gxu8^M{',
                            ),
                      ),
                    ],
                  ),
                  showDateTime: true,
                  creatorType: ConditionCreatorType.user,
                ),
                const Gap(8),
                ConditionBubble(
                  documentId: '',
                  createdAt: clock.now(),
                  content: const ConditionContent.text(
                    text:
                        // too long
                        // ignore: lines_longer_than_80_chars
                        '美味しそうなプリンの画像ですね！甘いものは、心も体も満たしてくれますね。もし体調に変化があれば、教えていただけると嬉しいです。',
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
            Text(i18n.onboarding.image.description1),
            Text(i18n.onboarding.image.description2),
          ],
          disclaimers: [Text(i18n.onboarding.image.disclaimer1)],
        ),
      ],
    );
  }
}

@widgetbook.UseCase(name: 'image', type: OnboardingPage)
Widget onboardingPageBodyAssistant(BuildContext context) {
  return const CupertinoPageScaffold(
    child: SafeArea(child: OnboardingPageBodyImage()),
  );
}

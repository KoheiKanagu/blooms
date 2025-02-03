// ignore_for_file: lines_longer_than_80_chars

import 'package:blooms/features/highlight/domain/highlight.dart';
import 'package:blooms/features/highlight/domain/highlight_content.dart';
import 'package:blooms/features/highlight/domain/highlight_period.dart';
import 'package:blooms/features/highlight/domain/highlight_state.dart';
import 'package:blooms/features/highlight/presentation/highlight_page_list_tile.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_body.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_header.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_page.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/theme/my_decoration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class OnboardingPageBodyHighlight extends StatelessWidget {
  const OnboardingPageBodyHighlight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OnboardingHeader(
          title: i18n.onboarding.highlight.title,
          subtitle: i18n.onboarding.highlight.subtitle,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Container(
              decoration: MyDecoration.dropShadow(context),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  children: [
                    HighlightPageListTile(
                      documentId: '',
                      highlight: Highlight(
                        subjectUid: '',
                        content: HighlightContent.summary(
                          startAt: Timestamp.fromDate(DateTime(2025, 2, 9)),
                          period: HighlightPeriod.past1day,
                          summary: '',
                          abstract:
                              '今日は少し眠気を感じやすい時間帯があったみたいですね。鼻水も出ているようなので、ゆっくり休んでくださいね。',
                          state: HighlightState.success,
                        ),
                      ),
                    ),
                    HighlightPageListTile(
                      documentId: '',
                      highlight: Highlight(
                        subjectUid: '',
                        content: HighlightContent.summary(
                          startAt: Timestamp.fromDate(DateTime(2025, 2, 9)),
                          period: HighlightPeriod.past14days,
                          summary: '',
                          abstract:
                              '最近、眠気を感じることが多いようですね。また、お腹の調子が優れない日もあったとのこと、体調管理にはお気を付けてくださいね。',
                          state: HighlightState.success,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        OnboardingBody(
          descriptions: [
            Text(i18n.onboarding.highlight.description1),
            Text(i18n.onboarding.highlight.description2),
          ],
        ),
      ],
    );
  }
}

@widgetbook.UseCase(
  name: 'highlight',
  type: OnboardingPage,
)
Widget onboardingPageBodyHighlight(BuildContext context) {
  return const CupertinoPageScaffold(
    child: SafeArea(
      child: OnboardingPageBodyHighlight(),
    ),
  );
}

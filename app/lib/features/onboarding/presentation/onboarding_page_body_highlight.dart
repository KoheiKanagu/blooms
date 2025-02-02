import 'package:blooms/features/highlight/domain/highlight_period.dart';
import 'package:blooms/features/highlight/domain/highlight_state.dart';
import 'package:blooms/features/highlight/presentation/highlight_tile.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_body.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_header.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/theme/my_date_format.dart';
import 'package:flutter/cupertino.dart';

class OnboardingPageBodyHighlight extends StatelessWidget {
  const OnboardingPageBodyHighlight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OnboardingHeader(
          title: 'ハイライト',
          subtitle: 'あなたの体調',
          child: Column(
            children: [
              HighlightTile(
                period: HighlightPeriod.past1day,
                state: HighlightState.success,
                description: myDateFormat(DateTime(2025, 1, 24)),
                onTap: () {},
                contentText:
                    '今日は少し眠気を感じやすい時間帯があったみたいですね。鼻水も出ているようなので、ゆっくり休んでくださいね。',
              ),
              HighlightTile(
                period: HighlightPeriod.past21days,
                state: HighlightState.success,
                description: i18n.highlight.xToY(
                  x: myDateFormat(DateTime(2025, 1, 3)),
                  y: myDateFormat(DateTime(2025, 1, 24)),
                ),
                onTap: () {},
                contentText:
                    '最近、眠気を感じることが多いようですね。また、お腹の調子が優れない日もあったとのこと、体調管理にはお気を付けてくださいね。',
              ),
            ],
          ),
        ),
        const OnboardingBody(
          descriptions: [
            '記録されたあなたの体調と客観的なデータを組み合わせることで、あなたの体調の変化を理解しましょう。',
          ],
        ),
      ],
    );
  }
}

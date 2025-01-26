import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:blooms/constants/my_url.dart';
import 'package:blooms/features/highlight/domain/highlight_state.dart';
import 'package:blooms/features/highlight/domain/highlight_type.dart';
import 'package:blooms/features/highlight/presentation/highlight_tile.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/theme/my_date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class OnboardingPageBody2 extends StatelessWidget {
  const OnboardingPageBody2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HighlightTile(
          type: HighlightType.past1day,
          state: HighlightState.success,
          description: myDateFormat(DateTime(2025, 1, 24)),
          onTap: () {},
          contentText: '今日は少し眠気を感じやすい時間帯があったみたいですね。鼻水も出ているようなので、ゆっくり休んでくださいね。',
        ),
        HighlightTile(
          type: HighlightType.past21days,
          state: HighlightState.success,
          description: i18n.highlight.xToY(
            x: myDateFormat(DateTime(2025, 1, 3)),
            y: myDateFormat(DateTime(2025, 1, 24)),
          ),
          onTap: () {},
          contentText:
              '最近、眠気を感じることが多いようですね。また、お腹の調子が優れない日もあったとのこと、体調管理にはお気を付けてくださいね。',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              const Gap(16),
              Text(
                'あなたの体調ハイライト',
                style: CupertinoTheme.of(context)
                    .textTheme
                    .navLargeTitleTextStyle
                    .copyWith(
                      fontSize: 24,
                    ),
                textAlign: TextAlign.center,
              ),
              const Gap(16),
              Text.rich(
                TextSpan(
                  style: CupertinoTheme.of(context).textTheme.textStyle,
                  children: [
                    const TextSpan(
                      text: '記録されたあなたの体調と客観的なデータ、そして',
                    ),
                    TextSpan(
                      text: 'グラウンディング',
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(
                            color:
                                CupertinoColors.activeBlue.resolveFrom(context),
                          ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          final result = await showModalActionSheet(
                            context: context,
                            style: AdaptiveStyle.iOS,
                            title: 'グラウンディングとは',
                            cancelLabel:
                                MaterialLocalizations.of(context).okButtonLabel,
                            message:
                                // TODO: slang
                                // ignore: lines_longer_than_80_chars
                                '分析に利用する生成モデルは常に正しい知識を持っているわけではありません。そこで、正しい知識の資料を与えることで、生成モデルがより信頼された結果を出力するようにコントロールする手法です。',
                            actions: [
                              const SheetAction(
                                key: 'more',
                                label: 'もっと詳しく',
                              ),
                            ],
                          );

                          if (result == 'more') {
                            await launchUrl(MyUrl.grounding);
                          }
                        },
                    ),
                    const TextSpan(
                      text: 'を組み合わせることで、あなたの体調の変化を理解しましょう。',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

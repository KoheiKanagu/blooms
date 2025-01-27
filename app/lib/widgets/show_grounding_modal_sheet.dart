import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:blooms/constants/my_url.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> showGroundingModalSheet(BuildContext context) async {
  final result = await showModalActionSheet(
    context: context,
    style: AdaptiveStyle.iOS,
    title: 'グラウンディングとは',
    cancelLabel: MaterialLocalizations.of(context).okButtonLabel,
    message:
        // TODO: slang
        // ignore: lines_longer_than_80_chars
        'ハイライトの作成に利用する生成モデルは常に正しい知識を持っているわけではありません。そこで、正しい知識の資料を与えることで、生成モデルがより信頼された結果を出力するようにコントロールする手法です。',
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
}

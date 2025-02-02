import 'package:budoux_dart/budoux.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

late final BudouX budouX;

Future<void> initBudouX() async {
  budouX = BudouX(
    await rootBundle.loadString('packages/budoux_dart/models/ja.json'),
  );
}

extension StringExtension on String {
  Widget wrapBudouX(
    Text Function(String e) wrapText, {
    WrapAlignment alignment = WrapAlignment.start,
  }) =>
      Wrap(
        alignment: alignment,
        children: budouX
            .parse(this)
            .map(
              (e) => wrapText(e),
            )
            .toList(),
      );

  Widget wrapBudouXText({
    TextStyle? style,
    TextAlign? textAlign,
    WrapAlignment alignment = WrapAlignment.start,
  }) =>
      wrapBudouX(
        (e) => Text(
          e,
          style: style,
          textAlign: textAlign,
        ),
        alignment: alignment,
      );
}

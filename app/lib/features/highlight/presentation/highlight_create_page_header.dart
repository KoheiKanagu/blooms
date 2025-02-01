import 'package:blooms/features/highlight/domain/highlight_style.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';

class HighlightCreatePageHeader extends StatelessWidget {
  const HighlightCreatePageHeader({
    required this.style,
    super.key,
  });

  final HighlightStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: switch (style) {
        HighlightStyle.private =>
          Text(i18n.highlight.createNewHighlight.privateDescription1),
      },
    );
  }
}

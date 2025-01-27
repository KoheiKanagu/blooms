import 'package:blooms/features/highlight/presentation/highlight_icon.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/theme/my_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class HighlightCreatePageHeader extends StatelessWidget {
  const HighlightCreatePageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DecoratedBox(
          decoration: MyDecoration.dropShadow(context).copyWith(
            color: CupertinoColors.secondarySystemGroupedBackground
                .resolveFrom(context),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const SizedBox.square(
            dimension: 96,
            child: HighlightIcon(),
          ),
        ),
        const Gap(16),
        Text(
          i18n.highlight.createNewHighlight,
          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
        ),
        const Text('TODO: some description'),
      ],
    );
  }
}

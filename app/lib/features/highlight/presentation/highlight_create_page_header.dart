import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HighlightCreatePageHeader extends StatelessWidget {
  const HighlightCreatePageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Icon(
              CupertinoIcons.star_fill,
              size: 96,
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
      ),
    );
  }
}

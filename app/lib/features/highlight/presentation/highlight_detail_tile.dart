import 'package:blooms/features/highlight/domain/highlight.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HighlightDetailTile extends HookConsumerWidget {
  const HighlightDetailTile({
    required this.highlight,
    super.key,
  });

  final Highlight highlight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoListSection.insetGrouped(
      children: const [
        CupertinoListTile(
          title: Text(
            'TODO',
          ),
        ),
      ],
    );
  }
}

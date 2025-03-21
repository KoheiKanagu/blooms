import 'package:blooms/features/highlight/domain/highlight.dart';
import 'package:blooms/features/highlight/presentation/highlight_detail_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HighlightDetailPage extends HookConsumerWidget {
  const HighlightDetailPage({required this.highlight, super.key});

  static const path = '/highlight_detail';

  final Highlight highlight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground.resolveFrom(
        context,
      ),
      navigationBar: CupertinoNavigationBar(
        middle: Text(highlight.highlightRangeString),
      ),
      child: ListView(
        children: [HighlightDetailTile(content: highlight.content)],
      ),
    );
  }
}

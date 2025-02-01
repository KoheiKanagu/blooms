import 'package:blooms/features/highlight/application/highlight_providers.dart';
import 'package:blooms/features/highlight/domain/highlight.dart';
import 'package:blooms/features/highlight/domain/highlight_content.dart';
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
    final promptFileUrl = switch (highlight.content) {
      HighlightContentSummary(:final promptFileUri) => promptFileUri,
      HighlightContentEmpty() => null,
    };

    return CupertinoListSection.insetGrouped(
      children: [
        CupertinoListTile(
          title: Text(
            highlight.content.toString(),
            maxLines: 100,
          ),
        ),
        ref
            .watch(
              highlightPromptProvider(
                gsFilePath: promptFileUrl,
              ),
            )
            .maybeWhen(
              orElse: () => const Text('error'),
              data: (data) => CupertinoListTile(
                title: Text(
                  data ?? 'null',
                  maxLines: 100,
                ),
              ),
            ),
      ],
    );
  }
}

import 'package:blooms/features/highlight/application/highlight_providers.dart';
import 'package:blooms/features/highlight/presentation/highlight_page_list.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HighlightPage extends HookConsumerWidget {
  const HighlightPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      backgroundColor:
          CupertinoColors.systemGroupedBackground.resolveFrom(context),
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          i18n.highlight.highlight,
        ),
      ),
      child: ref.watch(highlightQueryProvider).maybeWhen(
            orElse: () => const CircularProgressIndicator.adaptive(),
            data: (query) {
              return HighlightPageList(query: query);
            },
          ),
    );
  }
}

import 'package:blooms/features/highlight/application/highlight_providers.dart';
import 'package:blooms/features/highlight/domain/highlight.dart';
import 'package:blooms/features/highlight/presentation/highlight_detail_page.dart';
import 'package:blooms/features/highlight/presentation/highlight_page_list_tile.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
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
            data: (query) => FirestoreListView<Highlight>(
              query: query,
              itemBuilder: (context, snapshot) {
                final highlight = snapshot.data();
                final highlightPeriod = highlight.highlightPeriod;

                return HighlightPageListTile(
                  highlight: highlight,
                  highlightPeriod: highlightPeriod,
                  onPressed: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute<void>(
                        builder: (context) => HighlightDetailPage(
                          highlight: highlight,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
    );
  }
}

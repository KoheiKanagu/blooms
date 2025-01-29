import 'package:blooms/features/highlight/domain/highlight.dart';
import 'package:blooms/features/highlight/presentation/highlight_create_page.dart';
import 'package:blooms/features/highlight/presentation/highlight_icon.dart';
import 'package:blooms/features/highlight/presentation/highlight_page_list_tile.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/utils/my_logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HighlightPageList extends HookConsumerWidget {
  const HighlightPageList({
    required this.query,
    super.key,
  });

  final Query<Highlight> query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CupertinoListSection.insetGrouped(
              children: [
                CupertinoListTile.notched(
                  title: Text(i18n.highlight.createNewHighlight.title),
                  leading: const HighlightIcon(),
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      useRootNavigator: true,
                      isScrollControlled: true,
                      builder: (context) => const FractionallySizedBox(
                        heightFactor: 0.9,
                        child: HighlightCreatePage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          FirestoreQueryBuilder(
            query: query,
            builder: (context, snapshot, _) {
              if (snapshot.hasError) {
                logger.error(snapshot.error);
              }

              if (snapshot.isFetching) {
                return const SliverToBoxAdapter(
                  child: CupertinoActivityIndicator(),
                );
              }

              final itemCount = snapshot.docs.length;
              return SliverList.builder(
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  final isLastItem = index + 1 == itemCount;
                  if (isLastItem && snapshot.hasMore) {
                    snapshot.fetchMore();
                  }

                  final snap = snapshot.docs[index];
                  final highlight = snap.data();

                  return HighlightPageListTile(
                    documentId: snap.id,
                    highlight: highlight,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

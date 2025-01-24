import 'package:blooms/features/highlight/domain/highlight.dart';
import 'package:blooms/features/highlight/presentation/highlight_create_page.dart';
import 'package:blooms/features/highlight/presentation/highlight_page_list_tile.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/routing/application/my_go_router.dart';
import 'package:blooms/utils/my_logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/cupertino.dart';
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
                  title: Text(i18n.highlight.createNewHighlight),
                  leading: const Icon(CupertinoIcons.star_fill),
                  trailing: const Icon(CupertinoIcons.forward),
                  onTap: () {
                    Navigator.of(rootContext!).push(
                      CupertinoPageRoute<void>(
                        builder: (context) => const HighlightCreatePage(),
                        fullscreenDialog: true,
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
              if (snapshot.isFetching) {
                if (snapshot.hasError) {
                  logger.error(snapshot.error);
                }

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

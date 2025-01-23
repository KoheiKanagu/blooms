import 'package:blooms/features/highlight/application/highlight_providers.dart';
import 'package:blooms/features/highlight/presentation/highlight_create_page.dart';
import 'package:blooms/features/highlight/presentation/highlight_detail_page.dart';
import 'package:blooms/features/highlight/presentation/highlight_page_list_tile.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/routing/application/my_go_router.dart';
import 'package:blooms/utils/my_logger.dart';
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
            data: (query) {
              final sliverList = FirestoreQueryBuilder(
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

                  return SliverList.builder(
                    itemBuilder: (context, index) {
                      final highlight = snapshot.docs[index].data();
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
                    itemCount: snapshot.docs.length,
                  );
                },
              );

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
                                  builder: (context) =>
                                      const HighlightCreatePage(),
                                  fullscreenDialog: true,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    sliverList,
                  ],
                ),
              );
            },
          ),
    );
  }
}

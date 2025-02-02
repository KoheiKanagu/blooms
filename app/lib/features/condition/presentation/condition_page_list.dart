import 'package:blooms/features/condition/domain/condition.dart';
import 'package:blooms/features/condition/presentation/condition_bubble.dart';
import 'package:blooms/features/condition/presentation/condition_form.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/utils/my_logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrollview_observer/scrollview_observer.dart';

class ConditionPageList extends HookConsumerWidget {
  const ConditionPageList(
    this.query, {
    required this.onItemDisplayed,
    super.key,
  });

  final Query<Condition> query;

  final ValueChanged<Condition> onItemDisplayed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewInsets = MediaQuery.of(context).viewInsets;
    print(viewInsets);

    final onFocus = useState(false);

    return CupertinoPageScaffold(
      backgroundColor:
          CupertinoColors.systemGroupedBackground.resolveFrom(context),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SafeArea(
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                viewInsets: const EdgeInsets.only(
                  bottom: 64,
                ),
              ),
              child: _ListView(
                query: query,
                onItemDisplayed: onItemDisplayed,
              ),
            ),
          ),
          SafeArea(
            top: false,
            bottom: !onFocus.value,
            child: FocusScope(
              onFocusChange: (value) {
                onFocus.value = value;
              },
              child: const ConditionForm(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListView extends HookConsumerWidget {
  const _ListView({
    required this.query,
    required this.onItemDisplayed,
  });

  final Query<Condition> query;

  final ValueChanged<Condition> onItemDisplayed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FirestoreQueryBuilder(
      query: query,
      builder: (context, snapshot, _) {
        if (snapshot.hasError) {
          logger.error(snapshot.error);
          return const _ErrorWidget();
        }

        if (snapshot.isFetching) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }

        final itemCount = snapshot.docs.length;
        return ListViewObserver(
          onObserve: (result) {
            final index = result.firstChild?.index;
            if (index != null) {
              onItemDisplayed(snapshot.docs[index].data());
            }
          },
          child: ListView.separated(
            reverse: true,
            itemCount: itemCount,
            itemBuilder: (context, index) {
              final isLastItem = index + 1 == itemCount;
              if (isLastItem && snapshot.hasMore) {
                snapshot.fetchMore();
              }

              final snap = snapshot.docs[index];
              final condition = snap.data();

              final createdAt = condition.createdAt?.toDate();
              if (createdAt == null) {
                return const SizedBox.shrink();
              }

              // 一つ前のindexのsnapshotのcreatedAtと比較して1時間以上経過していたら
              // 日時を表示する
              final existPreview = index + 1 < itemCount;
              final previewCreatedAt = existPreview
                  ? snapshot.docs[index + 1].data().createdAt?.toDate()
                  : null;
              final showDateTime = previewCreatedAt == null ||
                  createdAt.difference(previewCreatedAt).inHours >= 1;

              return ConditionBubble(
                documentId: snap.id,
                createdAt: createdAt,
                content: condition.content,
                showDateTime: showDateTime,
                creatorType: condition.creatorType,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 16,
            ),
            //TODO
            // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          ),
        );
      },
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(i18n.anUnexpectedErrorOccurred),
          Text(i18n.pleaseRestartTheAppLater),
        ],
      ),
    );
  }
}

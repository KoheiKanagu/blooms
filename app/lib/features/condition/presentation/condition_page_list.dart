import 'package:blooms/features/condition/application/condition_providers.dart';
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
    const conditionFormKey = GlobalObjectKey('conditionFormKey');
    final conditionFormHeight = ref.watch(
      conditionFormHeightControllerProvider,
    );

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref
            .read(conditionFormHeightControllerProvider.notifier)
            .calculateHeight(conditionFormKey);
      });
      return null;
    }, [context]);

    return SafeArea(
      child: CupertinoPageScaffold(
        backgroundColor: CupertinoColors.systemGroupedBackground.resolveFrom(
          context,
        ),
        child: NotificationListener<SizeChangedLayoutNotification>(
          onNotification: (notification) {
            // ConditionFormで改行されて高さが変わったときに起きる
            Future(() {
              ref
                  .read(conditionFormHeightControllerProvider.notifier)
                  .calculateHeight(conditionFormKey);
            });
            return true;
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _ListView(
                query: query,
                onItemDisplayed: onItemDisplayed,
                padding: EdgeInsets.only(top: 24, bottom: conditionFormHeight),
              ),
              const SizeChangedLayoutNotifier(
                child: ConditionForm(key: conditionFormKey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ListView extends HookConsumerWidget {
  const _ListView({
    required this.query,
    required this.onItemDisplayed,
    required this.padding,
  });

  final Query<Condition> query;

  final ValueChanged<Condition> onItemDisplayed;

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FirestoreQueryBuilder(
      query: query,
      builder: (context, snapshot, _) {
        if (snapshot.hasError) {
          logger.handle(Exception(snapshot.error));
          return const _ErrorWidget();
        }

        if (snapshot.isFetching) {
          return const Center(child: CupertinoActivityIndicator());
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
            padding: padding,
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
              final previewCreatedAt =
                  existPreview
                      ? snapshot.docs[index + 1].data().createdAt?.toDate()
                      : null;
              final showDateTime =
                  previewCreatedAt == null ||
                  createdAt.difference(previewCreatedAt).inHours >= 1;

              return ConditionBubble(
                documentId: snap.id,
                createdAt: createdAt,
                content: condition.content,
                showDateTime: showDateTime,
                creatorType: condition.creatorType,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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

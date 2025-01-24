import 'package:blooms/features/authentication/application/auth_providers.dart';
import 'package:blooms/features/condition/application/condition_providers.dart';
import 'package:blooms/features/condition/domain/condition.dart';
import 'package:blooms/features/condition/presentation/condition_bubble.dart';
import 'package:blooms/features/condition/presentation/condition_form.dart';
import 'package:blooms/features/user/application/user_providers.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/theme/my_decoration.dart';
import 'package:blooms/utils/my_logger.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_down_button/pull_down_button.dart';

class ConditionPage extends HookConsumerWidget {
  const ConditionPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      backgroundColor:
          CupertinoColors.systemGroupedBackground.resolveFrom(context),
      navigationBar: CupertinoNavigationBar(
        middle: const Text('今日の体調'),
        trailing: PullDownButton(
          itemBuilder: (context) => [
            PullDownMenuItem(
              onTap: () {
                ref.read(authSignOutProvider.future);
              },
              title: 'Sign out',
            ),
            PullDownMenuItem(
              onTap: () {
                ref.read(userDeleteProvider.future);
              },
              title: 'User delete',
            ),
          ],
          buttonBuilder: (context, showMenu) => CupertinoButton(
            onPressed: showMenu,
            padding: EdgeInsets.zero,
            child: const Icon(CupertinoIcons.ellipsis_circle),
          ),
        ),
      ),
      child: ref.watch(conditionQueryProvider).maybeWhen(
            orElse: () => const CircularProgressIndicator.adaptive(),
            data: (query) => SafeArea(
              bottom: MediaQuery.of(context).viewInsets.bottom < 50,
              child: Scaffold(
                body: FirestoreListView<Condition>.separated(
                  query: query,
                  reverse: true,
                  padding: const EdgeInsets.only(
                    // FloatingActionButton分のpadding
                    bottom: 96,
                  ),
                  errorBuilder: (context, error, stackTrace) {
                    logger.error(error, stackTrace);

                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(i18n.anUnexpectedErrorOccurred),
                          Text(i18n.pleaseRestartTheAppLater),
                        ],
                      ),
                    );
                  },
                  itemBuilder: (context, snapshot) {
                    final condition = snapshot.data();

                    final createdAt = condition.createdAt?.toDate();
                    final record = condition.record;
                    if (createdAt == null || record == null) {
                      return const SizedBox.shrink();
                    }

                    return ConditionBubble(
                      documentId: snapshot.id,
                      createdAt: createdAt,
                      record: record,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 16);
                  },
                ),
                floatingActionButton: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration: MyDecoration.dropShadow(context),
                  child: const ConditionForm(),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
              ),
            ),
          ),
    );
  }
}

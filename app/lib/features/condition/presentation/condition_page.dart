import 'package:blooms/features/authentication/application/auth_providers.dart';
import 'package:blooms/features/condition/application/condition_providers.dart';
import 'package:blooms/features/condition/domain/condition.dart';
import 'package:blooms/features/condition/presentation/condition_form.dart';
import 'package:blooms/features/user/application/user_providers.dart';
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
    return Scaffold(
      floatingActionButton: Container(
        padding: EdgeInsets.only(
          left: 8,
          right: 8,
          // キーボードが表示されていたら0
          bottom: MediaQuery.of(context).viewInsets.bottom > 0 ? 0 : 50,
        ),
        child: const ConditionForm(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: CupertinoPageScaffold(
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
              data: (query) => FirestoreListView<Condition>(
                query: query,
                itemBuilder: (context, snapshot) {
                  final condition = snapshot.data();

                  return CupertinoListTile(
                    title: Text(condition.record ?? ''),
                    subtitle: Text(
                      condition.createdAt?.toDate().toIso8601String() ?? '',
                    ),
                  );
                },
              ),
            ),
      ),
    );
  }
}

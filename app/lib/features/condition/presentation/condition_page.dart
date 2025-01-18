import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:blooms/features/authentication/application/auth_providers.dart';
import 'package:blooms/features/condition/application/condition_providers.dart';
import 'package:blooms/features/condition/domain/condition.dart';
import 'package:blooms/features/user/application/user_providers.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConditionPage extends HookConsumerWidget {
  const ConditionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () async {
                await ref.read(authSignOutProvider.future);
              },
              child: const Text('sign out'),
            ),
            ElevatedButton(
              onPressed: () async {
                await ref.read(userDeleteProvider.future);
              },
              child: const Text('user delete'),
            ),
          ],
        ),
      ),
      body: ref.watch(conditionQueryProvider).maybeWhen(
            orElse: () => const CircularProgressIndicator.adaptive(),
            data: (query) => FirestoreListView<Condition>(
              query: query,
              itemBuilder: (context, snapshot) {
                final condition = snapshot.data();

                return ListTile(
                  title: Text(condition.record ?? ''),
                  subtitle: Text(
                    condition.createdAt?.toDate().toIso8601String() ?? '',
                  ),
                );
              },
            ),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showTextInputDialog(
            context: context,
            textFields: [
              const DialogTextField(),
            ],
            title: '今の体調はどうですか？',
            okLabel: '記録',
          );

          final record = result?.firstOrNull?.trim();
          if (record != null && record.isNotEmpty) {
            await ref.read(
              conditionCreateSubjectiveProvider(record: record).future,
            );
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

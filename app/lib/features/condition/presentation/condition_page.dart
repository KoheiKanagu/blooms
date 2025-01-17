import 'package:blooms/features/authentication/application/auth_providers.dart';
import 'package:blooms/features/user/application/user_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConditionPage extends HookConsumerWidget {
  const ConditionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
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
    );
  }
}

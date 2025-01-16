import 'package:blooms/features/authentication/application/firebase_user_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConditionPage extends HookConsumerWidget {
  const ConditionPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await ref.read(firebaseUserSignOutProvider.future);
          },
          child: const Text('sign out'),
        ),
      ),
    );
  }
}

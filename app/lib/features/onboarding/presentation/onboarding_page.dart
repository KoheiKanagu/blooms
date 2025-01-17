import 'package:blooms/features/authentication/application/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnboardingPage extends HookConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                await ref.read(authSignInProvider.future);
              },
              child: const Text('sign in'),
            ),
            ElevatedButton(
              onPressed: () async {
                await ref.read(authSignOutProvider.future);
              },
              child: const Text('sign out'),
            ),
          ],
        ),
      ),
    );
  }
}

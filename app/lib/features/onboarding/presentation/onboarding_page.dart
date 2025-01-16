import 'package:blooms/features/authentication/application/firebase_user_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnboardingPage extends HookConsumerWidget {
  const OnboardingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await ref.read(firebaseUserSignInProvider.future);
          },
          child: const Text('sign in'),
        ),
      ),
    );
  }
}

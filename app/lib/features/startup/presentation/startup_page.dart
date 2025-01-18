import 'package:blooms/features/startup/application/app_startup.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/utils/my_logger.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppStartupWidget extends HookConsumerWidget {
  const AppStartupWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(appStartupProvider).maybeWhen(
          orElse: () => const AppStartupLoadingWidget(),
          error: (error, trace) {
            logger.error(error, trace);

            return AppStartupErrorWidget(
              // Discard and try to initialize again
              onRetry: () => ref.invalidate(appStartupProvider),
            );
          },
        );
  }
}

class AppStartupLoadingWidget extends StatelessWidget {
  const AppStartupLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: CircularProgressIndicator.adaptive(
          backgroundColor: Theme.of(context).colorScheme.onError,
        ),
      ),
    );
  }
}

class AppStartupErrorWidget extends StatelessWidget {
  const AppStartupErrorWidget({required this.onRetry, super.key});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              i18n.an_unexpected_error_occurred,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onError,
                  ),
            ),
            const Gap(16),
            TextButton(
              onPressed: onRetry,
              child: Text(
                i18n.retry,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onError,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

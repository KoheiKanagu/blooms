import 'package:blooms/features/startup/application/app_startup.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/utils/my_logger.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppStartupWidget extends HookConsumerWidget {
  const AppStartupWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(appStartupProvider).when(
          data: (_) => const SizedBox.shrink(),
          error: (error, trace) {
            logger.error(error, trace);

            return AppStartupErrorWidget(
              // Discard and try to initialize again
              onRetry: () => ref.invalidate(appStartupProvider),
            );
          },
          loading: () => const AppStartupLoadingWidget(),
        );
  }
}

class AppStartupLoadingWidget extends StatelessWidget {
  const AppStartupLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}

class AppStartupErrorWidget extends StatelessWidget {
  const AppStartupErrorWidget({
    required this.onRetry,
    super.key,
  });

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              i18n.an_unexpected_error_occurred,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Gap(16),
            ElevatedButton(
              onPressed: onRetry,
              child: Text(i18n.retry),
            ),
          ],
        ),
      ),
    );
  }
}

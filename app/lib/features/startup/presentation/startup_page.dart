import 'package:blooms/features/startup/application/app_startup.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/utils/my_logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

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
    return CupertinoPageScaffold(
      backgroundColor: CupertinoTheme.of(context).primaryColor,
      child: const Center(
        child: CupertinoActivityIndicator(
          color: CupertinoColors.white,
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
    return CupertinoPageScaffold(
      backgroundColor: CupertinoTheme.of(context).primaryColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              i18n.anUnexpectedErrorOccurred,
              style: CupertinoTheme.of(context)
                  .textTheme
                  .navTitleTextStyle
                  .copyWith(
                    color: CupertinoColors.white,
                  ),
            ),
            const Gap(16),
            CupertinoButton(
              onPressed: onRetry,
              color: CupertinoColors.white,
              child: Text(i18n.retry),
            ),
          ],
        ),
      ),
    );
  }
}

@widgetbook.UseCase(
  name: 'AppStartupLoadingWidget',
  type: AppStartupLoadingWidget,
)
Widget startupPage(BuildContext context) {
  return const AppStartupLoadingWidget();
}

@widgetbook.UseCase(
  name: 'AppStartupErrorWidget',
  type: AppStartupErrorWidget,
)
Widget startupPageError(BuildContext context) {
  return AppStartupErrorWidget(
    onRetry: () {},
  );
}

import 'package:blooms/features/highlight/application/highlight_providers.dart';
import 'package:blooms/features/highlight/presentation/highlight_page_list.dart';
import 'package:blooms/features/reminder/presentation/reminder_page.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_down_button/pull_down_button.dart';

class HighlightPage extends HookConsumerWidget {
  const HighlightPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground.resolveFrom(
        context,
      ),
      navigationBar: CupertinoNavigationBar(
        middle: Text(i18n.highlight.highlight),
        trailing: PullDownButton(
          itemBuilder: (context) {
            return [
              PullDownMenuItem(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder:
                        (context) =>
                            const ReminderPage(type: ReminderType.highlight),
                    routeSettings: const RouteSettings(name: ReminderPage.path),
                    useRootNavigator: true,
                  );
                },
                title: i18n.reminder.reminder,
                icon: CupertinoIcons.bell_fill,
                iconColor: CupertinoColors.systemOrange.resolveFrom(context),
              ),
            ];
          },
          buttonBuilder:
              (context, showMenu) => CupertinoButton(
                onPressed: showMenu,
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.ellipsis_circle),
              ),
        ),
      ),
      child: ref
          .watch(highlightQueryProvider)
          .maybeWhen(
            orElse: () => const CupertinoActivityIndicator(),
            data: (query) => HighlightPageList(query: query),
          ),
    );
  }
}

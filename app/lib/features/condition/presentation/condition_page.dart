import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:blooms/features/condition/application/condition_providers.dart';
import 'package:blooms/features/condition/presentation/condition_page_list.dart';
import 'package:blooms/features/user/application/user_providers.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/routing/application/my_go_router.dart';
import 'package:blooms/theme/my_date_format.dart';
import 'package:blooms/widgets/show_my_progress_indicator.dart';
import 'package:clock/clock.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_down_button/pull_down_button.dart';

class ConditionPage extends HookConsumerWidget {
  const ConditionPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = useState(i18n.today);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title.value),
        trailing: PullDownButton(
          itemBuilder: (context) {
            return [
              PullDownMenuItem(
                onTap: () async {
                  final result = await showConfirmationDialog(
                    context: context,
                    title: i18n.deleteAll.title,
                    message: i18n.deleteAll.message,
                    routeSettings: const RouteSettings(
                      name: 'deleteAllConfirmationDialog',
                    ),
                    actions: [
                      AlertDialogAction(
                        key: 'delete',
                        label: i18n.deleteAll.delete,
                        isDestructiveAction: true,
                      ),
                    ],
                    style: AdaptiveStyle.iOS,
                  );
                  if (result == 'delete') {
                    if (context.mounted) {
                      final indicator = showMyProgressIndicator(context);
                      await ref.read(userDeleteProvider.future);
                      indicator.dismiss();

                      if (context.mounted) {
                        await showOkAlertDialog(
                          context: rootContext!,
                          routeSettings: const RouteSettings(
                            name: 'deleteAllThankYouDialog',
                          ),
                          title: i18n.thankYouForUsing,
                          style: AdaptiveStyle.iOS,
                        );
                      }
                    }
                  }
                },
                title: 'Delete',
              ),
            ];
          },
          buttonBuilder: (context, showMenu) => CupertinoButton(
            onPressed: showMenu,
            padding: EdgeInsets.zero,
            child: const Icon(CupertinoIcons.ellipsis_circle),
          ),
        ),
      ),
      child: ref.watch(conditionQueryProvider).maybeWhen(
            orElse: () => const CircularProgressIndicator.adaptive(),
            data: (query) => ConditionPageList(
              query,
              onItemDisplayed: (value) {
                final createdAt = value.createdAt?.toDate();
                if (createdAt != null) {
                  if (DateUtils.isSameDay(clock.now(), createdAt)) {
                    title.value = i18n.today;
                  } else {
                    title.value = myDateFormat(createdAt);
                  }
                }
              },
            ),
          ),
    );
  }
}

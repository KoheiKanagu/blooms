import 'package:blooms/features/about/presentation/about_page.dart';
import 'package:blooms/features/condition/application/condition_providers.dart';
import 'package:blooms/features/condition/presentation/condition_page_list.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/theme/my_date_format.dart';
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
                onTap: () {
                  showCupertinoModalPopup<void>(
                    context: context,
                    builder: (context) => const AboutPage(),
                    routeSettings: const RouteSettings(
                      name: AboutPage.path,
                    ),
                  );
                },
                title: i18n.aboutBLOOMS.aboutBLOOMS,
                icon: CupertinoIcons.info,
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

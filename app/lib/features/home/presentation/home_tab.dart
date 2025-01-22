import 'package:blooms/features/condition/presentation/condition_page.dart';
import 'package:blooms/features/report/presentation/report_page.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeTab extends HookConsumerWidget {
  const HomeTab({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoTabScaffold(
      resizeToAvoidBottomInset: false,
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              CupertinoIcons.heart_fill,
            ),
            label: i18n.condition,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              CupertinoIcons.doc_text_fill,
            ),
            label: i18n.report.report,
          ),
        ],
      ),
      tabBuilder: (context, index) => switch (index) {
        0 => CupertinoTabView(
            builder: (context) => const ConditionPage(),
          ),
        1 => CupertinoTabView(
            builder: (context) => const ReportPage(),
          ),
        _ => throw UnimplementedError()
      },
    );
  }
}

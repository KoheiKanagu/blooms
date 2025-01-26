import 'package:blooms/features/condition/presentation/condition_page.dart';
import 'package:blooms/features/highlight/presentation/highlight_page.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/utils/firebase/firebase_analytics.dart';
import 'package:blooms/utils/firebase/firebase_providers.dart';
import 'package:blooms/utils/my_navigator_observer.dart';
import 'package:firebase_analytics/observer.dart';
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
        iconSize: 28,
        items: [
          BottomNavigationBarItem(
            icon: _wrapIcon(
              CupertinoIcons.heart_fill,
            ),
            label: i18n.condition,
          ),
          BottomNavigationBarItem(
            icon: _wrapIcon(
              CupertinoIcons.square_favorites_alt_fill,
            ),
            label: i18n.highlight.highlight,
          ),
        ],
      ),
      tabBuilder: (context, index) {
        final navigatorObservers = [
          MyNavigatorObserver(ref.watch(firebaseCrashlyticsProvider)),
          FirebaseAnalyticsObserver(
            analytics: ref.watch(firebaseAnalyticsProvider),
          ),
        ];

        return switch (index) {
          0 => CupertinoTabView(
              builder: (context) => const ConditionPage(),
              navigatorObservers: navigatorObservers,
            ),
          1 => CupertinoTabView(
              builder: (context) => const HighlightPage(),
              navigatorObservers: navigatorObservers,
            ),
          _ => throw UnimplementedError()
        };
      },
    );
  }

  Widget _wrapIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 4,
      ),
      child: Icon(icon),
    );
  }
}

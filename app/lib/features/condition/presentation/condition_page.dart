import 'package:blooms/features/condition/application/condition_providers.dart';
import 'package:blooms/features/condition/presentation/condition_page_list.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/theme/my_date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConditionPage extends HookConsumerWidget {
  const ConditionPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = useState(i18n.condition);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title.value),
      ),
      child: ref.watch(conditionQueryProvider).maybeWhen(
            orElse: () => const CircularProgressIndicator.adaptive(),
            data: (query) => ConditionPageList(
              query,
              onItemDisplayed: (value) {
                final createdAt = value.createdAt?.toDate();
                if (createdAt != null) {
                  title.value = myDateFormat(createdAt);
                }
              },
            ),
          ),
    );
  }
}

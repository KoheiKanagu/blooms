import 'package:blooms/features/condition/application/condition_providers.dart';
import 'package:blooms/features/condition/presentation/condition_page_list.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConditionPage extends HookConsumerWidget {
  const ConditionPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      backgroundColor:
          CupertinoColors.systemGroupedBackground.resolveFrom(context),
      navigationBar: CupertinoNavigationBar(
        middle: Text(i18n.condition),
      ),
      child: ref.watch(conditionQueryProvider).maybeWhen(
            orElse: () => const CircularProgressIndicator.adaptive(),
            data: ConditionPageList.new,
          ),
    );
  }
}

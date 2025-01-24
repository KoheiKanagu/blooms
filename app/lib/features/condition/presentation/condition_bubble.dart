import 'package:blooms/features/condition/application/condition_providers.dart';
import 'package:blooms/theme/my_decoration.dart';
import 'package:blooms/theme/my_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:super_context_menu/super_context_menu.dart';

class ConditionBubble extends HookConsumerWidget {
  const ConditionBubble({
    required this.documentId,
    required this.createdAt,
    required this.record,
    super.key,
  });

  final String documentId;

  final DateTime createdAt;

  final String record;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 64,
        right: 16,
      ),
      child: ContextMenuWidget(
        menuProvider: (_) => Menu(
          children: [
            MenuAction(
              callback: () {
                ref.read(
                  conditionDeleteProvider(documentId: documentId).future,
                );
              },
              title: MaterialLocalizations.of(context).deleteButtonTooltip,
              image: MenuImage.icon(CupertinoIcons.delete),
              attributes: const MenuActionAttributes(
                destructive: true,
              ),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: myColorPink2,
            borderRadius: BorderRadius.circular(10),
            boxShadow: MyDecoration.dropShadow(context).boxShadow,
          ),
          child: Text(
            record,
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}

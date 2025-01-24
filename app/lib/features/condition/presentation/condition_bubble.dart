import 'package:blooms/features/condition/application/condition_providers.dart';
import 'package:blooms/theme/my_decoration.dart';
import 'package:blooms/theme/my_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:super_context_menu/super_context_menu.dart';

class ConditionBubble extends HookConsumerWidget {
  ConditionBubble({
    required this.documentId,
    required this.createdAt,
    required this.record,
    required this.showDateTime,
    super.key,
  }) {
    final date = DateFormat.MMMEd().format(createdAt);
    final time = DateFormat.Hm().format(createdAt);
    createdAtString = '$date $time';
  }

  final String documentId;

  final DateTime createdAt;

  late final String createdAtString;

  final String record;

  final bool showDateTime;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Visibility(
          visible: showDateTime,
          child: Text(
            createdAtString,
            textAlign: TextAlign.center,
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  color: CupertinoColors.secondaryLabel,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Padding(
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
            previewBuilder: (context, child) => Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 8,
                children: [
                  Text(
                    createdAtString,
                    textAlign: TextAlign.center,
                    style:
                        CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                              color: CupertinoColors.label,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                  ),
                  child,
                ],
              ),
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
        ),
      ],
    );
  }
}

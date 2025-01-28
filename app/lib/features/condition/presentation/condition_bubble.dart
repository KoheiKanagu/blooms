import 'package:blooms/features/condition/application/condition_providers.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/theme/my_date_format.dart';
import 'package:blooms/theme/my_decoration.dart';
import 'package:clock/clock.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:super_context_menu/super_context_menu.dart';

class ConditionBubble extends HookConsumerWidget {
  ConditionBubble({
    required this.documentId,
    required this.createdAt,
    required this.record,
    required this.showDateTime,
    super.key,
  }) {
    final isToday = DateUtils.isSameDay(clock.now(), createdAt);
    if (isToday) {
      createdAtString = i18n.today;
    } else if (DateUtils.isSameDay(
      clock.now().subtract(const Duration(days: 1)),
      createdAt,
    )) {
      createdAtString = i18n.yesterday;
    } else {
      createdAtString = myDateTimeFormat(createdAt);
    }
  }

  final String documentId;

  final DateTime createdAt;

  late final String createdAtString;

  final String record;

  final bool showDateTime;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Visibility(
          visible: showDateTime,
          child: Text(
            createdAtString,
            textAlign: TextAlign.center,
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  color: CupertinoColors.secondaryLabel.resolveFrom(context),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 64,
              right: 16,
            ),
            child: ContextMenuWidget(
              menuProvider: (_) => Menu(
                children: [
                  MenuAction(
                    callback: () async {
                      await Future.wait([
                        ref.read(
                          conditionDeleteProvider(documentId: documentId)
                              .future,
                        ),
                        HapticFeedback.heavyImpact(),
                      ]);
                    },
                    title:
                        MaterialLocalizations.of(context).deleteButtonTooltip,
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
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(
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
                  horizontal: 16,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: CupertinoColors.secondarySystemGroupedBackground
                      .resolveFrom(context),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: MyDecoration.dropShadow(context).boxShadow,
                ),
                child: Text(
                  record,
                  style: CupertinoTheme.of(context).textTheme.textStyle,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

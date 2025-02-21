import 'package:blooms/features/condition/application/condition_providers.dart';
import 'package:blooms/features/condition/domain/condition_content.dart';
import 'package:blooms/features/condition/domain/condition_creator_type.dart';
import 'package:blooms/features/condition/presentation/condition_bubble_audio.dart';
import 'package:blooms/features/condition/presentation/condition_bubble_empty.dart';
import 'package:blooms/features/condition/presentation/condition_bubble_image.dart';
import 'package:blooms/features/condition/presentation/condition_bubble_text.dart';
import 'package:blooms/features/condition/presentation/condition_bubble_text_with_search_keywords.dart';
import 'package:blooms/features/disclaimer/presentation/disclaimer_label.dart';
import 'package:blooms/theme/my_date_format.dart';
import 'package:blooms/theme/my_decoration.dart';
import 'package:blooms/theme/my_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:super_context_menu/super_context_menu.dart';

class ConditionBubble extends HookConsumerWidget {
  ConditionBubble({
    required this.documentId,
    required this.createdAt,
    required this.content,
    required this.showDateTime,
    required this.creatorType,
    super.key,
  }) {
    createdAtString = myDateTimeFormat(createdAt);
  }

  final String documentId;

  final DateTime createdAt;

  late final String createdAtString;

  final ConditionContent content;

  final bool showDateTime;

  final ConditionCreatorType creatorType;

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
            padding: switch (creatorType) {
              ConditionCreatorType.user => const EdgeInsets.only(
                left: 64,
                right: 16,
              ),
              ConditionCreatorType.model => const EdgeInsets.only(
                left: 16,
                right: 64,
              ),
            },
            child: ContextMenuWidget(
              menuProvider:
                  (_) => Menu(
                    children: [
                      MenuAction(
                        callback: () async {
                          await Future.wait([
                            ref.read(
                              conditionDeleteProvider(
                                documentId: documentId,
                              ).future,
                            ),
                            HapticFeedback.heavyImpact(),
                          ]);
                        },
                        title:
                            MaterialLocalizations.of(
                              context,
                            ).deleteButtonTooltip,
                        image: MenuImage.icon(CupertinoIcons.delete),
                        attributes: const MenuActionAttributes(
                          destructive: true,
                        ),
                      ),
                    ],
                  ),
              previewBuilder:
                  (context, child) => ColoredBox(
                    color: CupertinoColors.systemGroupedBackground.resolveFrom(
                      context,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 8,
                        children: [
                          Text(
                            createdAtString,
                            textAlign: TextAlign.center,
                            style: CupertinoTheme.of(
                              context,
                            ).textTheme.textStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child,
                        ],
                      ),
                    ),
                  ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: switch (creatorType) {
                    ConditionCreatorType.user => CupertinoColors
                        .secondarySystemGroupedBackground
                        .resolveFrom(context),
                    ConditionCreatorType.model => myColorGreen2
                        .resolveFrom(context)
                        .withOpacity(0.1),
                  },
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: switch (creatorType) {
                    ConditionCreatorType.user =>
                      MyDecoration.dropShadow(context).boxShadow,
                    ConditionCreatorType.model => [],
                  },
                ),
                child: Column(
                  children: [
                    switch (content) {
                      ConditionContentText() => ConditionBubbleText(
                        content as ConditionContentText,
                        creatorType: creatorType,
                      ),
                      ConditionContentTextWithSearchKeywords() =>
                        ConditionBubbleTextWithSearchKeywords(
                          content as ConditionContentTextWithSearchKeywords,
                          creatorType: creatorType,
                        ),
                      ConditionContentImage() => ConditionBubbleImage(
                        content as ConditionContentImage,
                        creatorType: creatorType,
                      ),
                      ConditionContentAudio() => ConditionBubbleAudio(
                        content as ConditionContentAudio,
                        creatorType: creatorType,
                      ),
                      ConditionContentEmpty() => ConditionBubbleEmpty(
                        content as ConditionContentEmpty,
                      ),
                    },
                    switch (creatorType) {
                      ConditionCreatorType.user => const SizedBox.shrink(),
                      ConditionCreatorType.model => const DisclaimerLabel(),
                    },
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

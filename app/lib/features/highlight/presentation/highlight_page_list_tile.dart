import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:blooms/features/highlight/application/highlight_providers.dart';
import 'package:blooms/features/highlight/domain/highlight.dart';
import 'package:blooms/features/highlight/domain/highlight_content.dart';
import 'package:blooms/features/highlight/domain/highlight_state.dart';
import 'package:blooms/features/highlight/domain/highlight_type.dart';
import 'package:blooms/features/highlight/presentation/highlight_detail_page.dart';
import 'package:blooms/features/highlight/presentation/highlight_tile.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:super_context_menu/super_context_menu.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class HighlightPageListTile extends HookConsumerWidget {
  const HighlightPageListTile({
    required this.documentId,
    required this.highlight,
    super.key,
  });

  final String documentId;

  final Highlight highlight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ContextMenuWidget(
      menuProvider: (_) => Menu(
        children: [
          MenuAction(
            callback: () async {
              await Future.wait([
                ref.read(
                  highlightDeleteProvider(documentId: documentId).future,
                ),
                HapticFeedback.heavyImpact(),
              ]);
            },
            title: MaterialLocalizations.of(context).deleteButtonTooltip,
            image: MenuImage.icon(CupertinoIcons.delete),
            attributes: const MenuActionAttributes(
              destructive: true,
            ),
          ),
        ],
      ),
      child: HighlightTile(
        type: highlight.type,
        state: highlight.state,
        description: highlight.type == HighlightType.past1day
            ? highlight.highlightPeriod.endDate
            : i18n.highlight.xToY(
                x: highlight.highlightPeriod.startDate,
                y: highlight.highlightPeriod.endDate,
              ),
        contentText: switch (highlight.content) {
          HighlightContentPrivate(:final abstract) => abstract,
          HighlightContentProfessional(:final abstract) => abstract,
          HighlightContentEmpty() => i18n.unknownContent,
          _ => null,
        },
        onTap: () async {
          switch (highlight.state) {
            case HighlightState.pending:
              await showOkAlertDialog(
                context: context,
                title: i18n.highlight.state.pending,
                message: i18n.highlight.state.pendingDescription,
                style: AdaptiveStyle.iOS,
              );
            case HighlightState.inProgress:
              await showOkAlertDialog(
                context: context,
                title: i18n.highlight.state.inProgress,
                message: i18n.highlight.state.inProgressDescription,
                style: AdaptiveStyle.iOS,
              );
            case HighlightState.success:
              await Navigator.of(context).push(
                CupertinoPageRoute<void>(
                  builder: (context) => HighlightDetailPage(
                    highlight: highlight,
                  ),
                  settings: const RouteSettings(
                    name: HighlightDetailPage.path,
                  ),
                ),
              );
            case HighlightState.failure:
              final result = await showConfirmationDialog(
                context: context,
                title: i18n.highlight.state.failure,
                style: AdaptiveStyle.iOS,
                actions: [
                  AlertDialogAction(
                    key: 'delete',
                    label: i18n.highlight.deleteHighlight,
                    isDestructiveAction: true,
                    isDefaultAction: true,
                  ),
                ],
              );
              if (result == 'delete') {
                await ref.read(
                  highlightDeleteProvider(documentId: documentId).future,
                );
              }
          }
        },
      ),
    );
  }
}

@widgetbook.UseCase(
  name: 'pending',
  type: HighlightPageListTile,
)
Widget highlightPageListTile(BuildContext context) {
  return CupertinoPageScaffold(
    child: ListView(
      children: HighlightType.values
          .map(
            (type) => HighlightPageListTile(
              documentId: 'documentId',
              highlight: Highlight(
                type: type,
                subjectUid: 'subjectUid',
                startAt: Timestamp.now(),
              ),
            ),
          )
          .toList(),
    ),
  );
}

@widgetbook.UseCase(
  name: 'inProgress',
  type: HighlightPageListTile,
)
Widget highlightPageListTileInProgress(BuildContext context) {
  return CupertinoPageScaffold(
    child: ListView(
      children: HighlightType.values
          .map(
            (type) => HighlightPageListTile(
              documentId: 'documentId',
              highlight: Highlight(
                type: type,
                subjectUid: 'subjectUid',
                startAt: Timestamp.now(),
                state: HighlightState.inProgress,
              ),
            ),
          )
          .toList(),
    ),
  );
}

@widgetbook.UseCase(
  name: 'success',
  type: HighlightPageListTile,
)
Widget highlightPageListTileSuccess(BuildContext context) {
  return CupertinoPageScaffold(
    child: ListView(
      children: HighlightType.values
          .map(
            (type) => HighlightPageListTile(
              documentId: 'documentId',
              highlight: Highlight(
                type: type,
                subjectUid: 'subjectUid',
                startAt: Timestamp.now(),
                state: HighlightState.success,
                content: const HighlightContent.private(
                  subjectiveTrend: 'subjectiveTrend',
                  objectiveTrend: 'objectiveTrend',
                  analysisResult: 'analysisResult',
                  advice: 'advice',
                  abstract: 'abstract',
                ),
              ),
            ),
          )
          .toList(),
    ),
  );
}

@widgetbook.UseCase(
  name: 'failure',
  type: HighlightPageListTile,
)
Widget highlightPageListTileFailure(BuildContext context) {
  return CupertinoPageScaffold(
    child: ListView(
      children: HighlightType.values
          .map(
            (type) => HighlightPageListTile(
              documentId: 'documentId',
              highlight: Highlight(
                type: type,
                subjectUid: 'subjectUid',
                startAt: Timestamp.now(),
                state: HighlightState.failure,
              ),
            ),
          )
          .toList(),
    ),
  );
}

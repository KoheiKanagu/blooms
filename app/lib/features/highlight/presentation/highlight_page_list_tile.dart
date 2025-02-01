import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:blooms/features/highlight/application/highlight_providers.dart';
import 'package:blooms/features/highlight/domain/highlight.dart';
import 'package:blooms/features/highlight/domain/highlight_content.dart';
import 'package:blooms/features/highlight/domain/highlight_period.dart';
import 'package:blooms/features/highlight/domain/highlight_state.dart';
import 'package:blooms/features/highlight/domain/highlight_style.dart';
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
        period: highlight.period ?? HighlightPeriod.past1day,
        state: highlight.state,
        description: highlight.period == HighlightPeriod.past1day
            ? highlight.highlightRange.endDate
            : i18n.highlight.xToY(
                x: highlight.highlightRange.startDate,
                y: highlight.highlightRange.endDate,
              ),
        contentText: switch (highlight.content) {
          HighlightContentSummary(:final abstract) => abstract,
          HighlightContentEmpty() => i18n.unknownContent,
        },
        onTap: () async {
          switch (highlight.state ?? HighlightState.failure) {
            case HighlightState.pending:
              await showOkAlertDialog(
                context: context,
                title: i18n.highlight.state.pending,
                message: i18n.highlight.state.pendingDescription,
                style: AdaptiveStyle.iOS,
                routeSettings: const RouteSettings(
                  name: 'highlightPending',
                ),
              );
            case HighlightState.inProgress:
              await showOkAlertDialog(
                context: context,
                title: i18n.highlight.state.inProgress,
                message: i18n.highlight.state.inProgressDescription,
                style: AdaptiveStyle.iOS,
                routeSettings: const RouteSettings(
                  name: 'highlightInProgress',
                ),
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
                routeSettings: const RouteSettings(
                  name: 'highlightFailure',
                ),
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
      children: HighlightPeriod.values
          .map(
            (period) => HighlightPageListTile(
              documentId: 'documentId',
              highlight: Highlight.create(
                period: period,
                style: HighlightStyle.private,
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
      children: HighlightPeriod.values
          .map(
            (period) => HighlightPageListTile(
              documentId: 'documentId',
              highlight: Highlight(
                subjectUid: 'subjectUid',
                content: HighlightContent.summary(
                  startAt: Timestamp.now(),
                  period: period,
                  state: HighlightState.inProgress,
                  summary: 'summary',
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
  name: 'success',
  type: HighlightPageListTile,
)
Widget highlightPageListTileSuccess(BuildContext context) {
  return CupertinoPageScaffold(
    child: ListView(
      children: HighlightPeriod.values
          .map(
            (period) => HighlightPageListTile(
              documentId: 'documentId',
              highlight: Highlight(
                subjectUid: 'subjectUid',
                content: HighlightContent.summary(
                  period: period,
                  startAt: Timestamp.now(),
                  state: HighlightState.success,
                  summary: 'summary',
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
      children: HighlightPeriod.values
          .map(
            (type) => HighlightPageListTile(
              documentId: 'documentId',
              highlight: Highlight(
                subjectUid: 'subjectUid',
                content: HighlightContent.summary(
                  period: type,
                  startAt: Timestamp.now(),
                  state: HighlightState.failure,
                  summary: 'summary',
                  abstract: 'abstract',
                ),
              ),
            ),
          )
          .toList(),
    ),
  );
}

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:blooms/features/highlight/application/highlight_providers.dart';
import 'package:blooms/features/highlight/domain/highlight.dart';
import 'package:blooms/features/highlight/domain/highlight_content.dart';
import 'package:blooms/features/highlight/domain/highlight_state.dart';
import 'package:blooms/features/highlight/domain/highlight_type.dart';
import 'package:blooms/features/highlight/presentation/highlight_detail_page.dart';
import 'package:blooms/features/highlight/presentation/highlight_page_list_tile_title.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
    return GestureDetector(
      onTap: () async {
        final state = highlight.state;

        switch (state) {
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
      child: CupertinoListSection.insetGrouped(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 4,
        ),
        additionalDividerMargin: 0,
        dividerMargin: 0,
        children: [
          CupertinoListTile.notched(
            backgroundColor:
                CupertinoColors.systemBackground.resolveFrom(context),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HighlightPageListTileTitle(
                  state: highlight.state,
                  type: highlight.type,
                ),
                const Gap(8),
                Text(
                  highlight.type == HighlightType.past1day
                      ? highlight.highlightPeriod.endDate
                      : i18n.highlight.xToY(
                          x: highlight.highlightPeriod.startDate,
                          y: highlight.highlightPeriod.endDate,
                        ),
                  style:
                      CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                ),
              ],
            ),
          ),
          if (highlight.state == HighlightState.success)
            CupertinoListTile.notched(
              title: Column(
                children: [
                  Text(
                    highlight.content?.abstract ?? '',
                    maxLines: 10,
                  ),
                  const Gap(8),
                ],
              ),
            ),
        ],
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
                content: const HighlightContent(
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

import 'package:blooms/features/highlight/domain/highlight_period.dart';
import 'package:blooms/features/highlight/domain/highlight_state.dart';
import 'package:blooms/features/highlight/presentation/highlight_type_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class HighlightTile extends StatelessWidget {
  const HighlightTile({
    required this.period,
    required this.description,
    required this.onTap,
    required this.contentText,
    this.state,
    this.selected,
    super.key,
  }) : assert(
          selected != null || state != null,
          'selectedかstateのどちらか一方を指定してください',
        );

  final HighlightPeriod period;

  final HighlightState? state;

  final String description;

  /// チェックマークの有無
  /// nullの場合はチェックマークを表示しない
  final bool? selected;

  final String contentText;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CupertinoListSection.insetGrouped(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        additionalDividerMargin: 0,
        dividerMargin: 0,
        decoration: BoxDecoration(
          border: selected != null && selected!
              ? Border.all(
                  color: CupertinoTheme.of(context).primaryColor,
                  width: 2,
                )
              : null,
          borderRadius: BorderRadius.circular(10),
          color: CupertinoColors.secondarySystemGroupedBackground
              .resolveFrom(context),
        ),
        children: [
          _Title(
            period: period,
            state: state,
            description: description,
            selected: selected,
          ),
          if (contentText.isNotEmpty)
            _Content(
              text: contentText,
            ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    required this.period,
    required this.state,
    required this.description,
    required this.selected,
  });

  final HighlightPeriod period;

  final HighlightState? state;

  final String description;

  final bool? selected;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (selected == null)
            _Label(
              period: period,
              state: state!,
            )
          else
            _LabelCheckMark(
              period: period,
              selected: selected!,
            ),
          const Gap(8),
          _Description(
            text: description,
          ),
        ],
      ),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label({
    required this.period,
    required this.state,
  });

  final HighlightPeriod period;

  final HighlightState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HighlightTypeLabel(period),
        const Spacer(),
        switch (state) {
          HighlightState.pending => Icon(
              CupertinoIcons.time,
              color: CupertinoColors.systemGrey2.resolveFrom(context),
            ),
          HighlightState.inProgress => const CupertinoActivityIndicator(),
          HighlightState.success => const CupertinoListTileChevron(),
          HighlightState.failure => Icon(
              CupertinoIcons.xmark_circle,
              color: CupertinoColors.systemRed.resolveFrom(context),
            ),
        },
      ],
    );
  }
}

class _LabelCheckMark extends StatelessWidget {
  const _LabelCheckMark({
    required this.period,
    required this.selected,
  });

  final HighlightPeriod period;

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HighlightTypeLabel(period),
        const Spacer(),
        Icon(
          selected
              ? CupertinoIcons.check_mark_circled_solid
              : CupertinoIcons.circle,
        ),
      ],
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
      maxLines: 10,
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      title: Text(
        text,
        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontSize: 14,
            ),
        maxLines: 100,
      ),
    );
  }
}

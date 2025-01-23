import 'package:blooms/features/highlight/domain/highlight_state.dart';
import 'package:blooms/features/highlight/domain/highlight_type.dart';
import 'package:blooms/features/highlight/presentation/highlight_type_label.dart';
import 'package:flutter/cupertino.dart';

class HighlightPageListTileTitle extends StatelessWidget {
  const HighlightPageListTileTitle({
    required this.type,
    required this.state,
    super.key,
  });

  final HighlightType type;

  final HighlightState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HighlightTypeLabel(type),
        const Spacer(),
        switch (state) {
          HighlightState.pending => Icon(
              CupertinoIcons.time,
              color: CupertinoColors.systemGrey2.resolveFrom(context),
            ),
          HighlightState.inProgress => const CupertinoActivityIndicator(),
          HighlightState.success => Icon(
              CupertinoIcons.forward,
              color: CupertinoColors.systemGrey2.resolveFrom(context),
            ),
          HighlightState.failure => Icon(
              CupertinoIcons.xmark_circle,
              color: CupertinoColors.systemRed.resolveFrom(context),
            ),
        },
      ],
    );
  }
}

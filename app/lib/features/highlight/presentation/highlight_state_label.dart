import 'package:blooms/features/highlight/domain/highlight_state.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';

class HighlightStateLabel extends StatelessWidget {
  const HighlightStateLabel(
    this.state, {
    super.key,
  });

  final HighlightState state;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: state != HighlightState.success,
      child: IgnorePointer(
        child: CupertinoButton.tinted(
          sizeStyle: CupertinoButtonSize.small,
          color: switch (state) {
            HighlightState.pending =>
              CupertinoColors.systemGrey.resolveFrom(context),
            HighlightState.inProgress =>
              CupertinoColors.systemGrey.resolveFrom(context),
            HighlightState.success => null,
            HighlightState.failure =>
              CupertinoColors.systemRed.resolveFrom(context),
          },
          child: switch (state) {
            HighlightState.pending => Text(i18n.highlight.state.pending),
            HighlightState.inProgress => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(i18n.highlight.state.inProgress),
                  const CupertinoActivityIndicator(),
                ],
              ),
            HighlightState.success => const SizedBox.shrink(),
            HighlightState.failure => Text(i18n.highlight.state.failure),
          },
          onPressed: () {},
        ),
      ),
    );
  }
}

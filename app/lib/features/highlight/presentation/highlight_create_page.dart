import 'package:blooms/features/highlight/application/highlight_providers.dart';
import 'package:blooms/features/highlight/domain/highlight_period.dart';
import 'package:blooms/features/highlight/presentation/highlight_create_page_tile.dart';
import 'package:blooms/features/highlight/presentation/highlight_style_features_list.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class HighlightCreatePage extends HookConsumerWidget {
  const HighlightCreatePage({
    super.key,
  });

  static const path = '/highlight_create';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPeriod = useState(HighlightPeriod.past7days);

    return Scaffold(
      body: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          middle: Text(
            i18n.highlight.createNewHighlight.title,
          ),
        ),
        backgroundColor:
            CupertinoColors.systemGroupedBackground.resolveFrom(context),
        child: ListView(
          children: [
            const Gap(16),
            const HighlightStyleFeaturesList(),
            const Gap(24),
            _CreateTiles(
              selectedPeriod: selectedPeriod.value,
              onTap: (value) {
                selectedPeriod.value = value;
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: _BottomNavigationBar(
        period: selectedPeriod.value,
      ),
    );
  }
}

class _CreateTiles extends StatelessWidget {
  const _CreateTiles({
    required this.selectedPeriod,
    required this.onTap,
  });

  final HighlightPeriod selectedPeriod;

  final ValueChanged<HighlightPeriod> onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: HighlightPeriod.values
          .map(
            (e) => HighlightCreatePageTile(
              period: e,
              selected: selectedPeriod == e,
              onTap: () {
                onTap(e);
              },
            ),
          )
          .toList(),
    );
  }
}

class _BottomNavigationBar extends HookConsumerWidget {
  const _BottomNavigationBar({
    required this.period,
  });

  final HighlightPeriod period;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: CupertinoButton.filled(
          onPressed: () async {
            await ref.read(
              highlightCreateProvider(
                period: period,
              ).future,
            );

            if (context.mounted) {
              Navigator.of(context).pop();
            }
          },
          child: Text(
            i18n.highlight.createHighlight,
          ),
        ),
      ),
    );
  }
}

@widgetbook.UseCase(
  name: 'HighlightCreatePage',
  type: HighlightCreatePage,
)
Widget highlightCreatePage(BuildContext context) {
  return const CupertinoPageScaffold(
    child: HighlightCreatePage(),
  );
}

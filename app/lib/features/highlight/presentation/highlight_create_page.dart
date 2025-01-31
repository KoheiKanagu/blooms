import 'package:blooms/features/highlight/application/highlight_providers.dart';
import 'package:blooms/features/highlight/domain/highlight_period.dart';
import 'package:blooms/features/highlight/domain/highlight_style.dart';
import 'package:blooms/features/highlight/presentation/highlight_create_page_header.dart';
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
    final selectedType = useState({
      HighlightStyle.private: HighlightPeriod.past7days,
      HighlightStyle.professional: HighlightPeriod.past28days,
    });

    final selectedStyle = useState<HighlightStyle>(
      HighlightStyle.private,
    );

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
            HighlightCreatePageHeader(
              style: selectedStyle.value,
            ),
            const Gap(16),
            HighlightStyleFeaturesList(
              style: selectedStyle.value,
            ),
            const Gap(24),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: CupertinoSlidingSegmentedControl(
                children: {
                  HighlightStyle.private: Text(
                    HighlightStyle.private.localizedName,
                  ),
                  HighlightStyle.professional: Text(
                    HighlightStyle.professional.localizedName,
                  ),
                },
                groupValue: selectedStyle.value,
                onValueChanged: (value) {
                  selectedStyle.value = value ?? HighlightStyle.private;
                },
              ),
            ),
            const Gap(8),
            _CreateTiles(
              selectedType: selectedType.value[selectedStyle.value]!,
              selectedStyle: selectedStyle.value,
              onTap: (value) {
                selectedType.value = {
                  ...selectedType.value,
                  selectedStyle.value: value,
                };
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: _BottomNavigationBar(
        period: selectedType.value[selectedStyle.value]!,
        style: selectedStyle.value,
      ),
    );
  }
}

class _CreateTiles extends StatelessWidget {
  const _CreateTiles({
    required this.selectedType,
    required this.selectedStyle,
    required this.onTap,
  });

  final HighlightStyle selectedStyle;

  final HighlightPeriod selectedType;

  final ValueChanged<HighlightPeriod> onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: switch (selectedStyle) {
        HighlightStyle.private => HighlightPeriod.values
            .map(
              (e) => HighlightCreatePageTile(
                period: e,
                selected: selectedType == e,
                onTap: () {
                  onTap(e);
                },
              ),
            )
            .toList(),
        HighlightStyle.professional => [
            HighlightCreatePageTile(
              period: HighlightPeriod.past28days,
              selected: true,
              onTap: () {},
            ),
          ]
      },
    );
  }
}

class _BottomNavigationBar extends HookConsumerWidget {
  const _BottomNavigationBar({
    required this.period,
    required this.style,
  });

  final HighlightPeriod period;

  final HighlightStyle style;

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
                style: style,
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

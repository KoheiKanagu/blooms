import 'package:blooms/features/highlight/application/highlight_providers.dart';
import 'package:blooms/features/highlight/domain/highlight_type.dart';
import 'package:blooms/features/highlight/presentation/highlight_create_page_header.dart';
import 'package:blooms/features/highlight/presentation/highlight_create_page_tile.dart';
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
    final selectedType = useState<HighlightType>(
      HighlightType.past7days,
    );

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: Scaffold(
        body: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            trailing: CupertinoButton.tinted(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.of(context).pop();
              },
              sizeStyle: CupertinoButtonSize.medium,
              borderRadius: BorderRadius.circular(24),
              child: const Icon(CupertinoIcons.xmark),
            ),
            automaticallyImplyLeading: false,
          ),
          backgroundColor:
              CupertinoColors.systemGroupedBackground.resolveFrom(context),
          child: SafeArea(
            child: ListView(
              children: [
                const HighlightCreatePageHeader(),
                const Gap(24),
                ...HighlightType.values.map(
                  (e) => HighlightCreatePageTile(
                    type: e,
                    selected: selectedType.value == e,
                    onTap: () {
                      selectedType.value = e;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: CupertinoButton.filled(
              onPressed: () async {
                final type = selectedType.value;
                await ref.read(highlightCreateProvider(type).future);

                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
              child: Text(
                i18n.highlight.createHighlight,
              ),
            ),
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

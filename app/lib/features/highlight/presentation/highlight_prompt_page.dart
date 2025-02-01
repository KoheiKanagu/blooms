import 'package:blooms/features/highlight/application/highlight_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HighlightPromptPage extends HookConsumerWidget {
  const HighlightPromptPage({
    required this.promptFileUri,
    super.key,
  });

  static const path = '/highlight_prompt';

  final String? promptFileUri;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: ListView(
        children: [
          ref
              .watch(highlightPromptProvider(gsFilePath: promptFileUri))
              .maybeWhen(
                orElse: CupertinoActivityIndicator.new,
                data: (data) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                  ),
                  child: Text(
                    data ?? '',
                    maxLines: 1000,
                  ),
                ),
              ),
        ],
      ),
    );
  }
}

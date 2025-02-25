import 'dart:ui';

import 'package:blooms/features/condition/application/condition_providers.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/utils/my_logger.dart';
import 'package:blooms/widgets/show_my_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class ConditionForm extends HookConsumerWidget {
  const ConditionForm({super.key, this.initialValue});

  final String? initialValue;

  static const maxLines = 8;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController(text: initialValue);

    final hideSendButton = useState(true);
    useEffect(() {
      textController.addListener(() {
        final text = textController.text;
        hideSendButton.value = text.isEmpty;
      });
      return null;
    }, [textController]);

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Gap(16),
              const _PlusButton(),
              const Gap(16),
              Expanded(
                child: CupertinoTextField(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  controller: textController,
                  maxLength: 256,
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemBackground.resolveFrom(
                      context,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: CupertinoColors.systemGrey4.resolveFrom(context),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  suffix: Visibility(
                    // 文字がない場合は非表示
                    visible: !hideSendButton.value,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: _SendButton(textController: textController),
                    ),
                  ),
                  maxLines: maxLines,
                  minLines: 1,
                  keyboardType: TextInputType.multiline,
                  placeholder: i18n.howIsYourConditionNow,
                  contextMenuBuilder: (context, editableTextState) {
                    if (SystemContextMenu.isSupported(context)) {
                      return SystemContextMenu.editableText(
                        editableTextState: editableTextState,
                      );
                    }

                    return AdaptiveTextSelectionToolbar.editableText(
                      editableTextState: editableTextState,
                    );
                  },
                ),
              ),
              const Gap(16),
            ],
          ),
        ),
      ),
    );
  }
}

class _SendButton extends HookConsumerWidget {
  const _SendButton({required this.textController});

  final TextEditingController textController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: CupertinoButton.filled(
        sizeStyle: CupertinoButtonSize.small,
        padding: const EdgeInsets.all(4),
        onPressed: () async {
          final text = textController.text;
          if (text.isEmpty) {
            return;
          }

          await ref.read(conditionCreateTextProvider(text: text).future);

          textController.clear();
        },
        child: Icon(
          CupertinoIcons.arrow_up,
          // 太さが変えられないようなのでshadowで太く見せる
          shadows: List.generate(
            10,
            (_) =>
                const BoxShadow(color: CupertinoColors.white, blurRadius: 1.5),
          ),
        ),
      ),
    );
  }
}

class _PlusButton extends HookConsumerWidget {
  const _PlusButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PullDownButton(
      itemBuilder:
          (context) => [
            PullDownMenuItem(
              title: i18n.camera,
              icon: CupertinoIcons.camera,
              onTap: () async {
                final xFile = await ImagePicker().pickImage(
                  source: ImageSource.camera,
                  maxHeight: 1024,
                  maxWidth: 1024,
                  imageQuality: 50,
                  requestFullMetadata: false,
                );
                if (xFile == null) {
                  return;
                }

                if (context.mounted) {
                  final indicator = showMyProgressIndicator(context);

                  try {
                    await ref.read(
                      conditionCreateImageProvider(
                        xFiles: [xFile].toList(),
                      ).future,
                    );
                  } on Exception catch (error, stack) {
                    // TODO: エラーダイアログ
                    logger.handle(error, stack);
                  } finally {
                    indicator.dismiss();
                  }
                }
              },
            ),
            PullDownMenuItem(
              title: i18n.photoLibrary,
              icon: CupertinoIcons.photo_fill,
              onTap: () async {
                final xFiles = await ImagePicker().pickMultiImage(
                  maxHeight: 1024,
                  maxWidth: 1024,
                  imageQuality: 50,
                  limit: 4,
                  requestFullMetadata: false,
                );
                if (xFiles.isEmpty) {
                  return;
                }

                if (context.mounted) {
                  final indicator = showMyProgressIndicator(context);

                  try {
                    await ref.read(
                      conditionCreateImageProvider(xFiles: xFiles).future,
                    );
                  } on Exception catch (error, stack) {
                    // TODO: エラーダイアログ
                    logger.handle(error, stack);
                  } finally {
                    indicator.dismiss();
                  }
                }
              },
            ),
          ],
      buttonBuilder:
          (context, showMenu) => ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: CupertinoButton.tinted(
              sizeStyle: CupertinoButtonSize.medium,
              onPressed: showMenu,
              padding: EdgeInsets.zero,
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(CupertinoIcons.add),
              ),
            ),
          ),
    );
  }
}

@widgetbook.UseCase(name: 'ConditionForm', type: ConditionForm)
Widget conditionForm(BuildContext context) {
  return const CupertinoPageScaffold(
    child: Column(
      spacing: 16,
      children: [
        ConditionForm(),
        ConditionForm(initialValue: 'あいうえおかきくけこ'),
        ConditionForm(initialValue: 'あ\nい\nう\nえ\nお\nか\nき\nく\nけ\nこ\n'),
        ConditionForm(initialValue: 'abcdefghijklmnopqrstuvwxyz'),
        ConditionForm(
          initialValue: '''
    This is a long text example to test how the ConditionForm handles long strings of text.
    The text should wrap properly and be displayed correctly within the text field.
    This is important for ensuring that the user experience is smooth and that the text input behaves as expected, even with longer inputs.''',
        ),
      ],
    ),
  );
}

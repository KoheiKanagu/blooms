import 'package:blooms/features/condition/application/condition_providers.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/widgets/show_my_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_down_button/pull_down_button.dart';

class ConditionForm extends HookConsumerWidget {
  const ConditionForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();

    final hideSendButton = useState(false);
    useEffect(
      () {
        textController.addListener(() {
          hideSendButton.value = textController.text.isEmpty;
        });
        return null;
      },
      [
        textController,
      ],
    );

    return Row(
      children: [
        const _PlusButton(),
        const Gap(8),
        Expanded(
          child: CupertinoTextField(
            controller: textController,
            maxLength: 256,
            decoration: BoxDecoration(
              color: CupertinoColors.systemBackground.resolveFrom(context),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: CupertinoColors.systemGrey4.resolveFrom(context),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
          ),
        ),
        const Gap(8),
        CupertinoButton.tinted(
          sizeStyle: CupertinoButtonSize.medium,
          child: const Icon(
            CupertinoIcons.arrow_up_circle_fill,
          ),
          onPressed: () async {
            final text = textController.text;
            if (text.isEmpty) {
              return;
            }

            await ref.read(
              conditionCreateTextProvider(
                text: text,
              ).future,
            );

            textController.clear();
          },
        ),
      ],
    );
  }
}

class _PlusButton extends HookConsumerWidget {
  const _PlusButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PullDownButton(
      itemBuilder: (context) => [
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

            await ref.read(
              conditionCreateImageProvider(
                xFiles: [
                  xFile,
                ].toList(),
              ).future,
            );
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
              await ref.read(
                conditionCreateImageProvider(xFiles: xFiles).future,
              );
              indicator.dismiss();
            }
          },
        ),
      ],
      buttonBuilder: (context, showMenu) => CupertinoButton(
        onPressed: showMenu,
        padding: EdgeInsets.zero,
        child: const Icon(CupertinoIcons.add_circled),
      ),
    );
  }
}

import 'package:blooms/features/condition/application/condition_providers.dart';
import 'package:blooms/theme/my_decoration.dart';
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

    return DecoratedBox(
      decoration: MyDecoration.dropShadow(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(8),
          color: CupertinoColors.tertiarySystemBackground.resolveFrom(context),
          child: Row(
            children: [
              PullDownButton(
                itemBuilder: (context) {
                  return [
                    PullDownMenuItem(
                      title: 'カメラ',
                      icon: CupertinoIcons.camera,
                      onTap: () async {
                        final xFile = await ImagePicker().pickImage(
                          source: ImageSource.camera,
                          maxHeight: 1024,
                          maxWidth: 1024,
                          imageQuality: 50,
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
                      title: '写真',
                      icon: CupertinoIcons.photo_fill,
                      onTap: () async {
                        final xFiles = await ImagePicker().pickMultiImage(
                          maxHeight: 1024,
                          maxWidth: 1024,
                          imageQuality: 50,
                          limit: 4,
                        );
                        if (xFiles.isEmpty) {
                          return;
                        }

                        await ref.read(
                          conditionCreateImageProvider(xFiles: xFiles).future,
                        );
                      },
                    ),
                  ];
                },
                buttonBuilder: (context, showMenu) => CupertinoButton(
                  onPressed: showMenu,
                  sizeStyle: CupertinoButtonSize.medium,
                  padding: EdgeInsets.zero,
                  child: const Icon(CupertinoIcons.add_circled_solid),
                ),
              ),
              const Gap(8),
              Expanded(
                child: CupertinoTextField(
                  controller: textController,
                  maxLength: 256,
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
          ),
        ),
      ),
    );
  }
}

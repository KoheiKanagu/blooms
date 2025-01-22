import 'package:blooms/features/condition/application/condition_providers.dart';
import 'package:blooms/theme/my_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
                  final record = textController.text;
                  if (record.isEmpty) {
                    return;
                  }

                  await ref.read(
                    conditionCreateSubjectiveProvider(
                      record: record,
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

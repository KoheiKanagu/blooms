import 'package:blooms/features/reminder/application/reminder_providers.dart';
import 'package:blooms/features/reminder/presentation/reminder_page.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:cupertino_calendar_picker/cupertino_calendar_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReminderPageBody extends HookConsumerWidget {
  const ReminderPageBody({
    required this.type,
    required this.onTimeChanged,
    required this.switchValue,
    required this.onSwitchChanged,
    super.key,
  });

  final ReminderType type;

  final ValueChanged<TimeOfDay> onTimeChanged;

  final bool switchValue;
  final ValueChanged<bool> onSwitchChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        CupertinoListSection.insetGrouped(
          footer: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Text(
              switch (type) {
                ReminderType.condition => i18n.reminder.setConditionReminder,
                ReminderType.highlight => i18n.reminder.setHighlightReminder,
              },
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                color: CupertinoColors.secondaryLabel.resolveFrom(context),
                fontSize: 12,
              ),
            ),
          ),
          children: [
            CupertinoListTile.notched(
              title: FittedBox(
                child: ref
                    .watch(reminderTimeProvider(type))
                    .maybeWhen(
                      orElse: CupertinoActivityIndicator.new,
                      data:
                          (time) => Row(
                            children: [
                              Visibility(
                                visible: type == ReminderType.highlight,
                                child: Row(
                                  children: [
                                    Text(i18n.reminder.saturday),
                                    const Gap(8),
                                  ],
                                ),
                              ),
                              CupertinoTimePickerButton(
                                initialTime: time,
                                onTimeChanged: onTimeChanged,
                              ),
                            ],
                          ),
                    ),
              ),
              trailing: CupertinoSwitch(
                value: switchValue,
                onChanged: onSwitchChanged,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

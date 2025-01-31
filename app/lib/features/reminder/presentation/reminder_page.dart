import 'package:blooms/features/reminder/application/reminder_providers.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:cupertino_calendar_picker/cupertino_calendar_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReminderPage extends HookConsumerWidget {
  const ReminderPage({
    super.key,
  });

  static const path = '/reminder';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reminderSwitch = useState(false);
    final selectedTime = useState<TimeOfDay>(kReminderDefaultTime);

    ref
      ..listen(reminderStatusProvider, (_, next) {
        reminderSwitch.value = next.value ?? false;
      })
      ..listen(reminderTimeProvider, (_, next) {
        selectedTime.value = next.value ?? kReminderDefaultTime;
      });

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        print('hoge');
      },
      child: CupertinoPageScaffold(
        backgroundColor:
            CupertinoColors.systemGroupedBackground.resolveFrom(context),
        navigationBar: CupertinoNavigationBar(
          middle: Text(i18n.reminder.reminder),
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Text(
              MaterialLocalizations.of(context).cancelButtonLabel,
              style: CupertinoTheme.of(context).textTheme.navActionTextStyle,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Text(
              i18n.done,
              style: CupertinoTheme.of(context).textTheme.navActionTextStyle,
            ),
            onPressed: () async {
              if (reminderSwitch.value) {
                // オン
                final dateTime = selectedTime.value;
                await ref.read(
                  reminderEnableProvider(time: dateTime).future,
                );
              } else {
                // オフ
                await ref.read(
                  reminderDisableProvider.future,
                );
              }

              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
          ),
        ),
        child: ListView(
          children: [
            CupertinoListSection.insetGrouped(
              footer: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                ),
                child: Text(
                  i18n.reminder.setReminder,
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .textStyle
                      .copyWith(
                        color:
                            CupertinoColors.secondaryLabel.resolveFrom(context),
                        fontSize: 12,
                      ),
                ),
              ),
              children: [
                CupertinoListTile.notched(
                  title: FittedBox(
                    child: ref.watch(reminderTimeProvider).maybeWhen(
                          orElse: CupertinoActivityIndicator.new,
                          data: (time) => CupertinoTimePickerButton(
                            initialTime: time,
                            onTimeChanged: (value) {
                              selectedTime.value = value;
                            },
                          ),
                        ),
                  ),
                  trailing: CupertinoSwitch(
                    value: reminderSwitch.value,
                    onChanged: (value) {
                      reminderSwitch.value = value;
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

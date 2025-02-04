import 'package:blooms/features/reminder/application/reminder_providers.dart';
import 'package:blooms/features/reminder/presentation/reminder_page_body.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/widgets/my_cupertino_page_scaffold_with_large_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

enum ReminderType {
  condition,
  highlight,
  ;
}

class ReminderPage extends HookConsumerWidget {
  const ReminderPage({
    required this.type,
    super.key,
  });

  static const path = '/reminder';

  final ReminderType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reminderSwitch = useState(false);
    final selectedTime = useState<TimeOfDay>(kReminderDefaultTime);

    ref
      ..listen(reminderStatusProvider(type), (_, next) {
        reminderSwitch.value = next.value ?? false;
      })
      ..listen(reminderTimeProvider(type), (_, next) {
        selectedTime.value = next.value ?? kReminderDefaultTime;
      });

    return MyCupertinoPageScaffoldWithLargeNavigationBar(
      backgroundColor:
          CupertinoColors.systemGroupedBackground.resolveFrom(context),
      navigationBar: CupertinoNavigationBar(
        middle: Text(i18n.reminder.reminder),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Text(
            MaterialLocalizations.of(context).cancelButtonLabel,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Text(i18n.done),
          onPressed: () async {
            ref.read(
              reminderSaveProvider(
                type: type,
                time: selectedTime.value,
                enable: reminderSwitch.value,
              ),
            );

            if (context.mounted) {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      child: Stack(
        children: [
          ReminderPageBody(
            type: type,
            onTimeChanged: (value) {
              selectedTime.value = value;
            },
            switchValue: reminderSwitch.value,
            onSwitchChanged: (value) {
              reminderSwitch.value = value;
            },
          ),
          // Webはローカル通知に未対応なのでカバーする
          Visibility(
            visible: kIsWeb,
            child: Positioned.fill(
              child: Container(
                alignment: Alignment.center,
                color: CupertinoColors.systemGrey
                    .resolveFrom(context)
                    .withOpacity(0.5),
                child: Text(i18n.appOnlyFeature),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

@widgetbook.UseCase(
  name: 'condition',
  type: ReminderPage,
)
Widget reminderPageCondition(BuildContext context) {
  return const CupertinoPageScaffold(
    child: ReminderPage(
      type: ReminderType.condition,
    ),
  );
}

@widgetbook.UseCase(
  name: 'highlight',
  type: ReminderPage,
)
Widget reminderPageHighlight(BuildContext context) {
  return const CupertinoPageScaffold(
    child: ReminderPage(
      type: ReminderType.highlight,
    ),
  );
}

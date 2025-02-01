import 'package:blooms/features/reminder/presentation/reminder_page.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/utils/configure/shared_preferences_providers.dart';
import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timezone/timezone.dart' as tz;

part 'reminder_providers.g.dart';

const _reminderConditionHourKey = 'reminder_hour';
const _reminderConditionMinuteKey = 'reminder_minute';
const _reminderConditionNotificationId = 0;
const _reminderConditionEnableKey = 'reminder_enable';

const _reminderHighlightHourKey = 'reminder_highlight_hour';
const _reminderHighlightMinuteKey = 'reminder_highlight_minute';
const _reminderHighlightNotificationId = 1;
const _reminderHighlightEnableKey = 'reminder_highlight_enable';

const kReminderDefaultTime = TimeOfDay(hour: 20, minute: 0);

@Riverpod(
  keepAlive: true,
)
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin(Ref ref) =>
    FlutterLocalNotificationsPlugin();

@riverpod
Future<void> flutterLocalNotificationPluginInitialize(Ref ref) =>
    ref.read(flutterLocalNotificationsPluginProvider).initialize(
          const InitializationSettings(
            iOS: DarwinInitializationSettings(),
          ),
        );

/// 通知の時間を取得
@riverpod
Future<TimeOfDay> reminderTime(
  Ref ref,
  ReminderType type,
) async {
  final results = switch (type) {
    ReminderType.condition => await Future.wait([
        ref.read(sharedPreferencesProvider).getInt(_reminderConditionHourKey),
        ref.read(sharedPreferencesProvider).getInt(_reminderConditionMinuteKey),
      ]),
    ReminderType.highlight => await Future.wait([
        ref.read(sharedPreferencesProvider).getInt(_reminderHighlightHourKey),
        ref.read(sharedPreferencesProvider).getInt(_reminderHighlightMinuteKey),
      ]),
  };

  final hour = results[0];
  final minute = results[1];

  return TimeOfDay(
    hour: hour ?? 20,
    minute: minute ?? 0,
  );
}

/// 通知の有効状態を取得
@riverpod
Future<bool> reminderStatus(
  Ref ref,
  ReminderType type,
) {
  return switch (type) {
    ReminderType.condition => ref
        .read(sharedPreferencesProvider)
        .getBool(_reminderConditionEnableKey)
        .then((e) => e ?? false),
    ReminderType.highlight => ref
        .read(sharedPreferencesProvider)
        .getBool(_reminderHighlightEnableKey)
        .then((e) => e ?? false),
  };
}

/// リマインダーを保存
@riverpod
Future<void> reminderSave(
  Ref ref, {
  required ReminderType type,
  required bool enable,
  required TimeOfDay time,
}) async {
  // オン
  if (enable) {
    // 通知を初期化
    await ref.read(flutterLocalNotificationPluginInitializeProvider.future);

    // スケジュール
    switch (type) {
      case ReminderType.condition:
        await ref.read(flutterLocalNotificationsPluginProvider).zonedSchedule(
              _reminderConditionNotificationId,
              i18n.reminder.conditionReminderNotificationTitle,
              null,
              nextInstance(time),
              const NotificationDetails(
                iOS: DarwinNotificationDetails(),
              ),
              androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
              uiLocalNotificationDateInterpretation:
                  UILocalNotificationDateInterpretation.absoluteTime,
              matchDateTimeComponents: DateTimeComponents.time,
            );

      case ReminderType.highlight:
        await ref.read(flutterLocalNotificationsPluginProvider).zonedSchedule(
              _reminderHighlightNotificationId,
              i18n.reminder.highlightReminderNotificationTitle,
              null,
              nextSaturdayInstance(time),
              const NotificationDetails(
                iOS: DarwinNotificationDetails(),
              ),
              androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
              uiLocalNotificationDateInterpretation:
                  UILocalNotificationDateInterpretation.absoluteTime,
              matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
            );
    }
  } else {
    // オフ
    // 通知をキャンセル
    switch (type) {
      case ReminderType.condition:
        await ref
            .read(flutterLocalNotificationsPluginProvider)
            .cancel(_reminderConditionNotificationId);
      case ReminderType.highlight:
        await ref
            .read(flutterLocalNotificationsPluginProvider)
            .cancel(_reminderHighlightNotificationId);
    }
  }

  switch (type) {
    case ReminderType.condition:
      await Future.wait([
        ref
            .read(sharedPreferencesProvider)
            .setInt(_reminderConditionHourKey, time.hour),
        ref
            .read(sharedPreferencesProvider)
            .setInt(_reminderConditionMinuteKey, time.minute),
        ref
            .read(sharedPreferencesProvider)
            .setBool(_reminderConditionEnableKey, enable),
      ]);
    case ReminderType.highlight:
      await Future.wait([
        ref
            .read(sharedPreferencesProvider)
            .setInt(_reminderHighlightHourKey, time.hour),
        ref
            .read(sharedPreferencesProvider)
            .setInt(_reminderHighlightMinuteKey, time.minute),
        ref
            .read(sharedPreferencesProvider)
            .setBool(_reminderHighlightEnableKey, enable),
      ]);
  }
}

@visibleForTesting
tz.TZDateTime nextInstance(TimeOfDay time) {
  final now = clock.now();

  var scheduledDate = tz.TZDateTime(
    tz.local,
    now.year,
    now.month,
    now.day,
    time.hour,
    time.minute,
  );
  print("scheduledDate: $scheduledDate");

  if (scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(
      const Duration(days: 1),
    );
  }
  return scheduledDate;
}

@visibleForTesting
tz.TZDateTime nextSaturdayInstance(TimeOfDay time) {
  final now = clock.now();

  var scheduledDate = tz.TZDateTime(
    tz.local,
    now.year,
    now.month,
    now.day,
    time.hour,
    time.minute,
  );

  if (scheduledDate.weekday != DateTime.saturday ||
      scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(
      Duration(days: (DateTime.saturday - scheduledDate.weekday + 7) % 7),
    );
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 7));
    }
  }

  return scheduledDate;
}

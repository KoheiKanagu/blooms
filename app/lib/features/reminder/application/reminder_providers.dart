import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/utils/configure/shared_preferences_providers.dart';
import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timezone/timezone.dart' as tz;

part 'reminder_providers.g.dart';

const _reminderHourKey = 'reminder_hour';
const _reminderMinuteKey = 'reminder_minute';
const _reminderNotificationId = 0;
const _reminderEnableKey = 'reminder_enable';

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
Future<TimeOfDay> reminderTime(Ref ref) async {
  final results = await Future.wait([
    ref.read(sharedPreferencesProvider).getInt(_reminderHourKey),
    ref.read(sharedPreferencesProvider).getInt(_reminderMinuteKey),
  ]);

  final hour = results[0];
  final minute = results[1];

  return TimeOfDay(
    hour: hour ?? 20,
    minute: minute ?? 0,
  );
}

/// 通知の有効状態を取得
@riverpod
Future<bool> reminderStatus(Ref ref) {
  return ref
      .read(sharedPreferencesProvider)
      .getBool(_reminderEnableKey)
      .then((e) => e ?? false);
}

/// リマインダーを保存
@riverpod
Future<void> reminderSave(
  Ref ref, {
  required bool enable,
  required TimeOfDay time,
}) async {
  // オン
  if (enable) {
    // 通知を初期化
    await ref.read(flutterLocalNotificationPluginInitializeProvider.future);

    // スケジュール
    await ref.read(flutterLocalNotificationsPluginProvider).zonedSchedule(
          _reminderNotificationId,
          i18n.reminder.notificationTitle,
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
  } else {
    // オフ
    // 通知をキャンセル
    await ref
        .read(flutterLocalNotificationsPluginProvider)
        .cancel(_reminderNotificationId);
  }

  // 時間と有効状態を保存
  await Future.wait([
    ref.read(sharedPreferencesProvider).setInt(_reminderHourKey, time.hour),
    ref.read(sharedPreferencesProvider).setInt(_reminderMinuteKey, time.minute),
    ref.read(sharedPreferencesProvider).setBool(_reminderEnableKey, enable),
  ]);
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
  if (scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(
      const Duration(days: 1),
    );
  }
  return scheduledDate;
}

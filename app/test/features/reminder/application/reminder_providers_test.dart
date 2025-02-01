import 'package:blooms/features/reminder/application/reminder_providers.dart';
import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:timezone/timezone.dart' as tz;

void main() {
  group('nextInstance', () {
    test(
      '同日の時間が求められること',
      () async {
        const time = TimeOfDay(
          hour: 10,
          minute: 0,
        );

        final now = Clock.fixed(
          tz.TZDateTime.from(
            DateTime(2025, 12, 31, 9), // 9:00
            tz.getLocation('Asia/Tokyo'),
          ),
        );
        print('now: $now');

        withClock(now, () {
          final actual = nextInstance(time);
          print('actual: $actual');

          expect(actual.year, 2025);
          expect(actual.month, 12);
          expect(actual.day, 31);
          expect(actual.hour, 10);
          expect(actual.minute, 0);
        });
      },
    );

    test(
      '次の日の時間が求められること',
      () async {
        const time = TimeOfDay(
          hour: 10,
          minute: 0,
        );

        final now = Clock.fixed(
          DateTime(2025, 12, 31, 10, 1), // 10:01
        );

        withClock(now, () {
          final actual = nextInstance(time);

          expect(actual.year, 2026);
          expect(actual.month, 1);
          expect(actual.day, 1);
          expect(actual.hour, 10);
          expect(actual.minute, 0);
        });
      },
    );
  });

  group('nextSaturdayInstance', () {
    test(
      '同じ週の土曜日の時間が求められること',
      () async {
        const time = TimeOfDay(
          hour: 10,
          minute: 0,
        );

        final now = Clock.fixed(
          DateTime(2024, 1, 2), // 火曜日
        );

        withClock(now, () {
          final actual = nextSaturdayInstance(time);

          expect(actual.year, 2024);
          expect(actual.month, 1);
          expect(actual.day, 6);
          expect(actual.hour, 10);
          expect(actual.minute, 0);
        });
      },
    );

    test(
      '次の週の土曜日の時間が求められること（指定時刻を過ぎている場合）',
      () async {
        const time = TimeOfDay(
          hour: 10,
          minute: 0,
        );

        final now = Clock.fixed(
          DateTime(2024, 1, 6, 10, 1), // 土曜日 10:01
        );

        withClock(now, () {
          final actual = nextSaturdayInstance(time);

          expect(actual.year, 2024);
          expect(actual.month, 1);
          expect(actual.day, 13);
          expect(actual.hour, 10);
          expect(actual.minute, 0);
        });
      },
    );

    test(
      '次の週の土曜日の時間が求められること（土曜日以外で指定時刻を過ぎている場合）',
      () async {
        const time = TimeOfDay(
          hour: 10,
          minute: 0,
        );

        final now = Clock.fixed(
          DateTime(2024, 1, 2, 10, 1), // 火曜日 10:01
        );

        withClock(now, () {
          final actual = nextSaturdayInstance(time);

          expect(actual.year, 2024);
          expect(actual.month, 1);
          expect(actual.day, 6);
          expect(actual.hour, 10);
          expect(actual.minute, 0);
        });
      },
    );
  });
}

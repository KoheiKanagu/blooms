import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendar_providers.g.dart';

@riverpod
DateTime calendarSelectedDate(Ref ref) {
  return DateUtils.dateOnly(DateTime.now());
}

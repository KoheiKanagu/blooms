import 'package:intl/intl.dart';

final _dateFormat = DateFormat.MMMEd();
final _timeFormat = DateFormat.Hm();

/// 日付をフォーマットして返す
///
/// e.g. 12月31日(月)
String myDateFormat(DateTime dateTime) {
  return _dateFormat.format(dateTime);
}

/// 時刻をフォーマットして返す
///
/// e.g. 23:59
String myTimeFormat(DateTime dateTime) {
  return _timeFormat.format(dateTime);
}

/// 日付と時刻をフォーマットして返す
///
/// e.g. 12月31日(月) 23:59
String myDateTimeFormat(DateTime dateTime) {
  return '${_dateFormat.format(dateTime)} ${_timeFormat.format(dateTime)}';
}

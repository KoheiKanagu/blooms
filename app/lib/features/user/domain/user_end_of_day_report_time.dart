import 'package:blooms/utils/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_end_of_day_report_time.freezed.dart';
part 'user_end_of_day_report_time.g.dart';

/// 1日の終わりのレポートの作成目安時刻
/// UTC
@freezed
class UserEndOfDayReportTime with _$UserEndOfDayReportTime {
  const factory UserEndOfDayReportTime({
    required int hour,
    required int minute,
  }) = _UserEndOfDayReportTime;

  factory UserEndOfDayReportTime.fromJson(Json json) =>
      _$UserEndOfDayReportTimeFromJson(json);
}

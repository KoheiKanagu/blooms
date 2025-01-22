import 'package:blooms/utils/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_daily_highlight_time.freezed.dart';
part 'user_daily_highlight_time.g.dart';

/// 1日の終わりのハイライトの作成目安時刻
/// UTC
@freezed
class UserDailyHighlightTime with _$UserDailyHighlightTime {
  const factory UserDailyHighlightTime({
    required int hour,
    required int minute,
  }) = _UserDailyHighlightTime;

  factory UserDailyHighlightTime.fromJson(Json json) =>
      _$UserDailyHighlightTimeFromJson(json);
}

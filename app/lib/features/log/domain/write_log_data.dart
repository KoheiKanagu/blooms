import 'package:blooms/utils/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'write_log_data.freezed.dart';
part 'write_log_data.g.dart';

@Freezed(copyWith: false)
abstract class WriteLogData with _$WriteLogData {
  const factory WriteLogData({required LogLevel level, required Json log}) =
      _WriteLogData;

  factory WriteLogData.fromJson(Json json) => _$WriteLogDataFromJson(json);
}

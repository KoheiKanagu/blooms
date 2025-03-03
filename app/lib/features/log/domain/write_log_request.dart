import 'package:blooms/features/log/domain/write_log_data.dart';
import 'package:blooms/utils/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'write_log_request.freezed.dart';
part 'write_log_request.g.dart';

@freezed
abstract class WriteLogRequest with _$WriteLogRequest {
  const factory WriteLogRequest({required List<WriteLogData> logs}) =
      _WriteLogRequest;

  factory WriteLogRequest.fromJson(Json json) =>
      _$WriteLogRequestFromJson(json);
}

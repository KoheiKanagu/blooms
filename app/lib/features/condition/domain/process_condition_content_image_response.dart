import 'package:blooms/utils/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'process_condition_content_image_response.freezed.dart';
part 'process_condition_content_image_response.g.dart';

@freezed
class ProcessConditionContentImageResponse
    with _$ProcessConditionContentImageResponse {
  const factory ProcessConditionContentImageResponse({
    required String gsFilePath,
    required String blurHash,
    required int width,
    required int height,
    required String mimeType,
  }) = _ProcessConditionContentImageResponse;

  factory ProcessConditionContentImageResponse.fromJson(Json json) =>
      _$ProcessConditionContentImageResponseFromJson(json);
}

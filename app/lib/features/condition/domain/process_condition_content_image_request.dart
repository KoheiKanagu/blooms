import 'package:blooms/utils/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'process_condition_content_image_request.freezed.dart';
part 'process_condition_content_image_request.g.dart';

@freezed
abstract class ProcessConditionContentImageRequest
    with _$ProcessConditionContentImageRequest {
  const factory ProcessConditionContentImageRequest({required List<int> blob}) =
      _ProcessConditionContentImageRequest;

  factory ProcessConditionContentImageRequest.fromJson(Json json) =>
      _$ProcessConditionContentImageRequestFromJson(json);
}

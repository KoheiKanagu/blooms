import 'package:blooms/utils/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'condition_content_image_attachment.freezed.dart';
part 'condition_content_image_attachment.g.dart';

@freezed
abstract class ConditionContentImageAttachment
    with _$ConditionContentImageAttachment {
  const factory ConditionContentImageAttachment({
    /// gs://パス
    required String fileUri,
    required String mimeType,
    required int width,
    required int height,
    required ConditionContentImageAttachmentAdditionalInfo additionalInfo,
  }) = _ConditionContentImageAttachment;

  factory ConditionContentImageAttachment.gs({
    required String gsFilePath,
    required String mimeType,
    required int width,
    required int height,
    required String blurHash,
  }) => ConditionContentImageAttachment(
    fileUri: gsFilePath,
    mimeType: mimeType,
    width: width,
    height: height,
    additionalInfo: ConditionContentImageAttachmentAdditionalInfo(
      blurHash: blurHash,
    ),
  );

  factory ConditionContentImageAttachment.fromJson(Json json) =>
      _$ConditionContentImageAttachmentFromJson(json);
}

@freezed
abstract class ConditionContentImageAttachmentAdditionalInfo
    with _$ConditionContentImageAttachmentAdditionalInfo {
  const factory ConditionContentImageAttachmentAdditionalInfo({
    String? blurHash,
  }) = _ConditionContentImageAttachmentAdditionalInfo;

  factory ConditionContentImageAttachmentAdditionalInfo.fromJson(Json json) =>
      _$ConditionContentImageAttachmentAdditionalInfoFromJson(json);
}

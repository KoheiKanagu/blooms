import 'package:blooms/utils/typedefs.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'condition_content_image_attachment.freezed.dart';
part 'condition_content_image_attachment.g.dart';

@freezed
class ConditionContentImageAttachment with _$ConditionContentImageAttachment {
  const factory ConditionContentImageAttachment({
    /// gs://パス
    required String fileUri,
    required String mimeType,
  }) = _ConditionContentImageAttachment;

  factory ConditionContentImageAttachment.gs({
    required Reference reference,
    required String mimeType,
  }) =>
      ConditionContentImageAttachment(
        fileUri: 'gs://${reference.bucket}/${reference.fullPath}',
        mimeType: mimeType,
      );

  factory ConditionContentImageAttachment.fromJson(Json json) =>
      _$ConditionContentImageAttachmentFromJson(json);
}

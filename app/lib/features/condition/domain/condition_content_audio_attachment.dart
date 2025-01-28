import 'package:blooms/utils/typedefs.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'condition_content_audio_attachment.freezed.dart';
part 'condition_content_audio_attachment.g.dart';

@freezed
class ConditionContentAudioAttachment with _$ConditionContentAudioAttachment {
  const factory ConditionContentAudioAttachment({
    /// gs://パス
    required String fileUri,
    required String mimeType,
  }) = _ConditionContentAudioAttachment;

  factory ConditionContentAudioAttachment.gs({
    required Reference reference,
    required String mimeType,
  }) =>
      ConditionContentAudioAttachment(
        fileUri: 'gs://${reference.bucket}/${reference.fullPath}',
        mimeType: mimeType,
      );

  factory ConditionContentAudioAttachment.fromJson(Json json) =>
      _$ConditionContentAudioAttachmentFromJson(json);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'condition_content_audio_attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConditionContentAudioAttachment _$ConditionContentAudioAttachmentFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate('_ConditionContentAudioAttachment', json, ($checkedConvert) {
      final val = _ConditionContentAudioAttachment(
        fileUri: $checkedConvert('fileUri', (v) => v as String),
        mimeType: $checkedConvert('mimeType', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$ConditionContentAudioAttachmentToJson(
  _ConditionContentAudioAttachment instance,
) => <String, dynamic>{
  'fileUri': instance.fileUri,
  'mimeType': instance.mimeType,
};

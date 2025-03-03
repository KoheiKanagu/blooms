// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'condition_content_image_attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConditionContentImageAttachment _$ConditionContentImageAttachmentFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate('_ConditionContentImageAttachment', json, ($checkedConvert) {
      final val = _ConditionContentImageAttachment(
        fileUri: $checkedConvert('fileUri', (v) => v as String),
        mimeType: $checkedConvert('mimeType', (v) => v as String),
        width: $checkedConvert('width', (v) => (v as num).toInt()),
        height: $checkedConvert('height', (v) => (v as num).toInt()),
        additionalInfo: $checkedConvert(
          'additionalInfo',
          (v) => ConditionContentImageAttachmentAdditionalInfo.fromJson(
            v as Map<String, dynamic>,
          ),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ConditionContentImageAttachmentToJson(
  _ConditionContentImageAttachment instance,
) => <String, dynamic>{
  'fileUri': instance.fileUri,
  'mimeType': instance.mimeType,
  'width': instance.width,
  'height': instance.height,
  'additionalInfo': instance.additionalInfo.toJson(),
};

_ConditionContentImageAttachmentAdditionalInfo
_$ConditionContentImageAttachmentAdditionalInfoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ConditionContentImageAttachmentAdditionalInfo', json, (
  $checkedConvert,
) {
  final val = _ConditionContentImageAttachmentAdditionalInfo(
    blurHash: $checkedConvert('blurHash', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$ConditionContentImageAttachmentAdditionalInfoToJson(
  _ConditionContentImageAttachmentAdditionalInfo instance,
) => <String, dynamic>{'blurHash': instance.blurHash};

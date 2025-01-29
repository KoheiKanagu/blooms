// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'condition_content_image_attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConditionContentImageAttachmentImpl
    _$$ConditionContentImageAttachmentImplFromJson(Map<String, dynamic> json) =>
        $checkedCreate(
          r'_$ConditionContentImageAttachmentImpl',
          json,
          ($checkedConvert) {
            final val = _$ConditionContentImageAttachmentImpl(
              fileUri: $checkedConvert('fileUri', (v) => v as String),
              mimeType: $checkedConvert('mimeType', (v) => v as String),
              width: $checkedConvert('width', (v) => (v as num).toInt()),
              height: $checkedConvert('height', (v) => (v as num).toInt()),
              additionalInfo: $checkedConvert(
                  'additionalInfo',
                  (v) => ConditionContentImageAttachmentAdditionalInfo.fromJson(
                      v as Map<String, dynamic>)),
            );
            return val;
          },
        );

Map<String, dynamic> _$$ConditionContentImageAttachmentImplToJson(
        _$ConditionContentImageAttachmentImpl instance) =>
    <String, dynamic>{
      'fileUri': instance.fileUri,
      'mimeType': instance.mimeType,
      'width': instance.width,
      'height': instance.height,
      'additionalInfo': instance.additionalInfo.toJson(),
    };

_$ConditionContentImageAttachmentAdditionalInfoImpl
    _$$ConditionContentImageAttachmentAdditionalInfoImplFromJson(
            Map<String, dynamic> json) =>
        $checkedCreate(
          r'_$ConditionContentImageAttachmentAdditionalInfoImpl',
          json,
          ($checkedConvert) {
            final val = _$ConditionContentImageAttachmentAdditionalInfoImpl(
              blurHash: $checkedConvert('blurHash', (v) => v as String?),
            );
            return val;
          },
        );

Map<String, dynamic> _$$ConditionContentImageAttachmentAdditionalInfoImplToJson(
        _$ConditionContentImageAttachmentAdditionalInfoImpl instance) =>
    <String, dynamic>{
      'blurHash': instance.blurHash,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'process_condition_content_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessConditionContentImageResponseImpl
    _$$ProcessConditionContentImageResponseImplFromJson(
            Map<String, dynamic> json) =>
        $checkedCreate(
          r'_$ProcessConditionContentImageResponseImpl',
          json,
          ($checkedConvert) {
            final val = _$ProcessConditionContentImageResponseImpl(
              gsFilePath: $checkedConvert('gsFilePath', (v) => v as String),
              blurHash: $checkedConvert('blurHash', (v) => v as String),
              width: $checkedConvert('width', (v) => (v as num).toInt()),
              height: $checkedConvert('height', (v) => (v as num).toInt()),
              mimeType: $checkedConvert('mimeType', (v) => v as String),
            );
            return val;
          },
        );

Map<String, dynamic> _$$ProcessConditionContentImageResponseImplToJson(
        _$ProcessConditionContentImageResponseImpl instance) =>
    <String, dynamic>{
      'gsFilePath': instance.gsFilePath,
      'blurHash': instance.blurHash,
      'width': instance.width,
      'height': instance.height,
      'mimeType': instance.mimeType,
    };

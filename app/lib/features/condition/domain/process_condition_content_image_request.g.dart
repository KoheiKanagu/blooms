// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'process_condition_content_image_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProcessConditionContentImageRequest
_$ProcessConditionContentImageRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ProcessConditionContentImageRequest', json, (
      $checkedConvert,
    ) {
      final val = _ProcessConditionContentImageRequest(
        base64: $checkedConvert('base64', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$ProcessConditionContentImageRequestToJson(
  _ProcessConditionContentImageRequest instance,
) => <String, dynamic>{'base64': instance.base64};

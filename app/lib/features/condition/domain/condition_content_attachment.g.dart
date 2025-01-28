// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'condition_content_attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConditionContentAttachmentImpl _$$ConditionContentAttachmentImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ConditionContentAttachmentImpl',
      json,
      ($checkedConvert) {
        final val = _$ConditionContentAttachmentImpl(
          gsPath: $checkedConvert('gsPath', (v) => v as String),
          state: $checkedConvert(
              'state', (v) => $enumDecode(_$ConditionStateEnumMap, v)),
          alt: $checkedConvert('alt', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$ConditionContentAttachmentImplToJson(
        _$ConditionContentAttachmentImpl instance) =>
    <String, dynamic>{
      'gsPath': instance.gsPath,
      'state': _$ConditionStateEnumMap[instance.state]!,
      'alt': instance.alt,
    };

const _$ConditionStateEnumMap = {
  ConditionState.pending: 'pending',
  ConditionState.inProgress: 'inProgress',
  ConditionState.success: 'success',
  ConditionState.failure: 'failure',
};

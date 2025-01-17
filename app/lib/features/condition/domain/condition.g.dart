// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConditionImpl _$$ConditionImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ConditionImpl',
      json,
      ($checkedConvert) {
        final val = _$ConditionImpl(
          createdBy: $checkedConvert('createdBy', (v) => v as String),
          createdAt: $checkedConvert(
              'createdAt', (v) => const TimestampConverter().fromJson(v)),
          updatedAt: $checkedConvert(
              'updatedAt', (v) => const TimestampConverter().fromJson(v)),
          deletedAt: $checkedConvert(
              'deletedAt', (v) => const TimestampConverter().fromJson(v)),
          type: $checkedConvert(
              'type',
              (v) =>
                  $enumDecodeNullable(_$ConditionTypeEnumMap, v) ??
                  ConditionType.unknown),
          attachments: $checkedConvert(
              'attachments',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                  const []),
          state: $checkedConvert(
              'state',
              (v) =>
                  $enumDecodeNullable(_$ConditionStateEnumMap, v) ??
                  ConditionState.unknown),
          record: $checkedConvert('record', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$ConditionImplToJson(_$ConditionImpl instance) =>
    <String, dynamic>{
      'createdBy': instance.createdBy,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'deletedAt': const TimestampConverter().toJson(instance.deletedAt),
      'type': _$ConditionTypeEnumMap[instance.type]!,
      'attachments': instance.attachments,
      'state': _$ConditionStateEnumMap[instance.state]!,
      'record': instance.record,
    };

const _$ConditionTypeEnumMap = {
  ConditionType.unknown: 'unknown',
  ConditionType.subjective: 'subjective',
  ConditionType.photo: 'photo',
};

const _$ConditionStateEnumMap = {
  ConditionState.unknown: 'unknown',
  ConditionState.pending: 'pending',
  ConditionState.inProgress: 'inProgress',
  ConditionState.success: 'success',
  ConditionState.failure: 'failure',
};

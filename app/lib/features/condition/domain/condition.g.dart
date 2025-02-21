// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConditionImpl _$$ConditionImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(r'_$ConditionImpl', json, ($checkedConvert) {
      final val = _$ConditionImpl(
        subjectUid: $checkedConvert('subjectUid', (v) => v as String),
        creatorType: $checkedConvert(
          'creatorType',
          (v) => $enumDecode(_$ConditionCreatorTypeEnumMap, v),
        ),
        content: $checkedConvert(
          'content',
          (v) => ConditionContent.fromJson(v as Map<String, dynamic>),
        ),
        createdAtIso8601: $checkedConvert(
          'createdAtIso8601',
          (v) => v as String?,
        ),
        createdAt: $checkedConvert(
          'createdAt',
          (v) => const TimestampConverter().fromJson(v),
        ),
        updatedAt: $checkedConvert(
          'updatedAt',
          (v) => const TimestampConverter().fromJson(v),
        ),
        deletedAt: $checkedConvert(
          'deletedAt',
          (v) => const TimestampConverter().fromJson(v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$$ConditionImplToJson(_$ConditionImpl instance) =>
    <String, dynamic>{
      'subjectUid': instance.subjectUid,
      'creatorType': _$ConditionCreatorTypeEnumMap[instance.creatorType]!,
      'content': instance.content.toJson(),
      'createdAtIso8601': instance.createdAtIso8601,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'deletedAt': const TimestampConverter().toJson(instance.deletedAt),
    };

const _$ConditionCreatorTypeEnumMap = {
  ConditionCreatorType.user: 'user',
  ConditionCreatorType.model: 'model',
};

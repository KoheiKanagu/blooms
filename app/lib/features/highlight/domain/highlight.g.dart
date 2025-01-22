// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'highlight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HighlightImpl _$$HighlightImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$HighlightImpl',
      json,
      ($checkedConvert) {
        final val = _$HighlightImpl(
          type: $checkedConvert(
              'type', (v) => $enumDecode(_$HighlightTypeEnumMap, v)),
          subjectUid: $checkedConvert('subjectUid', (v) => v as String),
          startAt: $checkedConvert(
              'startAt', (v) => const TimestampConverterNotNull().fromJson(v)),
          prompt: $checkedConvert('prompt', (v) => v as String?),
          content: $checkedConvert(
              'content',
              (v) => v == null
                  ? null
                  : HighlightContent.fromJson(v as Map<String, dynamic>)),
          state: $checkedConvert(
              'state',
              (v) =>
                  $enumDecodeNullable(_$HighlightStateEnumMap, v) ??
                  HighlightState.pending),
          createdAt: $checkedConvert(
              'createdAt', (v) => const TimestampConverter().fromJson(v)),
          updatedAt: $checkedConvert(
              'updatedAt', (v) => const TimestampConverter().fromJson(v)),
          deletedAt: $checkedConvert(
              'deletedAt', (v) => const TimestampConverter().fromJson(v)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$HighlightImplToJson(_$HighlightImpl instance) =>
    <String, dynamic>{
      'type': _$HighlightTypeEnumMap[instance.type]!,
      'subjectUid': instance.subjectUid,
      'startAt': const TimestampConverterNotNull().toJson(instance.startAt),
      'prompt': instance.prompt,
      'content': instance.content?.toJson(),
      'state': _$HighlightStateEnumMap[instance.state]!,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'deletedAt': const TimestampConverter().toJson(instance.deletedAt),
    };

const _$HighlightTypeEnumMap = {
  HighlightType.past1day: 'past1day',
  HighlightType.past7days: 'past7days',
  HighlightType.past14days: 'past14days',
  HighlightType.past21days: 'past21days',
  HighlightType.past28days: 'past28days',
};

const _$HighlightStateEnumMap = {
  HighlightState.pending: 'pending',
  HighlightState.inProgress: 'inProgress',
  HighlightState.success: 'success',
  HighlightState.failure: 'failure',
};

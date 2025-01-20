// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportImpl _$$ReportImplFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$ReportImpl',
      json,
      ($checkedConvert) {
        final val = _$ReportImpl(
          type: $checkedConvert(
              'type', (v) => $enumDecode(_$ReportTypeEnumMap, v)),
          subjectUid: $checkedConvert('subjectUid', (v) => v as String),
          prompt: $checkedConvert('prompt', (v) => v as String?),
          content: $checkedConvert(
              'content',
              (v) => v == null
                  ? null
                  : ReportContent.fromJson(v as Map<String, dynamic>)),
          state: $checkedConvert(
              'state',
              (v) =>
                  $enumDecodeNullable(_$ReportStateEnumMap, v) ??
                  ReportState.pending),
          createdAt: $checkedConvert(
              'createdAt', (v) => const TimestampConverter().fromJson(v)),
          updatedAt: $checkedConvert(
              'updatedAt', (v) => const TimestampConverter().fromJson(v)),
          deletedAt: $checkedConvert(
              'deletedAt', (v) => const TimestampConverter().fromJson(v)),
          startAt: $checkedConvert(
              'startAt', (v) => const TimestampConverter().fromJson(v)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$ReportImplToJson(_$ReportImpl instance) =>
    <String, dynamic>{
      'type': _$ReportTypeEnumMap[instance.type]!,
      'subjectUid': instance.subjectUid,
      'prompt': instance.prompt,
      'content': instance.content?.toJson(),
      'state': _$ReportStateEnumMap[instance.state]!,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'deletedAt': const TimestampConverter().toJson(instance.deletedAt),
      'startAt': const TimestampConverter().toJson(instance.startAt),
    };

const _$ReportTypeEnumMap = {
  ReportType.past1day: 'past1day',
  ReportType.past7days: 'past7days',
  ReportType.past14days: 'past14days',
  ReportType.past21days: 'past21days',
  ReportType.past28days: 'past28days',
};

const _$ReportStateEnumMap = {
  ReportState.pending: 'pending',
  ReportState.inProgress: 'inProgress',
  ReportState.success: 'success',
  ReportState.failure: 'failure',
};

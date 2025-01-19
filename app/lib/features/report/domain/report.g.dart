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
          subjectiveConditionTendency: $checkedConvert(
              'subjectiveConditionTendency', (v) => v as String?),
          objectiveConditionTendency: $checkedConvert(
              'objectiveConditionTendency', (v) => v as String?),
          analysisResult:
              $checkedConvert('analysisResult', (v) => v as String?),
          advice: $checkedConvert('advice', (v) => v as String?),
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
      'subjectiveConditionTendency': instance.subjectiveConditionTendency,
      'objectiveConditionTendency': instance.objectiveConditionTendency,
      'analysisResult': instance.analysisResult,
      'advice': instance.advice,
      'state': _$ReportStateEnumMap[instance.state]!,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'deletedAt': const TimestampConverter().toJson(instance.deletedAt),
      'startAt': const TimestampConverter().toJson(instance.startAt),
    };

const _$ReportTypeEnumMap = {
  ReportType.last1day: 'last1day',
  ReportType.last7days: 'last7days',
  ReportType.last14days: 'last14days',
  ReportType.last21days: 'last21days',
  ReportType.last28days: 'last28days',
};

const _$ReportStateEnumMap = {
  ReportState.pending: 'pending',
  ReportState.inProgress: 'inProgress',
  ReportState.success: 'success',
  ReportState.failure: 'failure',
};

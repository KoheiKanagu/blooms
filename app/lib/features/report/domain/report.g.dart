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
          prompt: $checkedConvert('prompt', (v) => v as String),
          reportType: $checkedConvert(
              'reportType', (v) => $enumDecode(_$ReportTypeEnumMap, v)),
          subjectiveConditionTendency: $checkedConvert(
              'subjectiveConditionTendency', (v) => v as String),
          objectiveConditionTendency:
              $checkedConvert('objectiveConditionTendency', (v) => v as String),
          analysisResult: $checkedConvert('analysisResult', (v) => v as String),
          advice: $checkedConvert('advice', (v) => v as String),
          subjectUid: $checkedConvert('subjectUid', (v) => v as String),
          createdAt: $checkedConvert(
              'createdAt', (v) => const TimestampConverter().fromJson(v)),
          updatedAt: $checkedConvert(
              'updatedAt', (v) => const TimestampConverter().fromJson(v)),
          deletedAt: $checkedConvert(
              'deletedAt', (v) => const TimestampConverter().fromJson(v)),
          targetDate: $checkedConvert(
              'targetDate', (v) => const TimestampConverter().fromJson(v)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$ReportImplToJson(_$ReportImpl instance) =>
    <String, dynamic>{
      'prompt': instance.prompt,
      'reportType': _$ReportTypeEnumMap[instance.reportType]!,
      'subjectiveConditionTendency': instance.subjectiveConditionTendency,
      'objectiveConditionTendency': instance.objectiveConditionTendency,
      'analysisResult': instance.analysisResult,
      'advice': instance.advice,
      'subjectUid': instance.subjectUid,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'deletedAt': const TimestampConverter().toJson(instance.deletedAt),
      'targetDate': const TimestampConverter().toJson(instance.targetDate),
    };

const _$ReportTypeEnumMap = {
  ReportType.last1day: 'last1day',
  ReportType.last7days: 'last7days',
  ReportType.last14days: 'last14days',
  ReportType.last21days: 'last21days',
  ReportType.last28days: 'last28days',
};

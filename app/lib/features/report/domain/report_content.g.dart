// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'report_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportContentImpl _$$ReportContentImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ReportContentImpl',
      json,
      ($checkedConvert) {
        final val = _$ReportContentImpl(
          subjectiveConditionTendency: $checkedConvert(
              'subjectiveConditionTendency', (v) => v as String?),
          objectiveConditionTendency: $checkedConvert(
              'objectiveConditionTendency', (v) => v as String?),
          analysisResult:
              $checkedConvert('analysisResult', (v) => v as String?),
          advice: $checkedConvert('advice', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$ReportContentImplToJson(_$ReportContentImpl instance) =>
    <String, dynamic>{
      'subjectiveConditionTendency': instance.subjectiveConditionTendency,
      'objectiveConditionTendency': instance.objectiveConditionTendency,
      'analysisResult': instance.analysisResult,
      'advice': instance.advice,
    };

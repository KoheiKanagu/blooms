// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'highlight_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HighlightContentImpl _$$HighlightContentImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$HighlightContentImpl',
      json,
      ($checkedConvert) {
        final val = _$HighlightContentImpl(
          subjectiveTrend:
              $checkedConvert('subjectiveTrend', (v) => v as String),
          objectiveTrend: $checkedConvert('objectiveTrend', (v) => v as String),
          analysisResult: $checkedConvert('analysisResult', (v) => v as String),
          advice: $checkedConvert('advice', (v) => v as String),
          abstract: $checkedConvert('abstract', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$HighlightContentImplToJson(
        _$HighlightContentImpl instance) =>
    <String, dynamic>{
      'subjectiveTrend': instance.subjectiveTrend,
      'objectiveTrend': instance.objectiveTrend,
      'analysisResult': instance.analysisResult,
      'advice': instance.advice,
      'abstract': instance.abstract,
    };

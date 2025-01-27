// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'highlight_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HighlightContentForOwnImpl _$$HighlightContentForOwnImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$HighlightContentForOwnImpl',
      json,
      ($checkedConvert) {
        final val = _$HighlightContentForOwnImpl(
          subjectiveTrend:
              $checkedConvert('subjectiveTrend', (v) => v as String),
          objectiveTrend: $checkedConvert('objectiveTrend', (v) => v as String),
          analysisResult: $checkedConvert('analysisResult', (v) => v as String),
          advice: $checkedConvert('advice', (v) => v as String),
          abstract: $checkedConvert('abstract', (v) => v as String),
          $type: $checkedConvert('style', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'style'},
    );

Map<String, dynamic> _$$HighlightContentForOwnImplToJson(
        _$HighlightContentForOwnImpl instance) =>
    <String, dynamic>{
      'subjectiveTrend': instance.subjectiveTrend,
      'objectiveTrend': instance.objectiveTrend,
      'analysisResult': instance.analysisResult,
      'advice': instance.advice,
      'abstract': instance.abstract,
      'style': instance.$type,
    };

_$HighlightContentForProfessionalImpl
    _$$HighlightContentForProfessionalImplFromJson(Map<String, dynamic> json) =>
        $checkedCreate(
          r'_$HighlightContentForProfessionalImpl',
          json,
          ($checkedConvert) {
            final val = _$HighlightContentForProfessionalImpl(
              analysisResults: $checkedConvert('analysisResults',
                  (v) => (v as List<dynamic>).map((e) => e as String).toList()),
              abstract: $checkedConvert('abstract', (v) => v as String),
              $type: $checkedConvert('style', (v) => v as String?),
            );
            return val;
          },
          fieldKeyMap: const {r'$type': 'style'},
        );

Map<String, dynamic> _$$HighlightContentForProfessionalImplToJson(
        _$HighlightContentForProfessionalImpl instance) =>
    <String, dynamic>{
      'analysisResults': instance.analysisResults,
      'abstract': instance.abstract,
      'style': instance.$type,
    };

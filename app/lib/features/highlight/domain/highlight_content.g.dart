// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'highlight_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HighlightContentPrivateImpl _$$HighlightContentPrivateImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$HighlightContentPrivateImpl',
      json,
      ($checkedConvert) {
        final val = _$HighlightContentPrivateImpl(
          startAt: $checkedConvert(
              'startAt', (v) => const TimestampConverterNotNull().fromJson(v)),
          period: $checkedConvert(
              'period', (v) => $enumDecode(_$HighlightPeriodEnumMap, v)),
          subjectiveTrend:
              $checkedConvert('subjectiveTrend', (v) => v as String? ?? ''),
          objectiveTrend:
              $checkedConvert('objectiveTrend', (v) => v as String? ?? ''),
          analysisResult:
              $checkedConvert('analysisResult', (v) => v as String? ?? ''),
          advice: $checkedConvert('advice', (v) => v as String? ?? ''),
          abstract: $checkedConvert('abstract', (v) => v as String? ?? ''),
          state: $checkedConvert(
              'state',
              (v) =>
                  $enumDecodeNullable(_$HighlightStateEnumMap, v) ??
                  HighlightState.pending),
          promptFileUri: $checkedConvert('promptFileUri', (v) => v as String?),
          $type: $checkedConvert('style', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'style'},
    );

Map<String, dynamic> _$$HighlightContentPrivateImplToJson(
        _$HighlightContentPrivateImpl instance) =>
    <String, dynamic>{
      'startAt': const TimestampConverterNotNull().toJson(instance.startAt),
      'period': _$HighlightPeriodEnumMap[instance.period]!,
      'subjectiveTrend': instance.subjectiveTrend,
      'objectiveTrend': instance.objectiveTrend,
      'analysisResult': instance.analysisResult,
      'advice': instance.advice,
      'abstract': instance.abstract,
      'state': _$HighlightStateEnumMap[instance.state]!,
      'promptFileUri': instance.promptFileUri,
      'style': instance.$type,
    };

const _$HighlightPeriodEnumMap = {
  HighlightPeriod.past1day: 'past1day',
  HighlightPeriod.past7days: 'past7days',
  HighlightPeriod.past14days: 'past14days',
  HighlightPeriod.past21days: 'past21days',
  HighlightPeriod.past28days: 'past28days',
};

const _$HighlightStateEnumMap = {
  HighlightState.pending: 'pending',
  HighlightState.inProgress: 'inProgress',
  HighlightState.success: 'success',
  HighlightState.failure: 'failure',
};

_$HighlightContentEmptyImpl _$$HighlightContentEmptyImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$HighlightContentEmptyImpl',
      json,
      ($checkedConvert) {
        final val = _$HighlightContentEmptyImpl(
          $type: $checkedConvert('style', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'style'},
    );

Map<String, dynamic> _$$HighlightContentEmptyImplToJson(
        _$HighlightContentEmptyImpl instance) =>
    <String, dynamic>{
      'style': instance.$type,
    };

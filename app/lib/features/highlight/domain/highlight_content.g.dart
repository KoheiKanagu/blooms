// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'highlight_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HighlightContentSummaryImpl _$$HighlightContentSummaryImplFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(r'_$HighlightContentSummaryImpl', json, ($checkedConvert) {
  final val = _$HighlightContentSummaryImpl(
    startAt: $checkedConvert(
      'startAt',
      (v) => const TimestampConverterNotNull().fromJson(v),
    ),
    period: $checkedConvert(
      'period',
      (v) => $enumDecode(_$HighlightPeriodEnumMap, v),
    ),
    summary: $checkedConvert('summary', (v) => v as String),
    abstract: $checkedConvert('abstract', (v) => v as String),
    state: $checkedConvert(
      'state',
      (v) =>
          $enumDecodeNullable(_$HighlightStateEnumMap, v) ??
          HighlightState.pending,
    ),
    promptFileUri: $checkedConvert('promptFileUri', (v) => v as String?),
    $type: $checkedConvert('type', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'type'});

Map<String, dynamic> _$$HighlightContentSummaryImplToJson(
  _$HighlightContentSummaryImpl instance,
) => <String, dynamic>{
  'startAt': const TimestampConverterNotNull().toJson(instance.startAt),
  'period': _$HighlightPeriodEnumMap[instance.period]!,
  'summary': instance.summary,
  'abstract': instance.abstract,
  'state': _$HighlightStateEnumMap[instance.state]!,
  'promptFileUri': instance.promptFileUri,
  'type': instance.$type,
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
  Map<String, dynamic> json,
) => $checkedCreate(r'_$HighlightContentEmptyImpl', json, ($checkedConvert) {
  final val = _$HighlightContentEmptyImpl(
    $type: $checkedConvert('type', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'type'});

Map<String, dynamic> _$$HighlightContentEmptyImplToJson(
  _$HighlightContentEmptyImpl instance,
) => <String, dynamic>{'type': instance.$type};

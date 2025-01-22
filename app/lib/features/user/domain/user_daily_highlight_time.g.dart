// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'user_daily_highlight_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDailyHighlightTimeImpl _$$UserDailyHighlightTimeImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$UserDailyHighlightTimeImpl',
      json,
      ($checkedConvert) {
        final val = _$UserDailyHighlightTimeImpl(
          hour: $checkedConvert('hour', (v) => (v as num).toInt()),
          minute: $checkedConvert('minute', (v) => (v as num).toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$UserDailyHighlightTimeImplToJson(
        _$UserDailyHighlightTimeImpl instance) =>
    <String, dynamic>{
      'hour': instance.hour,
      'minute': instance.minute,
    };

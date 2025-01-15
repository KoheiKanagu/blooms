// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'user_end_of_day_report_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEndOfDayReportTimeImpl _$$UserEndOfDayReportTimeImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$UserEndOfDayReportTimeImpl',
      json,
      ($checkedConvert) {
        final val = _$UserEndOfDayReportTimeImpl(
          hour: $checkedConvert('hour', (v) => (v as num).toInt()),
          minute: $checkedConvert('minute', (v) => (v as num).toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$UserEndOfDayReportTimeImplToJson(
        _$UserEndOfDayReportTimeImpl instance) =>
    <String, dynamic>{
      'hour': instance.hour,
      'minute': instance.minute,
    };

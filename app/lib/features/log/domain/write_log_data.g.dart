// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'write_log_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WriteLogData _$WriteLogDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_WriteLogData', json, ($checkedConvert) {
      final val = _WriteLogData(
        level: $checkedConvert(
          'level',
          (v) => $enumDecode(_$LogLevelEnumMap, v),
        ),
        log: $checkedConvert('log', (v) => v as Map<String, dynamic>),
      );
      return val;
    });

Map<String, dynamic> _$WriteLogDataToJson(_WriteLogData instance) =>
    <String, dynamic>{
      'level': _$LogLevelEnumMap[instance.level]!,
      'log': instance.log,
    };

const _$LogLevelEnumMap = {
  LogLevel.error: 'error',
  LogLevel.critical: 'critical',
  LogLevel.info: 'info',
  LogLevel.debug: 'debug',
  LogLevel.verbose: 'verbose',
  LogLevel.warning: 'warning',
};

// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'write_log_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WriteLogRequestImpl _$$WriteLogRequestImplFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(r'_$WriteLogRequestImpl', json, ($checkedConvert) {
  final val = _$WriteLogRequestImpl(
    logs: $checkedConvert(
      'logs',
      (v) =>
          (v as List<dynamic>)
              .map((e) => WriteLogData.fromJson(e as Map<String, dynamic>))
              .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$$WriteLogRequestImplToJson(
  _$WriteLogRequestImpl instance,
) => <String, dynamic>{'logs': instance.logs.map((e) => e.toJson()).toList()};

// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$UserImpl',
      json,
      ($checkedConvert) {
        final val = _$UserImpl(
          dailyHighlightTime: $checkedConvert(
              'dailyHighlightTime',
              (v) =>
                  UserDailyHighlightTime.fromJson(v as Map<String, dynamic>)),
          createdAt: $checkedConvert(
              'createdAt', (v) => const TimestampConverter().fromJson(v)),
          updatedAt: $checkedConvert(
              'updatedAt', (v) => const TimestampConverter().fromJson(v)),
          deletedAt: $checkedConvert(
              'deletedAt', (v) => const TimestampConverter().fromJson(v)),
          weatherLocation:
              $checkedConvert('weatherLocation', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'dailyHighlightTime': instance.dailyHighlightTime.toJson(),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'deletedAt': const TimestampConverter().toJson(instance.deletedAt),
      'weatherLocation': instance.weatherLocation,
    };

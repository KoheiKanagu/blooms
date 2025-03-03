// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_User', json, ($checkedConvert) {
      final val = _User(
        createdAt: $checkedConvert(
          'createdAt',
          (v) => const TimestampConverter().fromJson(v),
        ),
        updatedAt: $checkedConvert(
          'updatedAt',
          (v) => const TimestampConverter().fromJson(v),
        ),
        deletedAt: $checkedConvert(
          'deletedAt',
          (v) => const TimestampConverter().fromJson(v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
  'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
  'deletedAt': const TimestampConverter().toJson(instance.deletedAt),
};

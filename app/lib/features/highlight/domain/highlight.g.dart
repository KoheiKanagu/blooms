// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'highlight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Highlight _$HighlightFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Highlight', json, ($checkedConvert) {
      final val = _Highlight(
        subjectUid: $checkedConvert('subjectUid', (v) => v as String),
        content: $checkedConvert(
          'content',
          (v) => HighlightContent.fromJson(v as Map<String, dynamic>),
        ),
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

Map<String, dynamic> _$HighlightToJson(_Highlight instance) =>
    <String, dynamic>{
      'subjectUid': instance.subjectUid,
      'content': instance.content.toJson(),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'deletedAt': const TimestampConverter().toJson(instance.deletedAt),
    };

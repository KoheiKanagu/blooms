// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'condition_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConditionContentSubjectiveImpl _$$ConditionContentSubjectiveImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ConditionContentSubjectiveImpl',
      json,
      ($checkedConvert) {
        final val = _$ConditionContentSubjectiveImpl(
          record: $checkedConvert('record', (v) => v as String),
          $type: $checkedConvert('type', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'type'},
    );

Map<String, dynamic> _$$ConditionContentSubjectiveImplToJson(
        _$ConditionContentSubjectiveImpl instance) =>
    <String, dynamic>{
      'record': instance.record,
      'type': instance.$type,
    };

_$ConditionContentPhotoImpl _$$ConditionContentPhotoImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ConditionContentPhotoImpl',
      json,
      ($checkedConvert) {
        final val = _$ConditionContentPhotoImpl(
          attachments: $checkedConvert(
              'attachments',
              (v) => (v as List<dynamic>)
                  .map((e) => ConditionContentAttachment.fromJson(
                      e as Map<String, dynamic>))
                  .toList()),
          $type: $checkedConvert('type', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'type'},
    );

Map<String, dynamic> _$$ConditionContentPhotoImplToJson(
        _$ConditionContentPhotoImpl instance) =>
    <String, dynamic>{
      'attachments': instance.attachments.map((e) => e.toJson()).toList(),
      'type': instance.$type,
    };

_$ConditionContentEmptyImpl _$$ConditionContentEmptyImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ConditionContentEmptyImpl',
      json,
      ($checkedConvert) {
        final val = _$ConditionContentEmptyImpl(
          $type: $checkedConvert('type', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'type'},
    );

Map<String, dynamic> _$$ConditionContentEmptyImplToJson(
        _$ConditionContentEmptyImpl instance) =>
    <String, dynamic>{
      'type': instance.$type,
    };

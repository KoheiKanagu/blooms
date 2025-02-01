// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'condition_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConditionContentTextImpl _$$ConditionContentTextImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ConditionContentTextImpl',
      json,
      ($checkedConvert) {
        final val = _$ConditionContentTextImpl(
          text: $checkedConvert('text', (v) => v as String),
          $type: $checkedConvert('type', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'type'},
    );

Map<String, dynamic> _$$ConditionContentTextImplToJson(
        _$ConditionContentTextImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': instance.$type,
    };

_$ConditionContentTextWithSearchKeywordsImpl
    _$$ConditionContentTextWithSearchKeywordsImplFromJson(
            Map<String, dynamic> json) =>
        $checkedCreate(
          r'_$ConditionContentTextWithSearchKeywordsImpl',
          json,
          ($checkedConvert) {
            final val = _$ConditionContentTextWithSearchKeywordsImpl(
              text: $checkedConvert('text', (v) => v as String),
              searchKeywords: $checkedConvert('searchKeywords',
                  (v) => (v as List<dynamic>).map((e) => e as String).toList()),
              $type: $checkedConvert('type', (v) => v as String?),
            );
            return val;
          },
          fieldKeyMap: const {r'$type': 'type'},
        );

Map<String, dynamic> _$$ConditionContentTextWithSearchKeywordsImplToJson(
        _$ConditionContentTextWithSearchKeywordsImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'searchKeywords': instance.searchKeywords,
      'type': instance.$type,
    };

_$ConditionContentImageImpl _$$ConditionContentImageImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ConditionContentImageImpl',
      json,
      ($checkedConvert) {
        final val = _$ConditionContentImageImpl(
          attachments: $checkedConvert(
              'attachments',
              (v) => (v as List<dynamic>)
                  .map((e) => ConditionContentImageAttachment.fromJson(
                      e as Map<String, dynamic>))
                  .toList()),
          $type: $checkedConvert('type', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'type'},
    );

Map<String, dynamic> _$$ConditionContentImageImplToJson(
        _$ConditionContentImageImpl instance) =>
    <String, dynamic>{
      'attachments': instance.attachments.map((e) => e.toJson()).toList(),
      'type': instance.$type,
    };

_$ConditionContentAudioImpl _$$ConditionContentAudioImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ConditionContentAudioImpl',
      json,
      ($checkedConvert) {
        final val = _$ConditionContentAudioImpl(
          attachments: $checkedConvert(
              'attachments',
              (v) => (v as List<dynamic>)
                  .map((e) => ConditionContentAudioAttachment.fromJson(
                      e as Map<String, dynamic>))
                  .toList()),
          $type: $checkedConvert('type', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'type'},
    );

Map<String, dynamic> _$$ConditionContentAudioImplToJson(
        _$ConditionContentAudioImpl instance) =>
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

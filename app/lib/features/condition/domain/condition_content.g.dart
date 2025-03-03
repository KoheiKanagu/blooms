// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'condition_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConditionContentText _$ConditionContentTextFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ConditionContentText', json, ($checkedConvert) {
  final val = ConditionContentText(
    text: $checkedConvert('text', (v) => v as String),
    $type: $checkedConvert('type', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'type'});

Map<String, dynamic> _$ConditionContentTextToJson(
  ConditionContentText instance,
) => <String, dynamic>{'text': instance.text, 'type': instance.$type};

ConditionContentTextWithSearchKeywords
_$ConditionContentTextWithSearchKeywordsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ConditionContentTextWithSearchKeywords',
      json,
      ($checkedConvert) {
        final val = ConditionContentTextWithSearchKeywords(
          text: $checkedConvert('text', (v) => v as String),
          searchKeywords: $checkedConvert(
            'searchKeywords',
            (v) => (v as List<dynamic>).map((e) => e as String).toList(),
          ),
          $type: $checkedConvert('type', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'type'},
    );

Map<String, dynamic> _$ConditionContentTextWithSearchKeywordsToJson(
  ConditionContentTextWithSearchKeywords instance,
) => <String, dynamic>{
  'text': instance.text,
  'searchKeywords': instance.searchKeywords,
  'type': instance.$type,
};

ConditionContentImage _$ConditionContentImageFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ConditionContentImage', json, ($checkedConvert) {
  final val = ConditionContentImage(
    attachments: $checkedConvert(
      'attachments',
      (v) =>
          (v as List<dynamic>)
              .map(
                (e) => ConditionContentImageAttachment.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
    ),
    $type: $checkedConvert('type', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'type'});

Map<String, dynamic> _$ConditionContentImageToJson(
  ConditionContentImage instance,
) => <String, dynamic>{
  'attachments': instance.attachments.map((e) => e.toJson()).toList(),
  'type': instance.$type,
};

ConditionContentAudio _$ConditionContentAudioFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ConditionContentAudio', json, ($checkedConvert) {
  final val = ConditionContentAudio(
    attachments: $checkedConvert(
      'attachments',
      (v) =>
          (v as List<dynamic>)
              .map(
                (e) => ConditionContentAudioAttachment.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
    ),
    $type: $checkedConvert('type', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'type'});

Map<String, dynamic> _$ConditionContentAudioToJson(
  ConditionContentAudio instance,
) => <String, dynamic>{
  'attachments': instance.attachments.map((e) => e.toJson()).toList(),
  'type': instance.$type,
};

ConditionContentEmpty _$ConditionContentEmptyFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ConditionContentEmpty', json, ($checkedConvert) {
  final val = ConditionContentEmpty(
    $type: $checkedConvert('type', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'type'});

Map<String, dynamic> _$ConditionContentEmptyToJson(
  ConditionContentEmpty instance,
) => <String, dynamic>{'type': instance.$type};

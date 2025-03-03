// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'condition_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ConditionContent _$ConditionContentFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'text':
          return ConditionContentText.fromJson(
            json
          );
                case 'textWithSearchKeywords':
          return ConditionContentTextWithSearchKeywords.fromJson(
            json
          );
                case 'image':
          return ConditionContentImage.fromJson(
            json
          );
                case 'audio':
          return ConditionContentAudio.fromJson(
            json
          );
        
          default:
            return ConditionContentEmpty.fromJson(
  json
);
        }
      
}

/// @nodoc
mixin _$ConditionContent {



  /// Serializes this ConditionContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConditionContent);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConditionContent()';
}


}

/// @nodoc
class $ConditionContentCopyWith<$Res>  {
$ConditionContentCopyWith(ConditionContent _, $Res Function(ConditionContent) __);
}


/// @nodoc
@JsonSerializable()

class ConditionContentText implements ConditionContent {
  const ConditionContentText({required this.text, final  String? $type}): $type = $type ?? 'text';
  factory ConditionContentText.fromJson(Map<String, dynamic> json) => _$ConditionContentTextFromJson(json);

 final  String text;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of ConditionContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConditionContentTextCopyWith<ConditionContentText> get copyWith => _$ConditionContentTextCopyWithImpl<ConditionContentText>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConditionContentTextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConditionContentText&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
  return 'ConditionContent.text(text: $text)';
}


}

/// @nodoc
abstract mixin class $ConditionContentTextCopyWith<$Res> implements $ConditionContentCopyWith<$Res> {
  factory $ConditionContentTextCopyWith(ConditionContentText value, $Res Function(ConditionContentText) _then) = _$ConditionContentTextCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$ConditionContentTextCopyWithImpl<$Res>
    implements $ConditionContentTextCopyWith<$Res> {
  _$ConditionContentTextCopyWithImpl(this._self, this._then);

  final ConditionContentText _self;
  final $Res Function(ConditionContentText) _then;

/// Create a copy of ConditionContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(ConditionContentText(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ConditionContentTextWithSearchKeywords implements ConditionContent {
  const ConditionContentTextWithSearchKeywords({required this.text, required final  List<String> searchKeywords, final  String? $type}): _searchKeywords = searchKeywords,$type = $type ?? 'textWithSearchKeywords';
  factory ConditionContentTextWithSearchKeywords.fromJson(Map<String, dynamic> json) => _$ConditionContentTextWithSearchKeywordsFromJson(json);

 final  String text;
 final  List<String> _searchKeywords;
 List<String> get searchKeywords {
  if (_searchKeywords is EqualUnmodifiableListView) return _searchKeywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchKeywords);
}


@JsonKey(name: 'type')
final String $type;


/// Create a copy of ConditionContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConditionContentTextWithSearchKeywordsCopyWith<ConditionContentTextWithSearchKeywords> get copyWith => _$ConditionContentTextWithSearchKeywordsCopyWithImpl<ConditionContentTextWithSearchKeywords>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConditionContentTextWithSearchKeywordsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConditionContentTextWithSearchKeywords&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other._searchKeywords, _searchKeywords));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,const DeepCollectionEquality().hash(_searchKeywords));

@override
String toString() {
  return 'ConditionContent.textWithSearchKeywords(text: $text, searchKeywords: $searchKeywords)';
}


}

/// @nodoc
abstract mixin class $ConditionContentTextWithSearchKeywordsCopyWith<$Res> implements $ConditionContentCopyWith<$Res> {
  factory $ConditionContentTextWithSearchKeywordsCopyWith(ConditionContentTextWithSearchKeywords value, $Res Function(ConditionContentTextWithSearchKeywords) _then) = _$ConditionContentTextWithSearchKeywordsCopyWithImpl;
@useResult
$Res call({
 String text, List<String> searchKeywords
});




}
/// @nodoc
class _$ConditionContentTextWithSearchKeywordsCopyWithImpl<$Res>
    implements $ConditionContentTextWithSearchKeywordsCopyWith<$Res> {
  _$ConditionContentTextWithSearchKeywordsCopyWithImpl(this._self, this._then);

  final ConditionContentTextWithSearchKeywords _self;
  final $Res Function(ConditionContentTextWithSearchKeywords) _then;

/// Create a copy of ConditionContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,Object? searchKeywords = null,}) {
  return _then(ConditionContentTextWithSearchKeywords(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,searchKeywords: null == searchKeywords ? _self._searchKeywords : searchKeywords // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ConditionContentImage implements ConditionContent {
  const ConditionContentImage({required final  List<ConditionContentImageAttachment> attachments, final  String? $type}): _attachments = attachments,$type = $type ?? 'image';
  factory ConditionContentImage.fromJson(Map<String, dynamic> json) => _$ConditionContentImageFromJson(json);

 final  List<ConditionContentImageAttachment> _attachments;
 List<ConditionContentImageAttachment> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}


@JsonKey(name: 'type')
final String $type;


/// Create a copy of ConditionContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConditionContentImageCopyWith<ConditionContentImage> get copyWith => _$ConditionContentImageCopyWithImpl<ConditionContentImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConditionContentImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConditionContentImage&&const DeepCollectionEquality().equals(other._attachments, _attachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_attachments));

@override
String toString() {
  return 'ConditionContent.image(attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class $ConditionContentImageCopyWith<$Res> implements $ConditionContentCopyWith<$Res> {
  factory $ConditionContentImageCopyWith(ConditionContentImage value, $Res Function(ConditionContentImage) _then) = _$ConditionContentImageCopyWithImpl;
@useResult
$Res call({
 List<ConditionContentImageAttachment> attachments
});




}
/// @nodoc
class _$ConditionContentImageCopyWithImpl<$Res>
    implements $ConditionContentImageCopyWith<$Res> {
  _$ConditionContentImageCopyWithImpl(this._self, this._then);

  final ConditionContentImage _self;
  final $Res Function(ConditionContentImage) _then;

/// Create a copy of ConditionContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? attachments = null,}) {
  return _then(ConditionContentImage(
attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<ConditionContentImageAttachment>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ConditionContentAudio implements ConditionContent {
  const ConditionContentAudio({required final  List<ConditionContentAudioAttachment> attachments, final  String? $type}): _attachments = attachments,$type = $type ?? 'audio';
  factory ConditionContentAudio.fromJson(Map<String, dynamic> json) => _$ConditionContentAudioFromJson(json);

 final  List<ConditionContentAudioAttachment> _attachments;
 List<ConditionContentAudioAttachment> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}


@JsonKey(name: 'type')
final String $type;


/// Create a copy of ConditionContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConditionContentAudioCopyWith<ConditionContentAudio> get copyWith => _$ConditionContentAudioCopyWithImpl<ConditionContentAudio>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConditionContentAudioToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConditionContentAudio&&const DeepCollectionEquality().equals(other._attachments, _attachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_attachments));

@override
String toString() {
  return 'ConditionContent.audio(attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class $ConditionContentAudioCopyWith<$Res> implements $ConditionContentCopyWith<$Res> {
  factory $ConditionContentAudioCopyWith(ConditionContentAudio value, $Res Function(ConditionContentAudio) _then) = _$ConditionContentAudioCopyWithImpl;
@useResult
$Res call({
 List<ConditionContentAudioAttachment> attachments
});




}
/// @nodoc
class _$ConditionContentAudioCopyWithImpl<$Res>
    implements $ConditionContentAudioCopyWith<$Res> {
  _$ConditionContentAudioCopyWithImpl(this._self, this._then);

  final ConditionContentAudio _self;
  final $Res Function(ConditionContentAudio) _then;

/// Create a copy of ConditionContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? attachments = null,}) {
  return _then(ConditionContentAudio(
attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<ConditionContentAudioAttachment>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ConditionContentEmpty implements ConditionContent {
  const ConditionContentEmpty({final  String? $type}): $type = $type ?? 'empty';
  factory ConditionContentEmpty.fromJson(Map<String, dynamic> json) => _$ConditionContentEmptyFromJson(json);



@JsonKey(name: 'type')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$ConditionContentEmptyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConditionContentEmpty);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConditionContent.empty()';
}


}




// dart format on

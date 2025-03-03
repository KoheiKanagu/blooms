// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'condition_content_audio_attachment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConditionContentAudioAttachment {

/// gs://パス
 String get fileUri; String get mimeType;
/// Create a copy of ConditionContentAudioAttachment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConditionContentAudioAttachmentCopyWith<ConditionContentAudioAttachment> get copyWith => _$ConditionContentAudioAttachmentCopyWithImpl<ConditionContentAudioAttachment>(this as ConditionContentAudioAttachment, _$identity);

  /// Serializes this ConditionContentAudioAttachment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConditionContentAudioAttachment&&(identical(other.fileUri, fileUri) || other.fileUri == fileUri)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileUri,mimeType);

@override
String toString() {
  return 'ConditionContentAudioAttachment(fileUri: $fileUri, mimeType: $mimeType)';
}


}

/// @nodoc
abstract mixin class $ConditionContentAudioAttachmentCopyWith<$Res>  {
  factory $ConditionContentAudioAttachmentCopyWith(ConditionContentAudioAttachment value, $Res Function(ConditionContentAudioAttachment) _then) = _$ConditionContentAudioAttachmentCopyWithImpl;
@useResult
$Res call({
 String fileUri, String mimeType
});




}
/// @nodoc
class _$ConditionContentAudioAttachmentCopyWithImpl<$Res>
    implements $ConditionContentAudioAttachmentCopyWith<$Res> {
  _$ConditionContentAudioAttachmentCopyWithImpl(this._self, this._then);

  final ConditionContentAudioAttachment _self;
  final $Res Function(ConditionContentAudioAttachment) _then;

/// Create a copy of ConditionContentAudioAttachment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileUri = null,Object? mimeType = null,}) {
  return _then(_self.copyWith(
fileUri: null == fileUri ? _self.fileUri : fileUri // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ConditionContentAudioAttachment implements ConditionContentAudioAttachment {
  const _ConditionContentAudioAttachment({required this.fileUri, required this.mimeType});
  factory _ConditionContentAudioAttachment.fromJson(Map<String, dynamic> json) => _$ConditionContentAudioAttachmentFromJson(json);

/// gs://パス
@override final  String fileUri;
@override final  String mimeType;

/// Create a copy of ConditionContentAudioAttachment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConditionContentAudioAttachmentCopyWith<_ConditionContentAudioAttachment> get copyWith => __$ConditionContentAudioAttachmentCopyWithImpl<_ConditionContentAudioAttachment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConditionContentAudioAttachmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConditionContentAudioAttachment&&(identical(other.fileUri, fileUri) || other.fileUri == fileUri)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileUri,mimeType);

@override
String toString() {
  return 'ConditionContentAudioAttachment(fileUri: $fileUri, mimeType: $mimeType)';
}


}

/// @nodoc
abstract mixin class _$ConditionContentAudioAttachmentCopyWith<$Res> implements $ConditionContentAudioAttachmentCopyWith<$Res> {
  factory _$ConditionContentAudioAttachmentCopyWith(_ConditionContentAudioAttachment value, $Res Function(_ConditionContentAudioAttachment) _then) = __$ConditionContentAudioAttachmentCopyWithImpl;
@override @useResult
$Res call({
 String fileUri, String mimeType
});




}
/// @nodoc
class __$ConditionContentAudioAttachmentCopyWithImpl<$Res>
    implements _$ConditionContentAudioAttachmentCopyWith<$Res> {
  __$ConditionContentAudioAttachmentCopyWithImpl(this._self, this._then);

  final _ConditionContentAudioAttachment _self;
  final $Res Function(_ConditionContentAudioAttachment) _then;

/// Create a copy of ConditionContentAudioAttachment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileUri = null,Object? mimeType = null,}) {
  return _then(_ConditionContentAudioAttachment(
fileUri: null == fileUri ? _self.fileUri : fileUri // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

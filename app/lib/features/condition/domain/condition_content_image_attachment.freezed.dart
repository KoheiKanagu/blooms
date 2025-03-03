// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'condition_content_image_attachment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConditionContentImageAttachment {

/// gs://パス
 String get fileUri; String get mimeType; int get width; int get height; ConditionContentImageAttachmentAdditionalInfo get additionalInfo;
/// Create a copy of ConditionContentImageAttachment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConditionContentImageAttachmentCopyWith<ConditionContentImageAttachment> get copyWith => _$ConditionContentImageAttachmentCopyWithImpl<ConditionContentImageAttachment>(this as ConditionContentImageAttachment, _$identity);

  /// Serializes this ConditionContentImageAttachment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConditionContentImageAttachment&&(identical(other.fileUri, fileUri) || other.fileUri == fileUri)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.additionalInfo, additionalInfo) || other.additionalInfo == additionalInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileUri,mimeType,width,height,additionalInfo);

@override
String toString() {
  return 'ConditionContentImageAttachment(fileUri: $fileUri, mimeType: $mimeType, width: $width, height: $height, additionalInfo: $additionalInfo)';
}


}

/// @nodoc
abstract mixin class $ConditionContentImageAttachmentCopyWith<$Res>  {
  factory $ConditionContentImageAttachmentCopyWith(ConditionContentImageAttachment value, $Res Function(ConditionContentImageAttachment) _then) = _$ConditionContentImageAttachmentCopyWithImpl;
@useResult
$Res call({
 String fileUri, String mimeType, int width, int height, ConditionContentImageAttachmentAdditionalInfo additionalInfo
});


$ConditionContentImageAttachmentAdditionalInfoCopyWith<$Res> get additionalInfo;

}
/// @nodoc
class _$ConditionContentImageAttachmentCopyWithImpl<$Res>
    implements $ConditionContentImageAttachmentCopyWith<$Res> {
  _$ConditionContentImageAttachmentCopyWithImpl(this._self, this._then);

  final ConditionContentImageAttachment _self;
  final $Res Function(ConditionContentImageAttachment) _then;

/// Create a copy of ConditionContentImageAttachment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileUri = null,Object? mimeType = null,Object? width = null,Object? height = null,Object? additionalInfo = null,}) {
  return _then(_self.copyWith(
fileUri: null == fileUri ? _self.fileUri : fileUri // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,additionalInfo: null == additionalInfo ? _self.additionalInfo : additionalInfo // ignore: cast_nullable_to_non_nullable
as ConditionContentImageAttachmentAdditionalInfo,
  ));
}
/// Create a copy of ConditionContentImageAttachment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConditionContentImageAttachmentAdditionalInfoCopyWith<$Res> get additionalInfo {
  
  return $ConditionContentImageAttachmentAdditionalInfoCopyWith<$Res>(_self.additionalInfo, (value) {
    return _then(_self.copyWith(additionalInfo: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ConditionContentImageAttachment implements ConditionContentImageAttachment {
  const _ConditionContentImageAttachment({required this.fileUri, required this.mimeType, required this.width, required this.height, required this.additionalInfo});
  factory _ConditionContentImageAttachment.fromJson(Map<String, dynamic> json) => _$ConditionContentImageAttachmentFromJson(json);

/// gs://パス
@override final  String fileUri;
@override final  String mimeType;
@override final  int width;
@override final  int height;
@override final  ConditionContentImageAttachmentAdditionalInfo additionalInfo;

/// Create a copy of ConditionContentImageAttachment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConditionContentImageAttachmentCopyWith<_ConditionContentImageAttachment> get copyWith => __$ConditionContentImageAttachmentCopyWithImpl<_ConditionContentImageAttachment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConditionContentImageAttachmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConditionContentImageAttachment&&(identical(other.fileUri, fileUri) || other.fileUri == fileUri)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.additionalInfo, additionalInfo) || other.additionalInfo == additionalInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileUri,mimeType,width,height,additionalInfo);

@override
String toString() {
  return 'ConditionContentImageAttachment(fileUri: $fileUri, mimeType: $mimeType, width: $width, height: $height, additionalInfo: $additionalInfo)';
}


}

/// @nodoc
abstract mixin class _$ConditionContentImageAttachmentCopyWith<$Res> implements $ConditionContentImageAttachmentCopyWith<$Res> {
  factory _$ConditionContentImageAttachmentCopyWith(_ConditionContentImageAttachment value, $Res Function(_ConditionContentImageAttachment) _then) = __$ConditionContentImageAttachmentCopyWithImpl;
@override @useResult
$Res call({
 String fileUri, String mimeType, int width, int height, ConditionContentImageAttachmentAdditionalInfo additionalInfo
});


@override $ConditionContentImageAttachmentAdditionalInfoCopyWith<$Res> get additionalInfo;

}
/// @nodoc
class __$ConditionContentImageAttachmentCopyWithImpl<$Res>
    implements _$ConditionContentImageAttachmentCopyWith<$Res> {
  __$ConditionContentImageAttachmentCopyWithImpl(this._self, this._then);

  final _ConditionContentImageAttachment _self;
  final $Res Function(_ConditionContentImageAttachment) _then;

/// Create a copy of ConditionContentImageAttachment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileUri = null,Object? mimeType = null,Object? width = null,Object? height = null,Object? additionalInfo = null,}) {
  return _then(_ConditionContentImageAttachment(
fileUri: null == fileUri ? _self.fileUri : fileUri // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,additionalInfo: null == additionalInfo ? _self.additionalInfo : additionalInfo // ignore: cast_nullable_to_non_nullable
as ConditionContentImageAttachmentAdditionalInfo,
  ));
}

/// Create a copy of ConditionContentImageAttachment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConditionContentImageAttachmentAdditionalInfoCopyWith<$Res> get additionalInfo {
  
  return $ConditionContentImageAttachmentAdditionalInfoCopyWith<$Res>(_self.additionalInfo, (value) {
    return _then(_self.copyWith(additionalInfo: value));
  });
}
}


/// @nodoc
mixin _$ConditionContentImageAttachmentAdditionalInfo {

 String? get blurHash;
/// Create a copy of ConditionContentImageAttachmentAdditionalInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConditionContentImageAttachmentAdditionalInfoCopyWith<ConditionContentImageAttachmentAdditionalInfo> get copyWith => _$ConditionContentImageAttachmentAdditionalInfoCopyWithImpl<ConditionContentImageAttachmentAdditionalInfo>(this as ConditionContentImageAttachmentAdditionalInfo, _$identity);

  /// Serializes this ConditionContentImageAttachmentAdditionalInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConditionContentImageAttachmentAdditionalInfo&&(identical(other.blurHash, blurHash) || other.blurHash == blurHash));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,blurHash);

@override
String toString() {
  return 'ConditionContentImageAttachmentAdditionalInfo(blurHash: $blurHash)';
}


}

/// @nodoc
abstract mixin class $ConditionContentImageAttachmentAdditionalInfoCopyWith<$Res>  {
  factory $ConditionContentImageAttachmentAdditionalInfoCopyWith(ConditionContentImageAttachmentAdditionalInfo value, $Res Function(ConditionContentImageAttachmentAdditionalInfo) _then) = _$ConditionContentImageAttachmentAdditionalInfoCopyWithImpl;
@useResult
$Res call({
 String? blurHash
});




}
/// @nodoc
class _$ConditionContentImageAttachmentAdditionalInfoCopyWithImpl<$Res>
    implements $ConditionContentImageAttachmentAdditionalInfoCopyWith<$Res> {
  _$ConditionContentImageAttachmentAdditionalInfoCopyWithImpl(this._self, this._then);

  final ConditionContentImageAttachmentAdditionalInfo _self;
  final $Res Function(ConditionContentImageAttachmentAdditionalInfo) _then;

/// Create a copy of ConditionContentImageAttachmentAdditionalInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? blurHash = freezed,}) {
  return _then(_self.copyWith(
blurHash: freezed == blurHash ? _self.blurHash : blurHash // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ConditionContentImageAttachmentAdditionalInfo implements ConditionContentImageAttachmentAdditionalInfo {
  const _ConditionContentImageAttachmentAdditionalInfo({this.blurHash});
  factory _ConditionContentImageAttachmentAdditionalInfo.fromJson(Map<String, dynamic> json) => _$ConditionContentImageAttachmentAdditionalInfoFromJson(json);

@override final  String? blurHash;

/// Create a copy of ConditionContentImageAttachmentAdditionalInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConditionContentImageAttachmentAdditionalInfoCopyWith<_ConditionContentImageAttachmentAdditionalInfo> get copyWith => __$ConditionContentImageAttachmentAdditionalInfoCopyWithImpl<_ConditionContentImageAttachmentAdditionalInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConditionContentImageAttachmentAdditionalInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConditionContentImageAttachmentAdditionalInfo&&(identical(other.blurHash, blurHash) || other.blurHash == blurHash));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,blurHash);

@override
String toString() {
  return 'ConditionContentImageAttachmentAdditionalInfo(blurHash: $blurHash)';
}


}

/// @nodoc
abstract mixin class _$ConditionContentImageAttachmentAdditionalInfoCopyWith<$Res> implements $ConditionContentImageAttachmentAdditionalInfoCopyWith<$Res> {
  factory _$ConditionContentImageAttachmentAdditionalInfoCopyWith(_ConditionContentImageAttachmentAdditionalInfo value, $Res Function(_ConditionContentImageAttachmentAdditionalInfo) _then) = __$ConditionContentImageAttachmentAdditionalInfoCopyWithImpl;
@override @useResult
$Res call({
 String? blurHash
});




}
/// @nodoc
class __$ConditionContentImageAttachmentAdditionalInfoCopyWithImpl<$Res>
    implements _$ConditionContentImageAttachmentAdditionalInfoCopyWith<$Res> {
  __$ConditionContentImageAttachmentAdditionalInfoCopyWithImpl(this._self, this._then);

  final _ConditionContentImageAttachmentAdditionalInfo _self;
  final $Res Function(_ConditionContentImageAttachmentAdditionalInfo) _then;

/// Create a copy of ConditionContentImageAttachmentAdditionalInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? blurHash = freezed,}) {
  return _then(_ConditionContentImageAttachmentAdditionalInfo(
blurHash: freezed == blurHash ? _self.blurHash : blurHash // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'process_condition_content_image_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProcessConditionContentImageResponse {

 String get gsFilePath; String get blurHash; int get width; int get height; String get mimeType;
/// Create a copy of ProcessConditionContentImageResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProcessConditionContentImageResponseCopyWith<ProcessConditionContentImageResponse> get copyWith => _$ProcessConditionContentImageResponseCopyWithImpl<ProcessConditionContentImageResponse>(this as ProcessConditionContentImageResponse, _$identity);

  /// Serializes this ProcessConditionContentImageResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProcessConditionContentImageResponse&&(identical(other.gsFilePath, gsFilePath) || other.gsFilePath == gsFilePath)&&(identical(other.blurHash, blurHash) || other.blurHash == blurHash)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gsFilePath,blurHash,width,height,mimeType);

@override
String toString() {
  return 'ProcessConditionContentImageResponse(gsFilePath: $gsFilePath, blurHash: $blurHash, width: $width, height: $height, mimeType: $mimeType)';
}


}

/// @nodoc
abstract mixin class $ProcessConditionContentImageResponseCopyWith<$Res>  {
  factory $ProcessConditionContentImageResponseCopyWith(ProcessConditionContentImageResponse value, $Res Function(ProcessConditionContentImageResponse) _then) = _$ProcessConditionContentImageResponseCopyWithImpl;
@useResult
$Res call({
 String gsFilePath, String blurHash, int width, int height, String mimeType
});




}
/// @nodoc
class _$ProcessConditionContentImageResponseCopyWithImpl<$Res>
    implements $ProcessConditionContentImageResponseCopyWith<$Res> {
  _$ProcessConditionContentImageResponseCopyWithImpl(this._self, this._then);

  final ProcessConditionContentImageResponse _self;
  final $Res Function(ProcessConditionContentImageResponse) _then;

/// Create a copy of ProcessConditionContentImageResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gsFilePath = null,Object? blurHash = null,Object? width = null,Object? height = null,Object? mimeType = null,}) {
  return _then(_self.copyWith(
gsFilePath: null == gsFilePath ? _self.gsFilePath : gsFilePath // ignore: cast_nullable_to_non_nullable
as String,blurHash: null == blurHash ? _self.blurHash : blurHash // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ProcessConditionContentImageResponse implements ProcessConditionContentImageResponse {
  const _ProcessConditionContentImageResponse({required this.gsFilePath, required this.blurHash, required this.width, required this.height, required this.mimeType});
  factory _ProcessConditionContentImageResponse.fromJson(Map<String, dynamic> json) => _$ProcessConditionContentImageResponseFromJson(json);

@override final  String gsFilePath;
@override final  String blurHash;
@override final  int width;
@override final  int height;
@override final  String mimeType;

/// Create a copy of ProcessConditionContentImageResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcessConditionContentImageResponseCopyWith<_ProcessConditionContentImageResponse> get copyWith => __$ProcessConditionContentImageResponseCopyWithImpl<_ProcessConditionContentImageResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProcessConditionContentImageResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProcessConditionContentImageResponse&&(identical(other.gsFilePath, gsFilePath) || other.gsFilePath == gsFilePath)&&(identical(other.blurHash, blurHash) || other.blurHash == blurHash)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gsFilePath,blurHash,width,height,mimeType);

@override
String toString() {
  return 'ProcessConditionContentImageResponse(gsFilePath: $gsFilePath, blurHash: $blurHash, width: $width, height: $height, mimeType: $mimeType)';
}


}

/// @nodoc
abstract mixin class _$ProcessConditionContentImageResponseCopyWith<$Res> implements $ProcessConditionContentImageResponseCopyWith<$Res> {
  factory _$ProcessConditionContentImageResponseCopyWith(_ProcessConditionContentImageResponse value, $Res Function(_ProcessConditionContentImageResponse) _then) = __$ProcessConditionContentImageResponseCopyWithImpl;
@override @useResult
$Res call({
 String gsFilePath, String blurHash, int width, int height, String mimeType
});




}
/// @nodoc
class __$ProcessConditionContentImageResponseCopyWithImpl<$Res>
    implements _$ProcessConditionContentImageResponseCopyWith<$Res> {
  __$ProcessConditionContentImageResponseCopyWithImpl(this._self, this._then);

  final _ProcessConditionContentImageResponse _self;
  final $Res Function(_ProcessConditionContentImageResponse) _then;

/// Create a copy of ProcessConditionContentImageResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gsFilePath = null,Object? blurHash = null,Object? width = null,Object? height = null,Object? mimeType = null,}) {
  return _then(_ProcessConditionContentImageResponse(
gsFilePath: null == gsFilePath ? _self.gsFilePath : gsFilePath // ignore: cast_nullable_to_non_nullable
as String,blurHash: null == blurHash ? _self.blurHash : blurHash // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

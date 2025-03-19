// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'process_condition_content_image_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProcessConditionContentImageRequest {

 List<int> get blob;
/// Create a copy of ProcessConditionContentImageRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProcessConditionContentImageRequestCopyWith<ProcessConditionContentImageRequest> get copyWith => _$ProcessConditionContentImageRequestCopyWithImpl<ProcessConditionContentImageRequest>(this as ProcessConditionContentImageRequest, _$identity);

  /// Serializes this ProcessConditionContentImageRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProcessConditionContentImageRequest&&const DeepCollectionEquality().equals(other.blob, blob));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(blob));

@override
String toString() {
  return 'ProcessConditionContentImageRequest(blob: $blob)';
}


}

/// @nodoc
abstract mixin class $ProcessConditionContentImageRequestCopyWith<$Res>  {
  factory $ProcessConditionContentImageRequestCopyWith(ProcessConditionContentImageRequest value, $Res Function(ProcessConditionContentImageRequest) _then) = _$ProcessConditionContentImageRequestCopyWithImpl;
@useResult
$Res call({
 List<int> blob
});




}
/// @nodoc
class _$ProcessConditionContentImageRequestCopyWithImpl<$Res>
    implements $ProcessConditionContentImageRequestCopyWith<$Res> {
  _$ProcessConditionContentImageRequestCopyWithImpl(this._self, this._then);

  final ProcessConditionContentImageRequest _self;
  final $Res Function(ProcessConditionContentImageRequest) _then;

/// Create a copy of ProcessConditionContentImageRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? blob = null,}) {
  return _then(_self.copyWith(
blob: null == blob ? _self.blob : blob // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ProcessConditionContentImageRequest implements ProcessConditionContentImageRequest {
  const _ProcessConditionContentImageRequest({required final  List<int> blob}): _blob = blob;
  factory _ProcessConditionContentImageRequest.fromJson(Map<String, dynamic> json) => _$ProcessConditionContentImageRequestFromJson(json);

 final  List<int> _blob;
@override List<int> get blob {
  if (_blob is EqualUnmodifiableListView) return _blob;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_blob);
}


/// Create a copy of ProcessConditionContentImageRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcessConditionContentImageRequestCopyWith<_ProcessConditionContentImageRequest> get copyWith => __$ProcessConditionContentImageRequestCopyWithImpl<_ProcessConditionContentImageRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProcessConditionContentImageRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProcessConditionContentImageRequest&&const DeepCollectionEquality().equals(other._blob, _blob));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_blob));

@override
String toString() {
  return 'ProcessConditionContentImageRequest(blob: $blob)';
}


}

/// @nodoc
abstract mixin class _$ProcessConditionContentImageRequestCopyWith<$Res> implements $ProcessConditionContentImageRequestCopyWith<$Res> {
  factory _$ProcessConditionContentImageRequestCopyWith(_ProcessConditionContentImageRequest value, $Res Function(_ProcessConditionContentImageRequest) _then) = __$ProcessConditionContentImageRequestCopyWithImpl;
@override @useResult
$Res call({
 List<int> blob
});




}
/// @nodoc
class __$ProcessConditionContentImageRequestCopyWithImpl<$Res>
    implements _$ProcessConditionContentImageRequestCopyWith<$Res> {
  __$ProcessConditionContentImageRequestCopyWithImpl(this._self, this._then);

  final _ProcessConditionContentImageRequest _self;
  final $Res Function(_ProcessConditionContentImageRequest) _then;

/// Create a copy of ProcessConditionContentImageRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? blob = null,}) {
  return _then(_ProcessConditionContentImageRequest(
blob: null == blob ? _self._blob : blob // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on

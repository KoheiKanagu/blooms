// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'write_log_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WriteLogRequest {

 List<WriteLogData> get logs;
/// Create a copy of WriteLogRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WriteLogRequestCopyWith<WriteLogRequest> get copyWith => _$WriteLogRequestCopyWithImpl<WriteLogRequest>(this as WriteLogRequest, _$identity);

  /// Serializes this WriteLogRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WriteLogRequest&&const DeepCollectionEquality().equals(other.logs, logs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(logs));

@override
String toString() {
  return 'WriteLogRequest(logs: $logs)';
}


}

/// @nodoc
abstract mixin class $WriteLogRequestCopyWith<$Res>  {
  factory $WriteLogRequestCopyWith(WriteLogRequest value, $Res Function(WriteLogRequest) _then) = _$WriteLogRequestCopyWithImpl;
@useResult
$Res call({
 List<WriteLogData> logs
});




}
/// @nodoc
class _$WriteLogRequestCopyWithImpl<$Res>
    implements $WriteLogRequestCopyWith<$Res> {
  _$WriteLogRequestCopyWithImpl(this._self, this._then);

  final WriteLogRequest _self;
  final $Res Function(WriteLogRequest) _then;

/// Create a copy of WriteLogRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? logs = null,}) {
  return _then(_self.copyWith(
logs: null == logs ? _self.logs : logs // ignore: cast_nullable_to_non_nullable
as List<WriteLogData>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _WriteLogRequest implements WriteLogRequest {
  const _WriteLogRequest({required final  List<WriteLogData> logs}): _logs = logs;
  factory _WriteLogRequest.fromJson(Map<String, dynamic> json) => _$WriteLogRequestFromJson(json);

 final  List<WriteLogData> _logs;
@override List<WriteLogData> get logs {
  if (_logs is EqualUnmodifiableListView) return _logs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_logs);
}


/// Create a copy of WriteLogRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WriteLogRequestCopyWith<_WriteLogRequest> get copyWith => __$WriteLogRequestCopyWithImpl<_WriteLogRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WriteLogRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WriteLogRequest&&const DeepCollectionEquality().equals(other._logs, _logs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_logs));

@override
String toString() {
  return 'WriteLogRequest(logs: $logs)';
}


}

/// @nodoc
abstract mixin class _$WriteLogRequestCopyWith<$Res> implements $WriteLogRequestCopyWith<$Res> {
  factory _$WriteLogRequestCopyWith(_WriteLogRequest value, $Res Function(_WriteLogRequest) _then) = __$WriteLogRequestCopyWithImpl;
@override @useResult
$Res call({
 List<WriteLogData> logs
});




}
/// @nodoc
class __$WriteLogRequestCopyWithImpl<$Res>
    implements _$WriteLogRequestCopyWith<$Res> {
  __$WriteLogRequestCopyWithImpl(this._self, this._then);

  final _WriteLogRequest _self;
  final $Res Function(_WriteLogRequest) _then;

/// Create a copy of WriteLogRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? logs = null,}) {
  return _then(_WriteLogRequest(
logs: null == logs ? _self._logs : logs // ignore: cast_nullable_to_non_nullable
as List<WriteLogData>,
  ));
}


}

// dart format on

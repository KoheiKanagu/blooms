// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'write_log_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WriteLogData {

 LogLevel get level; Json get log;
/// Create a copy of WriteLogData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WriteLogDataCopyWith<WriteLogData> get copyWith => _$WriteLogDataCopyWithImpl<WriteLogData>(this as WriteLogData, _$identity);

  /// Serializes this WriteLogData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WriteLogData&&(identical(other.level, level) || other.level == level)&&const DeepCollectionEquality().equals(other.log, log));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,level,const DeepCollectionEquality().hash(log));

@override
String toString() {
  return 'WriteLogData(level: $level, log: $log)';
}


}

/// @nodoc
abstract mixin class $WriteLogDataCopyWith<$Res>  {
  factory $WriteLogDataCopyWith(WriteLogData value, $Res Function(WriteLogData) _then) = _$WriteLogDataCopyWithImpl;
@useResult
$Res call({
 LogLevel level, Map<String, dynamic> log
});




}
/// @nodoc
class _$WriteLogDataCopyWithImpl<$Res>
    implements $WriteLogDataCopyWith<$Res> {
  _$WriteLogDataCopyWithImpl(this._self, this._then);

  final WriteLogData _self;
  final $Res Function(WriteLogData) _then;

/// Create a copy of WriteLogData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? level = null,Object? log = null,}) {
  return _then(_self.copyWith(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as LogLevel,log: null == log ? _self.log! : log // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _WriteLogData implements WriteLogData {
  const _WriteLogData({required this.level, required final  Map<String, dynamic> log}): _log = log;
  factory _WriteLogData.fromJson(Map<String, dynamic> json) => _$WriteLogDataFromJson(json);

@override final  LogLevel level;
 final  Map<String, dynamic> _log;
@override Map<String, dynamic> get log {
  if (_log is EqualUnmodifiableMapView) return _log;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_log);
}


/// Create a copy of WriteLogData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WriteLogDataCopyWith<_WriteLogData> get copyWith => __$WriteLogDataCopyWithImpl<_WriteLogData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WriteLogDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WriteLogData&&(identical(other.level, level) || other.level == level)&&const DeepCollectionEquality().equals(other._log, _log));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,level,const DeepCollectionEquality().hash(_log));

@override
String toString() {
  return 'WriteLogData(level: $level, log: $log)';
}


}

/// @nodoc
abstract mixin class _$WriteLogDataCopyWith<$Res> implements $WriteLogDataCopyWith<$Res> {
  factory _$WriteLogDataCopyWith(_WriteLogData value, $Res Function(_WriteLogData) _then) = __$WriteLogDataCopyWithImpl;
@override @useResult
$Res call({
 LogLevel level, Map<String, dynamic> log
});




}
/// @nodoc
class __$WriteLogDataCopyWithImpl<$Res>
    implements _$WriteLogDataCopyWith<$Res> {
  __$WriteLogDataCopyWithImpl(this._self, this._then);

  final _WriteLogData _self;
  final $Res Function(_WriteLogData) _then;

/// Create a copy of WriteLogData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? level = null,Object? log = null,}) {
  return _then(_WriteLogData(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as LogLevel,log: null == log ? _self._log : log // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on

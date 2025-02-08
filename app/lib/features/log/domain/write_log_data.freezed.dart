// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'write_log_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WriteLogData _$WriteLogDataFromJson(Map<String, dynamic> json) {
  return _WriteLogData.fromJson(json);
}

/// @nodoc
mixin _$WriteLogData {
  LogLevel get level => throw _privateConstructorUsedError;
  Map<String, dynamic> get log => throw _privateConstructorUsedError;

  /// Serializes this WriteLogData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WriteLogData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WriteLogDataCopyWith<WriteLogData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WriteLogDataCopyWith<$Res> {
  factory $WriteLogDataCopyWith(
          WriteLogData value, $Res Function(WriteLogData) then) =
      _$WriteLogDataCopyWithImpl<$Res, WriteLogData>;
  @useResult
  $Res call({LogLevel level, Map<String, dynamic> log});
}

/// @nodoc
class _$WriteLogDataCopyWithImpl<$Res, $Val extends WriteLogData>
    implements $WriteLogDataCopyWith<$Res> {
  _$WriteLogDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WriteLogData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? log = null,
  }) {
    return _then(_value.copyWith(
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as LogLevel,
      log: null == log
          ? _value.log
          : log // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WriteLogDataImplCopyWith<$Res>
    implements $WriteLogDataCopyWith<$Res> {
  factory _$$WriteLogDataImplCopyWith(
          _$WriteLogDataImpl value, $Res Function(_$WriteLogDataImpl) then) =
      __$$WriteLogDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LogLevel level, Map<String, dynamic> log});
}

/// @nodoc
class __$$WriteLogDataImplCopyWithImpl<$Res>
    extends _$WriteLogDataCopyWithImpl<$Res, _$WriteLogDataImpl>
    implements _$$WriteLogDataImplCopyWith<$Res> {
  __$$WriteLogDataImplCopyWithImpl(
      _$WriteLogDataImpl _value, $Res Function(_$WriteLogDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of WriteLogData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? log = null,
  }) {
    return _then(_$WriteLogDataImpl(
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as LogLevel,
      log: null == log
          ? _value._log
          : log // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WriteLogDataImpl implements _WriteLogData {
  const _$WriteLogDataImpl(
      {required this.level, required final Map<String, dynamic> log})
      : _log = log;

  factory _$WriteLogDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WriteLogDataImplFromJson(json);

  @override
  final LogLevel level;
  final Map<String, dynamic> _log;
  @override
  Map<String, dynamic> get log {
    if (_log is EqualUnmodifiableMapView) return _log;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_log);
  }

  @override
  String toString() {
    return 'WriteLogData(level: $level, log: $log)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WriteLogDataImpl &&
            (identical(other.level, level) || other.level == level) &&
            const DeepCollectionEquality().equals(other._log, _log));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, level, const DeepCollectionEquality().hash(_log));

  /// Create a copy of WriteLogData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WriteLogDataImplCopyWith<_$WriteLogDataImpl> get copyWith =>
      __$$WriteLogDataImplCopyWithImpl<_$WriteLogDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WriteLogDataImplToJson(
      this,
    );
  }
}

abstract class _WriteLogData implements WriteLogData {
  const factory _WriteLogData(
      {required final LogLevel level,
      required final Map<String, dynamic> log}) = _$WriteLogDataImpl;

  factory _WriteLogData.fromJson(Map<String, dynamic> json) =
      _$WriteLogDataImpl.fromJson;

  @override
  LogLevel get level;
  @override
  Map<String, dynamic> get log;

  /// Create a copy of WriteLogData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WriteLogDataImplCopyWith<_$WriteLogDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

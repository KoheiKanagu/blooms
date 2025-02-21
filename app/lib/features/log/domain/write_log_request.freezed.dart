// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'write_log_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WriteLogRequest _$WriteLogRequestFromJson(Map<String, dynamic> json) {
  return _WriteLogRequest.fromJson(json);
}

/// @nodoc
mixin _$WriteLogRequest {
  List<WriteLogData> get logs => throw _privateConstructorUsedError;

  /// Serializes this WriteLogRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WriteLogRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WriteLogRequestCopyWith<WriteLogRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WriteLogRequestCopyWith<$Res> {
  factory $WriteLogRequestCopyWith(
          WriteLogRequest value, $Res Function(WriteLogRequest) then) =
      _$WriteLogRequestCopyWithImpl<$Res, WriteLogRequest>;
  @useResult
  $Res call({List<WriteLogData> logs});
}

/// @nodoc
class _$WriteLogRequestCopyWithImpl<$Res, $Val extends WriteLogRequest>
    implements $WriteLogRequestCopyWith<$Res> {
  _$WriteLogRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WriteLogRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logs = null,
  }) {
    return _then(_value.copyWith(
      logs: null == logs
          ? _value.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<WriteLogData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WriteLogRequestImplCopyWith<$Res>
    implements $WriteLogRequestCopyWith<$Res> {
  factory _$$WriteLogRequestImplCopyWith(_$WriteLogRequestImpl value,
          $Res Function(_$WriteLogRequestImpl) then) =
      __$$WriteLogRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<WriteLogData> logs});
}

/// @nodoc
class __$$WriteLogRequestImplCopyWithImpl<$Res>
    extends _$WriteLogRequestCopyWithImpl<$Res, _$WriteLogRequestImpl>
    implements _$$WriteLogRequestImplCopyWith<$Res> {
  __$$WriteLogRequestImplCopyWithImpl(
      _$WriteLogRequestImpl _value, $Res Function(_$WriteLogRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of WriteLogRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logs = null,
  }) {
    return _then(_$WriteLogRequestImpl(
      logs: null == logs
          ? _value._logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<WriteLogData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WriteLogRequestImpl implements _WriteLogRequest {
  const _$WriteLogRequestImpl({required final List<WriteLogData> logs})
      : _logs = logs;

  factory _$WriteLogRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$WriteLogRequestImplFromJson(json);

  final List<WriteLogData> _logs;
  @override
  List<WriteLogData> get logs {
    if (_logs is EqualUnmodifiableListView) return _logs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_logs);
  }

  @override
  String toString() {
    return 'WriteLogRequest(logs: $logs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WriteLogRequestImpl &&
            const DeepCollectionEquality().equals(other._logs, _logs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_logs));

  /// Create a copy of WriteLogRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WriteLogRequestImplCopyWith<_$WriteLogRequestImpl> get copyWith =>
      __$$WriteLogRequestImplCopyWithImpl<_$WriteLogRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WriteLogRequestImplToJson(
      this,
    );
  }
}

abstract class _WriteLogRequest implements WriteLogRequest {
  const factory _WriteLogRequest({required final List<WriteLogData> logs}) =
      _$WriteLogRequestImpl;

  factory _WriteLogRequest.fromJson(Map<String, dynamic> json) =
      _$WriteLogRequestImpl.fromJson;

  @override
  List<WriteLogData> get logs;

  /// Create a copy of WriteLogRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WriteLogRequestImplCopyWith<_$WriteLogRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

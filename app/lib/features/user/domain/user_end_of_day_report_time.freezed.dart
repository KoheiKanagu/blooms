// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_end_of_day_report_time.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserEndOfDayReportTime _$UserEndOfDayReportTimeFromJson(
    Map<String, dynamic> json) {
  return _UserEndOfDayReportTime.fromJson(json);
}

/// @nodoc
mixin _$UserEndOfDayReportTime {
  int get hour => throw _privateConstructorUsedError;
  int get minute => throw _privateConstructorUsedError;

  /// Serializes this UserEndOfDayReportTime to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserEndOfDayReportTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserEndOfDayReportTimeCopyWith<UserEndOfDayReportTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEndOfDayReportTimeCopyWith<$Res> {
  factory $UserEndOfDayReportTimeCopyWith(UserEndOfDayReportTime value,
          $Res Function(UserEndOfDayReportTime) then) =
      _$UserEndOfDayReportTimeCopyWithImpl<$Res, UserEndOfDayReportTime>;
  @useResult
  $Res call({int hour, int minute});
}

/// @nodoc
class _$UserEndOfDayReportTimeCopyWithImpl<$Res,
        $Val extends UserEndOfDayReportTime>
    implements $UserEndOfDayReportTimeCopyWith<$Res> {
  _$UserEndOfDayReportTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserEndOfDayReportTime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? minute = null,
  }) {
    return _then(_value.copyWith(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserEndOfDayReportTimeImplCopyWith<$Res>
    implements $UserEndOfDayReportTimeCopyWith<$Res> {
  factory _$$UserEndOfDayReportTimeImplCopyWith(
          _$UserEndOfDayReportTimeImpl value,
          $Res Function(_$UserEndOfDayReportTimeImpl) then) =
      __$$UserEndOfDayReportTimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int hour, int minute});
}

/// @nodoc
class __$$UserEndOfDayReportTimeImplCopyWithImpl<$Res>
    extends _$UserEndOfDayReportTimeCopyWithImpl<$Res,
        _$UserEndOfDayReportTimeImpl>
    implements _$$UserEndOfDayReportTimeImplCopyWith<$Res> {
  __$$UserEndOfDayReportTimeImplCopyWithImpl(
      _$UserEndOfDayReportTimeImpl _value,
      $Res Function(_$UserEndOfDayReportTimeImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEndOfDayReportTime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? minute = null,
  }) {
    return _then(_$UserEndOfDayReportTimeImpl(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserEndOfDayReportTimeImpl implements _UserEndOfDayReportTime {
  const _$UserEndOfDayReportTimeImpl(
      {required this.hour, required this.minute});

  factory _$UserEndOfDayReportTimeImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserEndOfDayReportTimeImplFromJson(json);

  @override
  final int hour;
  @override
  final int minute;

  @override
  String toString() {
    return 'UserEndOfDayReportTime(hour: $hour, minute: $minute)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEndOfDayReportTimeImpl &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hour, minute);

  /// Create a copy of UserEndOfDayReportTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEndOfDayReportTimeImplCopyWith<_$UserEndOfDayReportTimeImpl>
      get copyWith => __$$UserEndOfDayReportTimeImplCopyWithImpl<
          _$UserEndOfDayReportTimeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserEndOfDayReportTimeImplToJson(
      this,
    );
  }
}

abstract class _UserEndOfDayReportTime implements UserEndOfDayReportTime {
  const factory _UserEndOfDayReportTime(
      {required final int hour,
      required final int minute}) = _$UserEndOfDayReportTimeImpl;

  factory _UserEndOfDayReportTime.fromJson(Map<String, dynamic> json) =
      _$UserEndOfDayReportTimeImpl.fromJson;

  @override
  int get hour;
  @override
  int get minute;

  /// Create a copy of UserEndOfDayReportTime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserEndOfDayReportTimeImplCopyWith<_$UserEndOfDayReportTimeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

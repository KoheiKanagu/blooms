// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_daily_highlight_time.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDailyHighlightTime _$UserDailyHighlightTimeFromJson(
    Map<String, dynamic> json) {
  return _UserDailyHighlightTime.fromJson(json);
}

/// @nodoc
mixin _$UserDailyHighlightTime {
  int get hour => throw _privateConstructorUsedError;
  int get minute => throw _privateConstructorUsedError;

  /// Serializes this UserDailyHighlightTime to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDailyHighlightTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDailyHighlightTimeCopyWith<UserDailyHighlightTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDailyHighlightTimeCopyWith<$Res> {
  factory $UserDailyHighlightTimeCopyWith(UserDailyHighlightTime value,
          $Res Function(UserDailyHighlightTime) then) =
      _$UserDailyHighlightTimeCopyWithImpl<$Res, UserDailyHighlightTime>;
  @useResult
  $Res call({int hour, int minute});
}

/// @nodoc
class _$UserDailyHighlightTimeCopyWithImpl<$Res,
        $Val extends UserDailyHighlightTime>
    implements $UserDailyHighlightTimeCopyWith<$Res> {
  _$UserDailyHighlightTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDailyHighlightTime
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
abstract class _$$UserDailyHighlightTimeImplCopyWith<$Res>
    implements $UserDailyHighlightTimeCopyWith<$Res> {
  factory _$$UserDailyHighlightTimeImplCopyWith(
          _$UserDailyHighlightTimeImpl value,
          $Res Function(_$UserDailyHighlightTimeImpl) then) =
      __$$UserDailyHighlightTimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int hour, int minute});
}

/// @nodoc
class __$$UserDailyHighlightTimeImplCopyWithImpl<$Res>
    extends _$UserDailyHighlightTimeCopyWithImpl<$Res,
        _$UserDailyHighlightTimeImpl>
    implements _$$UserDailyHighlightTimeImplCopyWith<$Res> {
  __$$UserDailyHighlightTimeImplCopyWithImpl(
      _$UserDailyHighlightTimeImpl _value,
      $Res Function(_$UserDailyHighlightTimeImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDailyHighlightTime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? minute = null,
  }) {
    return _then(_$UserDailyHighlightTimeImpl(
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
class _$UserDailyHighlightTimeImpl implements _UserDailyHighlightTime {
  const _$UserDailyHighlightTimeImpl(
      {required this.hour, required this.minute});

  factory _$UserDailyHighlightTimeImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDailyHighlightTimeImplFromJson(json);

  @override
  final int hour;
  @override
  final int minute;

  @override
  String toString() {
    return 'UserDailyHighlightTime(hour: $hour, minute: $minute)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDailyHighlightTimeImpl &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hour, minute);

  /// Create a copy of UserDailyHighlightTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDailyHighlightTimeImplCopyWith<_$UserDailyHighlightTimeImpl>
      get copyWith => __$$UserDailyHighlightTimeImplCopyWithImpl<
          _$UserDailyHighlightTimeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDailyHighlightTimeImplToJson(
      this,
    );
  }
}

abstract class _UserDailyHighlightTime implements UserDailyHighlightTime {
  const factory _UserDailyHighlightTime(
      {required final int hour,
      required final int minute}) = _$UserDailyHighlightTimeImpl;

  factory _UserDailyHighlightTime.fromJson(Map<String, dynamic> json) =
      _$UserDailyHighlightTimeImpl.fromJson;

  @override
  int get hour;
  @override
  int get minute;

  /// Create a copy of UserDailyHighlightTime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDailyHighlightTimeImplCopyWith<_$UserDailyHighlightTimeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

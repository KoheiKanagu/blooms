// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_go_router_listenable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyGoRouterListenable {
  bool get signedIn => throw _privateConstructorUsedError;
  AsyncValue<void>? get appStartupState => throw _privateConstructorUsedError;

  /// Create a copy of MyGoRouterListenable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyGoRouterListenableCopyWith<MyGoRouterListenable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyGoRouterListenableCopyWith<$Res> {
  factory $MyGoRouterListenableCopyWith(MyGoRouterListenable value,
          $Res Function(MyGoRouterListenable) then) =
      _$MyGoRouterListenableCopyWithImpl<$Res, MyGoRouterListenable>;
  @useResult
  $Res call({bool signedIn, AsyncValue<void>? appStartupState});
}

/// @nodoc
class _$MyGoRouterListenableCopyWithImpl<$Res,
        $Val extends MyGoRouterListenable>
    implements $MyGoRouterListenableCopyWith<$Res> {
  _$MyGoRouterListenableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyGoRouterListenable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signedIn = null,
    Object? appStartupState = freezed,
  }) {
    return _then(_value.copyWith(
      signedIn: null == signedIn
          ? _value.signedIn
          : signedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      appStartupState: freezed == appStartupState
          ? _value.appStartupState
          : appStartupState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<void>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyGoRouterListenableImplCopyWith<$Res>
    implements $MyGoRouterListenableCopyWith<$Res> {
  factory _$$MyGoRouterListenableImplCopyWith(_$MyGoRouterListenableImpl value,
          $Res Function(_$MyGoRouterListenableImpl) then) =
      __$$MyGoRouterListenableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool signedIn, AsyncValue<void>? appStartupState});
}

/// @nodoc
class __$$MyGoRouterListenableImplCopyWithImpl<$Res>
    extends _$MyGoRouterListenableCopyWithImpl<$Res, _$MyGoRouterListenableImpl>
    implements _$$MyGoRouterListenableImplCopyWith<$Res> {
  __$$MyGoRouterListenableImplCopyWithImpl(_$MyGoRouterListenableImpl _value,
      $Res Function(_$MyGoRouterListenableImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyGoRouterListenable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signedIn = null,
    Object? appStartupState = freezed,
  }) {
    return _then(_$MyGoRouterListenableImpl(
      signedIn: null == signedIn
          ? _value.signedIn
          : signedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      appStartupState: freezed == appStartupState
          ? _value.appStartupState
          : appStartupState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<void>?,
    ));
  }
}

/// @nodoc

class _$MyGoRouterListenableImpl
    with DiagnosticableTreeMixin
    implements _MyGoRouterListenable {
  const _$MyGoRouterListenableImpl(
      {this.signedIn = false, this.appStartupState});

  @override
  @JsonKey()
  final bool signedIn;
  @override
  final AsyncValue<void>? appStartupState;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyGoRouterListenable(signedIn: $signedIn, appStartupState: $appStartupState)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyGoRouterListenable'))
      ..add(DiagnosticsProperty('signedIn', signedIn))
      ..add(DiagnosticsProperty('appStartupState', appStartupState));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyGoRouterListenableImpl &&
            (identical(other.signedIn, signedIn) ||
                other.signedIn == signedIn) &&
            (identical(other.appStartupState, appStartupState) ||
                other.appStartupState == appStartupState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signedIn, appStartupState);

  /// Create a copy of MyGoRouterListenable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyGoRouterListenableImplCopyWith<_$MyGoRouterListenableImpl>
      get copyWith =>
          __$$MyGoRouterListenableImplCopyWithImpl<_$MyGoRouterListenableImpl>(
              this, _$identity);
}

abstract class _MyGoRouterListenable implements MyGoRouterListenable {
  const factory _MyGoRouterListenable(
      {final bool signedIn,
      final AsyncValue<void>? appStartupState}) = _$MyGoRouterListenableImpl;

  @override
  bool get signedIn;
  @override
  AsyncValue<void>? get appStartupState;

  /// Create a copy of MyGoRouterListenable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyGoRouterListenableImplCopyWith<_$MyGoRouterListenableImpl>
      get copyWith => throw _privateConstructorUsedError;
}

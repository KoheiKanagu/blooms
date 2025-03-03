// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_go_router_listenable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyGoRouterListenable implements DiagnosticableTreeMixin {

 bool get signedIn; bool get createdUserDocument; AsyncValue<void>? get appStartupState;
/// Create a copy of MyGoRouterListenable
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyGoRouterListenableCopyWith<MyGoRouterListenable> get copyWith => _$MyGoRouterListenableCopyWithImpl<MyGoRouterListenable>(this as MyGoRouterListenable, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MyGoRouterListenable'))
    ..add(DiagnosticsProperty('signedIn', signedIn))..add(DiagnosticsProperty('createdUserDocument', createdUserDocument))..add(DiagnosticsProperty('appStartupState', appStartupState));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyGoRouterListenable&&(identical(other.signedIn, signedIn) || other.signedIn == signedIn)&&(identical(other.createdUserDocument, createdUserDocument) || other.createdUserDocument == createdUserDocument)&&(identical(other.appStartupState, appStartupState) || other.appStartupState == appStartupState));
}


@override
int get hashCode => Object.hash(runtimeType,signedIn,createdUserDocument,appStartupState);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MyGoRouterListenable(signedIn: $signedIn, createdUserDocument: $createdUserDocument, appStartupState: $appStartupState)';
}


}

/// @nodoc
abstract mixin class $MyGoRouterListenableCopyWith<$Res>  {
  factory $MyGoRouterListenableCopyWith(MyGoRouterListenable value, $Res Function(MyGoRouterListenable) _then) = _$MyGoRouterListenableCopyWithImpl;
@useResult
$Res call({
 bool signedIn, bool createdUserDocument, AsyncValue<void>? appStartupState
});




}
/// @nodoc
class _$MyGoRouterListenableCopyWithImpl<$Res>
    implements $MyGoRouterListenableCopyWith<$Res> {
  _$MyGoRouterListenableCopyWithImpl(this._self, this._then);

  final MyGoRouterListenable _self;
  final $Res Function(MyGoRouterListenable) _then;

/// Create a copy of MyGoRouterListenable
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? signedIn = null,Object? createdUserDocument = null,Object? appStartupState = freezed,}) {
  return _then(_self.copyWith(
signedIn: null == signedIn ? _self.signedIn : signedIn // ignore: cast_nullable_to_non_nullable
as bool,createdUserDocument: null == createdUserDocument ? _self.createdUserDocument : createdUserDocument // ignore: cast_nullable_to_non_nullable
as bool,appStartupState: freezed == appStartupState ? _self.appStartupState : appStartupState // ignore: cast_nullable_to_non_nullable
as AsyncValue<void>?,
  ));
}

}


/// @nodoc


class _MyGoRouterListenable with DiagnosticableTreeMixin implements MyGoRouterListenable {
  const _MyGoRouterListenable({this.signedIn = false, this.createdUserDocument = false, this.appStartupState});
  

@override@JsonKey() final  bool signedIn;
@override@JsonKey() final  bool createdUserDocument;
@override final  AsyncValue<void>? appStartupState;

/// Create a copy of MyGoRouterListenable
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyGoRouterListenableCopyWith<_MyGoRouterListenable> get copyWith => __$MyGoRouterListenableCopyWithImpl<_MyGoRouterListenable>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MyGoRouterListenable'))
    ..add(DiagnosticsProperty('signedIn', signedIn))..add(DiagnosticsProperty('createdUserDocument', createdUserDocument))..add(DiagnosticsProperty('appStartupState', appStartupState));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyGoRouterListenable&&(identical(other.signedIn, signedIn) || other.signedIn == signedIn)&&(identical(other.createdUserDocument, createdUserDocument) || other.createdUserDocument == createdUserDocument)&&(identical(other.appStartupState, appStartupState) || other.appStartupState == appStartupState));
}


@override
int get hashCode => Object.hash(runtimeType,signedIn,createdUserDocument,appStartupState);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MyGoRouterListenable(signedIn: $signedIn, createdUserDocument: $createdUserDocument, appStartupState: $appStartupState)';
}


}

/// @nodoc
abstract mixin class _$MyGoRouterListenableCopyWith<$Res> implements $MyGoRouterListenableCopyWith<$Res> {
  factory _$MyGoRouterListenableCopyWith(_MyGoRouterListenable value, $Res Function(_MyGoRouterListenable) _then) = __$MyGoRouterListenableCopyWithImpl;
@override @useResult
$Res call({
 bool signedIn, bool createdUserDocument, AsyncValue<void>? appStartupState
});




}
/// @nodoc
class __$MyGoRouterListenableCopyWithImpl<$Res>
    implements _$MyGoRouterListenableCopyWith<$Res> {
  __$MyGoRouterListenableCopyWithImpl(this._self, this._then);

  final _MyGoRouterListenable _self;
  final $Res Function(_MyGoRouterListenable) _then;

/// Create a copy of MyGoRouterListenable
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? signedIn = null,Object? createdUserDocument = null,Object? appStartupState = freezed,}) {
  return _then(_MyGoRouterListenable(
signedIn: null == signedIn ? _self.signedIn : signedIn // ignore: cast_nullable_to_non_nullable
as bool,createdUserDocument: null == createdUserDocument ? _self.createdUserDocument : createdUserDocument // ignore: cast_nullable_to_non_nullable
as bool,appStartupState: freezed == appStartupState ? _self.appStartupState : appStartupState // ignore: cast_nullable_to_non_nullable
as AsyncValue<void>?,
  ));
}


}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'condition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Condition {

/// 対象者のUID
 String get subjectUid;/// contentの作成者の種類
 ConditionCreatorType get creatorType;/// 内容
 ConditionContent get content;/// ISO8601形式の作成日時
 String? get createdAtIso8601;@TimestampConverter() Timestamp? get createdAt;@TimestampConverter() Timestamp? get updatedAt;@TimestampConverter() Timestamp? get deletedAt;
/// Create a copy of Condition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConditionCopyWith<Condition> get copyWith => _$ConditionCopyWithImpl<Condition>(this as Condition, _$identity);

  /// Serializes this Condition to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Condition&&(identical(other.subjectUid, subjectUid) || other.subjectUid == subjectUid)&&(identical(other.creatorType, creatorType) || other.creatorType == creatorType)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAtIso8601, createdAtIso8601) || other.createdAtIso8601 == createdAtIso8601)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subjectUid,creatorType,content,createdAtIso8601,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'Condition(subjectUid: $subjectUid, creatorType: $creatorType, content: $content, createdAtIso8601: $createdAtIso8601, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $ConditionCopyWith<$Res>  {
  factory $ConditionCopyWith(Condition value, $Res Function(Condition) _then) = _$ConditionCopyWithImpl;
@useResult
$Res call({
 String subjectUid, ConditionCreatorType creatorType, ConditionContent content, String? createdAtIso8601,@TimestampConverter() Timestamp? createdAt,@TimestampConverter() Timestamp? updatedAt,@TimestampConverter() Timestamp? deletedAt
});


$ConditionContentCopyWith<$Res> get content;

}
/// @nodoc
class _$ConditionCopyWithImpl<$Res>
    implements $ConditionCopyWith<$Res> {
  _$ConditionCopyWithImpl(this._self, this._then);

  final Condition _self;
  final $Res Function(Condition) _then;

/// Create a copy of Condition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subjectUid = null,Object? creatorType = null,Object? content = null,Object? createdAtIso8601 = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
subjectUid: null == subjectUid ? _self.subjectUid : subjectUid // ignore: cast_nullable_to_non_nullable
as String,creatorType: null == creatorType ? _self.creatorType : creatorType // ignore: cast_nullable_to_non_nullable
as ConditionCreatorType,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as ConditionContent,createdAtIso8601: freezed == createdAtIso8601 ? _self.createdAtIso8601 : createdAtIso8601 // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,
  ));
}
/// Create a copy of Condition
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConditionContentCopyWith<$Res> get content {
  
  return $ConditionContentCopyWith<$Res>(_self.content, (value) {
    return _then(_self.copyWith(content: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Condition implements Condition {
  const _Condition({required this.subjectUid, required this.creatorType, required this.content, this.createdAtIso8601, @TimestampConverter() this.createdAt, @TimestampConverter() this.updatedAt, @TimestampConverter() this.deletedAt});
  factory _Condition.fromJson(Map<String, dynamic> json) => _$ConditionFromJson(json);

/// 対象者のUID
@override final  String subjectUid;
/// contentの作成者の種類
@override final  ConditionCreatorType creatorType;
/// 内容
@override final  ConditionContent content;
/// ISO8601形式の作成日時
@override final  String? createdAtIso8601;
@override@TimestampConverter() final  Timestamp? createdAt;
@override@TimestampConverter() final  Timestamp? updatedAt;
@override@TimestampConverter() final  Timestamp? deletedAt;

/// Create a copy of Condition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConditionCopyWith<_Condition> get copyWith => __$ConditionCopyWithImpl<_Condition>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConditionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Condition&&(identical(other.subjectUid, subjectUid) || other.subjectUid == subjectUid)&&(identical(other.creatorType, creatorType) || other.creatorType == creatorType)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAtIso8601, createdAtIso8601) || other.createdAtIso8601 == createdAtIso8601)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subjectUid,creatorType,content,createdAtIso8601,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'Condition(subjectUid: $subjectUid, creatorType: $creatorType, content: $content, createdAtIso8601: $createdAtIso8601, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$ConditionCopyWith<$Res> implements $ConditionCopyWith<$Res> {
  factory _$ConditionCopyWith(_Condition value, $Res Function(_Condition) _then) = __$ConditionCopyWithImpl;
@override @useResult
$Res call({
 String subjectUid, ConditionCreatorType creatorType, ConditionContent content, String? createdAtIso8601,@TimestampConverter() Timestamp? createdAt,@TimestampConverter() Timestamp? updatedAt,@TimestampConverter() Timestamp? deletedAt
});


@override $ConditionContentCopyWith<$Res> get content;

}
/// @nodoc
class __$ConditionCopyWithImpl<$Res>
    implements _$ConditionCopyWith<$Res> {
  __$ConditionCopyWithImpl(this._self, this._then);

  final _Condition _self;
  final $Res Function(_Condition) _then;

/// Create a copy of Condition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subjectUid = null,Object? creatorType = null,Object? content = null,Object? createdAtIso8601 = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_Condition(
subjectUid: null == subjectUid ? _self.subjectUid : subjectUid // ignore: cast_nullable_to_non_nullable
as String,creatorType: null == creatorType ? _self.creatorType : creatorType // ignore: cast_nullable_to_non_nullable
as ConditionCreatorType,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as ConditionContent,createdAtIso8601: freezed == createdAtIso8601 ? _self.createdAtIso8601 : createdAtIso8601 // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,
  ));
}

/// Create a copy of Condition
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConditionContentCopyWith<$Res> get content {
  
  return $ConditionContentCopyWith<$Res>(_self.content, (value) {
    return _then(_self.copyWith(content: value));
  });
}
}

// dart format on

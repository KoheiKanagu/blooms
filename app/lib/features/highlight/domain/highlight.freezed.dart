// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'highlight.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Highlight {

/// ハイライトの対象者のUID
 String get subjectUid;/// 内容
 HighlightContent get content;@TimestampConverter() Timestamp? get createdAt;@TimestampConverter() Timestamp? get updatedAt;@TimestampConverter() Timestamp? get deletedAt;
/// Create a copy of Highlight
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HighlightCopyWith<Highlight> get copyWith => _$HighlightCopyWithImpl<Highlight>(this as Highlight, _$identity);

  /// Serializes this Highlight to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Highlight&&(identical(other.subjectUid, subjectUid) || other.subjectUid == subjectUid)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subjectUid,content,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'Highlight(subjectUid: $subjectUid, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $HighlightCopyWith<$Res>  {
  factory $HighlightCopyWith(Highlight value, $Res Function(Highlight) _then) = _$HighlightCopyWithImpl;
@useResult
$Res call({
 String subjectUid, HighlightContent content,@TimestampConverter() Timestamp? createdAt,@TimestampConverter() Timestamp? updatedAt,@TimestampConverter() Timestamp? deletedAt
});


$HighlightContentCopyWith<$Res> get content;

}
/// @nodoc
class _$HighlightCopyWithImpl<$Res>
    implements $HighlightCopyWith<$Res> {
  _$HighlightCopyWithImpl(this._self, this._then);

  final Highlight _self;
  final $Res Function(Highlight) _then;

/// Create a copy of Highlight
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subjectUid = null,Object? content = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
subjectUid: null == subjectUid ? _self.subjectUid : subjectUid // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as HighlightContent,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,
  ));
}
/// Create a copy of Highlight
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HighlightContentCopyWith<$Res> get content {
  
  return $HighlightContentCopyWith<$Res>(_self.content, (value) {
    return _then(_self.copyWith(content: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Highlight extends Highlight {
  const _Highlight({required this.subjectUid, required this.content, @TimestampConverter() this.createdAt, @TimestampConverter() this.updatedAt, @TimestampConverter() this.deletedAt}): super._();
  factory _Highlight.fromJson(Map<String, dynamic> json) => _$HighlightFromJson(json);

/// ハイライトの対象者のUID
@override final  String subjectUid;
/// 内容
@override final  HighlightContent content;
@override@TimestampConverter() final  Timestamp? createdAt;
@override@TimestampConverter() final  Timestamp? updatedAt;
@override@TimestampConverter() final  Timestamp? deletedAt;

/// Create a copy of Highlight
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HighlightCopyWith<_Highlight> get copyWith => __$HighlightCopyWithImpl<_Highlight>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HighlightToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Highlight&&(identical(other.subjectUid, subjectUid) || other.subjectUid == subjectUid)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subjectUid,content,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'Highlight(subjectUid: $subjectUid, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$HighlightCopyWith<$Res> implements $HighlightCopyWith<$Res> {
  factory _$HighlightCopyWith(_Highlight value, $Res Function(_Highlight) _then) = __$HighlightCopyWithImpl;
@override @useResult
$Res call({
 String subjectUid, HighlightContent content,@TimestampConverter() Timestamp? createdAt,@TimestampConverter() Timestamp? updatedAt,@TimestampConverter() Timestamp? deletedAt
});


@override $HighlightContentCopyWith<$Res> get content;

}
/// @nodoc
class __$HighlightCopyWithImpl<$Res>
    implements _$HighlightCopyWith<$Res> {
  __$HighlightCopyWithImpl(this._self, this._then);

  final _Highlight _self;
  final $Res Function(_Highlight) _then;

/// Create a copy of Highlight
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subjectUid = null,Object? content = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_Highlight(
subjectUid: null == subjectUid ? _self.subjectUid : subjectUid // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as HighlightContent,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,
  ));
}

/// Create a copy of Highlight
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HighlightContentCopyWith<$Res> get content {
  
  return $HighlightContentCopyWith<$Res>(_self.content, (value) {
    return _then(_self.copyWith(content: value));
  });
}
}

// dart format on

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'condition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Condition _$ConditionFromJson(Map<String, dynamic> json) {
  return _Condition.fromJson(json);
}

/// @nodoc
mixin _$Condition {
  /// 対象者のUID
  String get subjectUid => throw _privateConstructorUsedError;

  /// contentの作成者の種類
  ConditionCreatorType get creatorType => throw _privateConstructorUsedError;

  /// 内容
  ConditionContent get content => throw _privateConstructorUsedError;

  /// ISO8601形式の作成日時
  String get createdAtIso8601 => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get updatedAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this Condition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Condition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConditionCopyWith<Condition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConditionCopyWith<$Res> {
  factory $ConditionCopyWith(Condition value, $Res Function(Condition) then) =
      _$ConditionCopyWithImpl<$Res, Condition>;
  @useResult
  $Res call(
      {String subjectUid,
      ConditionCreatorType creatorType,
      ConditionContent content,
      String createdAtIso8601,
      @TimestampConverter() Timestamp? createdAt,
      @TimestampConverter() Timestamp? updatedAt,
      @TimestampConverter() Timestamp? deletedAt});

  $ConditionContentCopyWith<$Res> get content;
}

/// @nodoc
class _$ConditionCopyWithImpl<$Res, $Val extends Condition>
    implements $ConditionCopyWith<$Res> {
  _$ConditionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Condition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectUid = null,
    Object? creatorType = null,
    Object? content = null,
    Object? createdAtIso8601 = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      subjectUid: null == subjectUid
          ? _value.subjectUid
          : subjectUid // ignore: cast_nullable_to_non_nullable
              as String,
      creatorType: null == creatorType
          ? _value.creatorType
          : creatorType // ignore: cast_nullable_to_non_nullable
              as ConditionCreatorType,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as ConditionContent,
      createdAtIso8601: null == createdAtIso8601
          ? _value.createdAtIso8601
          : createdAtIso8601 // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ) as $Val);
  }

  /// Create a copy of Condition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConditionContentCopyWith<$Res> get content {
    return $ConditionContentCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConditionImplCopyWith<$Res>
    implements $ConditionCopyWith<$Res> {
  factory _$$ConditionImplCopyWith(
          _$ConditionImpl value, $Res Function(_$ConditionImpl) then) =
      __$$ConditionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String subjectUid,
      ConditionCreatorType creatorType,
      ConditionContent content,
      String createdAtIso8601,
      @TimestampConverter() Timestamp? createdAt,
      @TimestampConverter() Timestamp? updatedAt,
      @TimestampConverter() Timestamp? deletedAt});

  @override
  $ConditionContentCopyWith<$Res> get content;
}

/// @nodoc
class __$$ConditionImplCopyWithImpl<$Res>
    extends _$ConditionCopyWithImpl<$Res, _$ConditionImpl>
    implements _$$ConditionImplCopyWith<$Res> {
  __$$ConditionImplCopyWithImpl(
      _$ConditionImpl _value, $Res Function(_$ConditionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Condition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectUid = null,
    Object? creatorType = null,
    Object? content = null,
    Object? createdAtIso8601 = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_$ConditionImpl(
      subjectUid: null == subjectUid
          ? _value.subjectUid
          : subjectUid // ignore: cast_nullable_to_non_nullable
              as String,
      creatorType: null == creatorType
          ? _value.creatorType
          : creatorType // ignore: cast_nullable_to_non_nullable
              as ConditionCreatorType,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as ConditionContent,
      createdAtIso8601: null == createdAtIso8601
          ? _value.createdAtIso8601
          : createdAtIso8601 // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConditionImpl implements _Condition {
  const _$ConditionImpl(
      {required this.subjectUid,
      required this.creatorType,
      required this.content,
      required this.createdAtIso8601,
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt,
      @TimestampConverter() this.deletedAt});

  factory _$ConditionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConditionImplFromJson(json);

  /// 対象者のUID
  @override
  final String subjectUid;

  /// contentの作成者の種類
  @override
  final ConditionCreatorType creatorType;

  /// 内容
  @override
  final ConditionContent content;

  /// ISO8601形式の作成日時
  @override
  final String createdAtIso8601;
  @override
  @TimestampConverter()
  final Timestamp? createdAt;
  @override
  @TimestampConverter()
  final Timestamp? updatedAt;
  @override
  @TimestampConverter()
  final Timestamp? deletedAt;

  @override
  String toString() {
    return 'Condition(subjectUid: $subjectUid, creatorType: $creatorType, content: $content, createdAtIso8601: $createdAtIso8601, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionImpl &&
            (identical(other.subjectUid, subjectUid) ||
                other.subjectUid == subjectUid) &&
            (identical(other.creatorType, creatorType) ||
                other.creatorType == creatorType) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAtIso8601, createdAtIso8601) ||
                other.createdAtIso8601 == createdAtIso8601) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, subjectUid, creatorType, content,
      createdAtIso8601, createdAt, updatedAt, deletedAt);

  /// Create a copy of Condition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConditionImplCopyWith<_$ConditionImpl> get copyWith =>
      __$$ConditionImplCopyWithImpl<_$ConditionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionImplToJson(
      this,
    );
  }
}

abstract class _Condition implements Condition {
  const factory _Condition(
      {required final String subjectUid,
      required final ConditionCreatorType creatorType,
      required final ConditionContent content,
      required final String createdAtIso8601,
      @TimestampConverter() final Timestamp? createdAt,
      @TimestampConverter() final Timestamp? updatedAt,
      @TimestampConverter() final Timestamp? deletedAt}) = _$ConditionImpl;

  factory _Condition.fromJson(Map<String, dynamic> json) =
      _$ConditionImpl.fromJson;

  /// 対象者のUID
  @override
  String get subjectUid;

  /// contentの作成者の種類
  @override
  ConditionCreatorType get creatorType;

  /// 内容
  @override
  ConditionContent get content;

  /// ISO8601形式の作成日時
  @override
  String get createdAtIso8601;
  @override
  @TimestampConverter()
  Timestamp? get createdAt;
  @override
  @TimestampConverter()
  Timestamp? get updatedAt;
  @override
  @TimestampConverter()
  Timestamp? get deletedAt;

  /// Create a copy of Condition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConditionImplCopyWith<_$ConditionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

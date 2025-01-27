// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'highlight.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Highlight _$HighlightFromJson(Map<String, dynamic> json) {
  return _Highlight.fromJson(json);
}

/// @nodoc
mixin _$Highlight {
  /// ハイライトの種類
  HighlightType get type => throw _privateConstructorUsedError;

  /// ハイライトのスタイル
  HighlightStyle get style => throw _privateConstructorUsedError;

  /// ハイライトの対象者のUID
  String get subjectUid => throw _privateConstructorUsedError;

  /// ハイライトを作成開始する日時。この日からN日前のハイライト
  @TimestampConverterNotNull()
  Timestamp get startAt => throw _privateConstructorUsedError;

  /// 生成モデルによるハイライトの生成のプロンプトのファイルパス
  String? get prompt => throw _privateConstructorUsedError;

  /// ハイライトの内容
  HighlightContent? get content => throw _privateConstructorUsedError;

  /// 生成モデルでの処理の状態
  HighlightState get state => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get updatedAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this Highlight to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Highlight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HighlightCopyWith<Highlight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HighlightCopyWith<$Res> {
  factory $HighlightCopyWith(Highlight value, $Res Function(Highlight) then) =
      _$HighlightCopyWithImpl<$Res, Highlight>;
  @useResult
  $Res call(
      {HighlightType type,
      HighlightStyle style,
      String subjectUid,
      @TimestampConverterNotNull() Timestamp startAt,
      String? prompt,
      HighlightContent? content,
      HighlightState state,
      @TimestampConverter() Timestamp? createdAt,
      @TimestampConverter() Timestamp? updatedAt,
      @TimestampConverter() Timestamp? deletedAt});

  $HighlightContentCopyWith<$Res>? get content;
}

/// @nodoc
class _$HighlightCopyWithImpl<$Res, $Val extends Highlight>
    implements $HighlightCopyWith<$Res> {
  _$HighlightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Highlight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? style = null,
    Object? subjectUid = null,
    Object? startAt = null,
    Object? prompt = freezed,
    Object? content = freezed,
    Object? state = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HighlightType,
      style: null == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as HighlightStyle,
      subjectUid: null == subjectUid
          ? _value.subjectUid
          : subjectUid // ignore: cast_nullable_to_non_nullable
              as String,
      startAt: null == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      prompt: freezed == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as HighlightContent?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as HighlightState,
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

  /// Create a copy of Highlight
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HighlightContentCopyWith<$Res>? get content {
    if (_value.content == null) {
      return null;
    }

    return $HighlightContentCopyWith<$Res>(_value.content!, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HighlightImplCopyWith<$Res>
    implements $HighlightCopyWith<$Res> {
  factory _$$HighlightImplCopyWith(
          _$HighlightImpl value, $Res Function(_$HighlightImpl) then) =
      __$$HighlightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HighlightType type,
      HighlightStyle style,
      String subjectUid,
      @TimestampConverterNotNull() Timestamp startAt,
      String? prompt,
      HighlightContent? content,
      HighlightState state,
      @TimestampConverter() Timestamp? createdAt,
      @TimestampConverter() Timestamp? updatedAt,
      @TimestampConverter() Timestamp? deletedAt});

  @override
  $HighlightContentCopyWith<$Res>? get content;
}

/// @nodoc
class __$$HighlightImplCopyWithImpl<$Res>
    extends _$HighlightCopyWithImpl<$Res, _$HighlightImpl>
    implements _$$HighlightImplCopyWith<$Res> {
  __$$HighlightImplCopyWithImpl(
      _$HighlightImpl _value, $Res Function(_$HighlightImpl) _then)
      : super(_value, _then);

  /// Create a copy of Highlight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? style = null,
    Object? subjectUid = null,
    Object? startAt = null,
    Object? prompt = freezed,
    Object? content = freezed,
    Object? state = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_$HighlightImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HighlightType,
      style: null == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as HighlightStyle,
      subjectUid: null == subjectUid
          ? _value.subjectUid
          : subjectUid // ignore: cast_nullable_to_non_nullable
              as String,
      startAt: null == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      prompt: freezed == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as HighlightContent?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as HighlightState,
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
class _$HighlightImpl extends _Highlight {
  const _$HighlightImpl(
      {required this.type,
      required this.style = HighlightStyle.forOwn,
      required this.subjectUid,
      @TimestampConverterNotNull() required this.startAt,
      this.prompt,
      this.content,
      this.state = HighlightState.pending,
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt,
      @TimestampConverter() this.deletedAt})
      : super._();

  factory _$HighlightImpl.fromJson(Map<String, dynamic> json) =>
      _$$HighlightImplFromJson(json);

  /// ハイライトの種類
  @override
  final HighlightType type;

  /// ハイライトのスタイル
  @override
  @JsonKey()
  final HighlightStyle style;

  /// ハイライトの対象者のUID
  @override
  final String subjectUid;

  /// ハイライトを作成開始する日時。この日からN日前のハイライト
  @override
  @TimestampConverterNotNull()
  final Timestamp startAt;

  /// 生成モデルによるハイライトの生成のプロンプトのファイルパス
  @override
  final String? prompt;

  /// ハイライトの内容
  @override
  final HighlightContent? content;

  /// 生成モデルでの処理の状態
  @override
  @JsonKey()
  final HighlightState state;
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
    return 'Highlight(type: $type, style: $style, subjectUid: $subjectUid, startAt: $startAt, prompt: $prompt, content: $content, state: $state, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HighlightImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.style, style) || other.style == style) &&
            (identical(other.subjectUid, subjectUid) ||
                other.subjectUid == subjectUid) &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, style, subjectUid, startAt,
      prompt, content, state, createdAt, updatedAt, deletedAt);

  /// Create a copy of Highlight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HighlightImplCopyWith<_$HighlightImpl> get copyWith =>
      __$$HighlightImplCopyWithImpl<_$HighlightImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HighlightImplToJson(
      this,
    );
  }
}

abstract class _Highlight extends Highlight {
  const factory _Highlight(
      {required final HighlightType type,
      required final HighlightStyle style,
      required final String subjectUid,
      @TimestampConverterNotNull() required final Timestamp startAt,
      final String? prompt,
      final HighlightContent? content,
      final HighlightState state,
      @TimestampConverter() final Timestamp? createdAt,
      @TimestampConverter() final Timestamp? updatedAt,
      @TimestampConverter() final Timestamp? deletedAt}) = _$HighlightImpl;
  const _Highlight._() : super._();

  factory _Highlight.fromJson(Map<String, dynamic> json) =
      _$HighlightImpl.fromJson;

  /// ハイライトの種類
  @override
  HighlightType get type;

  /// ハイライトのスタイル
  @override
  HighlightStyle get style;

  /// ハイライトの対象者のUID
  @override
  String get subjectUid;

  /// ハイライトを作成開始する日時。この日からN日前のハイライト
  @override
  @TimestampConverterNotNull()
  Timestamp get startAt;

  /// 生成モデルによるハイライトの生成のプロンプトのファイルパス
  @override
  String? get prompt;

  /// ハイライトの内容
  @override
  HighlightContent? get content;

  /// 生成モデルでの処理の状態
  @override
  HighlightState get state;
  @override
  @TimestampConverter()
  Timestamp? get createdAt;
  @override
  @TimestampConverter()
  Timestamp? get updatedAt;
  @override
  @TimestampConverter()
  Timestamp? get deletedAt;

  /// Create a copy of Highlight
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HighlightImplCopyWith<_$HighlightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

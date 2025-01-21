// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Report _$ReportFromJson(Map<String, dynamic> json) {
  return _Report.fromJson(json);
}

/// @nodoc
mixin _$Report {
  /// レポートの種類
  ReportType get type => throw _privateConstructorUsedError;

  /// レポートの対象者のUID
  String get subjectUid => throw _privateConstructorUsedError;

  /// 生成モデルによるレポートの生成のプロンプトのファイルパス
  String? get prompt => throw _privateConstructorUsedError;

  /// レポートの内容
  ReportContent? get content => throw _privateConstructorUsedError;

  /// 生成モデルでの処理の状態
  ReportState get state => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get updatedAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get deletedAt => throw _privateConstructorUsedError;

  /// レポートを作成開始する日時。この日からN日前のレポート
  @TimestampConverter()
  Timestamp? get startAt => throw _privateConstructorUsedError;

  /// Serializes this Report to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Report
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportCopyWith<Report> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportCopyWith<$Res> {
  factory $ReportCopyWith(Report value, $Res Function(Report) then) =
      _$ReportCopyWithImpl<$Res, Report>;
  @useResult
  $Res call(
      {ReportType type,
      String subjectUid,
      String? prompt,
      ReportContent? content,
      ReportState state,
      @TimestampConverter() Timestamp? createdAt,
      @TimestampConverter() Timestamp? updatedAt,
      @TimestampConverter() Timestamp? deletedAt,
      @TimestampConverter() Timestamp? startAt});

  $ReportContentCopyWith<$Res>? get content;
}

/// @nodoc
class _$ReportCopyWithImpl<$Res, $Val extends Report>
    implements $ReportCopyWith<$Res> {
  _$ReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Report
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? subjectUid = null,
    Object? prompt = freezed,
    Object? content = freezed,
    Object? state = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? startAt = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ReportType,
      subjectUid: null == subjectUid
          ? _value.subjectUid
          : subjectUid // ignore: cast_nullable_to_non_nullable
              as String,
      prompt: freezed == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as ReportContent?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ReportState,
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
      startAt: freezed == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ) as $Val);
  }

  /// Create a copy of Report
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReportContentCopyWith<$Res>? get content {
    if (_value.content == null) {
      return null;
    }

    return $ReportContentCopyWith<$Res>(_value.content!, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReportImplCopyWith<$Res> implements $ReportCopyWith<$Res> {
  factory _$$ReportImplCopyWith(
          _$ReportImpl value, $Res Function(_$ReportImpl) then) =
      __$$ReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ReportType type,
      String subjectUid,
      String? prompt,
      ReportContent? content,
      ReportState state,
      @TimestampConverter() Timestamp? createdAt,
      @TimestampConverter() Timestamp? updatedAt,
      @TimestampConverter() Timestamp? deletedAt,
      @TimestampConverter() Timestamp? startAt});

  @override
  $ReportContentCopyWith<$Res>? get content;
}

/// @nodoc
class __$$ReportImplCopyWithImpl<$Res>
    extends _$ReportCopyWithImpl<$Res, _$ReportImpl>
    implements _$$ReportImplCopyWith<$Res> {
  __$$ReportImplCopyWithImpl(
      _$ReportImpl _value, $Res Function(_$ReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of Report
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? subjectUid = null,
    Object? prompt = freezed,
    Object? content = freezed,
    Object? state = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? startAt = freezed,
  }) {
    return _then(_$ReportImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ReportType,
      subjectUid: null == subjectUid
          ? _value.subjectUid
          : subjectUid // ignore: cast_nullable_to_non_nullable
              as String,
      prompt: freezed == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as ReportContent?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ReportState,
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
      startAt: freezed == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportImpl implements _Report {
  const _$ReportImpl(
      {required this.type,
      required this.subjectUid,
      this.prompt,
      this.content,
      this.state = ReportState.pending,
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt,
      @TimestampConverter() this.deletedAt,
      @TimestampConverter() this.startAt});

  factory _$ReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportImplFromJson(json);

  /// レポートの種類
  @override
  final ReportType type;

  /// レポートの対象者のUID
  @override
  final String subjectUid;

  /// 生成モデルによるレポートの生成のプロンプトのファイルパス
  @override
  final String? prompt;

  /// レポートの内容
  @override
  final ReportContent? content;

  /// 生成モデルでの処理の状態
  @override
  @JsonKey()
  final ReportState state;
  @override
  @TimestampConverter()
  final Timestamp? createdAt;
  @override
  @TimestampConverter()
  final Timestamp? updatedAt;
  @override
  @TimestampConverter()
  final Timestamp? deletedAt;

  /// レポートを作成開始する日時。この日からN日前のレポート
  @override
  @TimestampConverter()
  final Timestamp? startAt;

  @override
  String toString() {
    return 'Report(type: $type, subjectUid: $subjectUid, prompt: $prompt, content: $content, state: $state, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, startAt: $startAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.subjectUid, subjectUid) ||
                other.subjectUid == subjectUid) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.startAt, startAt) || other.startAt == startAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, subjectUid, prompt,
      content, state, createdAt, updatedAt, deletedAt, startAt);

  /// Create a copy of Report
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportImplCopyWith<_$ReportImpl> get copyWith =>
      __$$ReportImplCopyWithImpl<_$ReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportImplToJson(
      this,
    );
  }
}

abstract class _Report implements Report {
  const factory _Report(
      {required final ReportType type,
      required final String subjectUid,
      final String? prompt,
      final ReportContent? content,
      final ReportState state,
      @TimestampConverter() final Timestamp? createdAt,
      @TimestampConverter() final Timestamp? updatedAt,
      @TimestampConverter() final Timestamp? deletedAt,
      @TimestampConverter() final Timestamp? startAt}) = _$ReportImpl;

  factory _Report.fromJson(Map<String, dynamic> json) = _$ReportImpl.fromJson;

  /// レポートの種類
  @override
  ReportType get type;

  /// レポートの対象者のUID
  @override
  String get subjectUid;

  /// 生成モデルによるレポートの生成のプロンプトのファイルパス
  @override
  String? get prompt;

  /// レポートの内容
  @override
  ReportContent? get content;

  /// 生成モデルでの処理の状態
  @override
  ReportState get state;
  @override
  @TimestampConverter()
  Timestamp? get createdAt;
  @override
  @TimestampConverter()
  Timestamp? get updatedAt;
  @override
  @TimestampConverter()
  Timestamp? get deletedAt;

  /// レポートを作成開始する日時。この日からN日前のレポート
  @override
  @TimestampConverter()
  Timestamp? get startAt;

  /// Create a copy of Report
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportImplCopyWith<_$ReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

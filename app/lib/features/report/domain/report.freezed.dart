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

  /// Geminiによるレポートの生成のプロンプトのファイルパス
  String? get prompt => throw _privateConstructorUsedError;

  /// 主観的な状態の傾向
  String? get subjectiveConditionTendency => throw _privateConstructorUsedError;

  /// 客観的な状態の傾向
  String? get objectiveConditionTendency => throw _privateConstructorUsedError;

  /// 分析結果
  String? get analysisResult => throw _privateConstructorUsedError;

  /// アドバイス
  String? get advice => throw _privateConstructorUsedError;

  /// Geminiでの処理の状態
  ReportState get state => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get updatedAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get deletedAt => throw _privateConstructorUsedError;

  /// 何日を対象にしたレポートか
  @TimestampConverter()
  Timestamp? get targetDate => throw _privateConstructorUsedError;

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
      String? subjectiveConditionTendency,
      String? objectiveConditionTendency,
      String? analysisResult,
      String? advice,
      ReportState state,
      @TimestampConverter() Timestamp? createdAt,
      @TimestampConverter() Timestamp? updatedAt,
      @TimestampConverter() Timestamp? deletedAt,
      @TimestampConverter() Timestamp? targetDate});
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
    Object? subjectiveConditionTendency = freezed,
    Object? objectiveConditionTendency = freezed,
    Object? analysisResult = freezed,
    Object? advice = freezed,
    Object? state = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? targetDate = freezed,
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
      subjectiveConditionTendency: freezed == subjectiveConditionTendency
          ? _value.subjectiveConditionTendency
          : subjectiveConditionTendency // ignore: cast_nullable_to_non_nullable
              as String?,
      objectiveConditionTendency: freezed == objectiveConditionTendency
          ? _value.objectiveConditionTendency
          : objectiveConditionTendency // ignore: cast_nullable_to_non_nullable
              as String?,
      analysisResult: freezed == analysisResult
          ? _value.analysisResult
          : analysisResult // ignore: cast_nullable_to_non_nullable
              as String?,
      advice: freezed == advice
          ? _value.advice
          : advice // ignore: cast_nullable_to_non_nullable
              as String?,
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
      targetDate: freezed == targetDate
          ? _value.targetDate
          : targetDate // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ) as $Val);
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
      String? subjectiveConditionTendency,
      String? objectiveConditionTendency,
      String? analysisResult,
      String? advice,
      ReportState state,
      @TimestampConverter() Timestamp? createdAt,
      @TimestampConverter() Timestamp? updatedAt,
      @TimestampConverter() Timestamp? deletedAt,
      @TimestampConverter() Timestamp? targetDate});
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
    Object? subjectiveConditionTendency = freezed,
    Object? objectiveConditionTendency = freezed,
    Object? analysisResult = freezed,
    Object? advice = freezed,
    Object? state = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? targetDate = freezed,
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
      subjectiveConditionTendency: freezed == subjectiveConditionTendency
          ? _value.subjectiveConditionTendency
          : subjectiveConditionTendency // ignore: cast_nullable_to_non_nullable
              as String?,
      objectiveConditionTendency: freezed == objectiveConditionTendency
          ? _value.objectiveConditionTendency
          : objectiveConditionTendency // ignore: cast_nullable_to_non_nullable
              as String?,
      analysisResult: freezed == analysisResult
          ? _value.analysisResult
          : analysisResult // ignore: cast_nullable_to_non_nullable
              as String?,
      advice: freezed == advice
          ? _value.advice
          : advice // ignore: cast_nullable_to_non_nullable
              as String?,
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
      targetDate: freezed == targetDate
          ? _value.targetDate
          : targetDate // ignore: cast_nullable_to_non_nullable
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
      this.subjectiveConditionTendency,
      this.objectiveConditionTendency,
      this.analysisResult,
      this.advice,
      this.state = ReportState.pending,
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt,
      @TimestampConverter() this.deletedAt,
      @TimestampConverter() this.targetDate});

  factory _$ReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportImplFromJson(json);

  /// レポートの種類
  @override
  final ReportType type;

  /// レポートの対象者のUID
  @override
  final String subjectUid;

  /// Geminiによるレポートの生成のプロンプトのファイルパス
  @override
  final String? prompt;

  /// 主観的な状態の傾向
  @override
  final String? subjectiveConditionTendency;

  /// 客観的な状態の傾向
  @override
  final String? objectiveConditionTendency;

  /// 分析結果
  @override
  final String? analysisResult;

  /// アドバイス
  @override
  final String? advice;

  /// Geminiでの処理の状態
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

  /// 何日を対象にしたレポートか
  @override
  @TimestampConverter()
  final Timestamp? targetDate;

  @override
  String toString() {
    return 'Report(type: $type, subjectUid: $subjectUid, prompt: $prompt, subjectiveConditionTendency: $subjectiveConditionTendency, objectiveConditionTendency: $objectiveConditionTendency, analysisResult: $analysisResult, advice: $advice, state: $state, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, targetDate: $targetDate)';
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
            (identical(other.subjectiveConditionTendency,
                    subjectiveConditionTendency) ||
                other.subjectiveConditionTendency ==
                    subjectiveConditionTendency) &&
            (identical(other.objectiveConditionTendency,
                    objectiveConditionTendency) ||
                other.objectiveConditionTendency ==
                    objectiveConditionTendency) &&
            (identical(other.analysisResult, analysisResult) ||
                other.analysisResult == analysisResult) &&
            (identical(other.advice, advice) || other.advice == advice) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.targetDate, targetDate) ||
                other.targetDate == targetDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      subjectUid,
      prompt,
      subjectiveConditionTendency,
      objectiveConditionTendency,
      analysisResult,
      advice,
      state,
      createdAt,
      updatedAt,
      deletedAt,
      targetDate);

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
      final String? subjectiveConditionTendency,
      final String? objectiveConditionTendency,
      final String? analysisResult,
      final String? advice,
      final ReportState state,
      @TimestampConverter() final Timestamp? createdAt,
      @TimestampConverter() final Timestamp? updatedAt,
      @TimestampConverter() final Timestamp? deletedAt,
      @TimestampConverter() final Timestamp? targetDate}) = _$ReportImpl;

  factory _Report.fromJson(Map<String, dynamic> json) = _$ReportImpl.fromJson;

  /// レポートの種類
  @override
  ReportType get type;

  /// レポートの対象者のUID
  @override
  String get subjectUid;

  /// Geminiによるレポートの生成のプロンプトのファイルパス
  @override
  String? get prompt;

  /// 主観的な状態の傾向
  @override
  String? get subjectiveConditionTendency;

  /// 客観的な状態の傾向
  @override
  String? get objectiveConditionTendency;

  /// 分析結果
  @override
  String? get analysisResult;

  /// アドバイス
  @override
  String? get advice;

  /// Geminiでの処理の状態
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

  /// 何日を対象にしたレポートか
  @override
  @TimestampConverter()
  Timestamp? get targetDate;

  /// Create a copy of Report
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportImplCopyWith<_$ReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReportContent _$ReportContentFromJson(Map<String, dynamic> json) {
  return _ReportContent.fromJson(json);
}

/// @nodoc
mixin _$ReportContent {
  /// 主観的な状態の傾向
  String? get subjectiveConditionTendency => throw _privateConstructorUsedError;

  /// 客観的な状態の傾向
  String? get objectiveConditionTendency => throw _privateConstructorUsedError;

  /// 分析結果
  String? get analysisResult => throw _privateConstructorUsedError;

  /// アドバイス
  String? get advice => throw _privateConstructorUsedError;

  /// Serializes this ReportContent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReportContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportContentCopyWith<ReportContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportContentCopyWith<$Res> {
  factory $ReportContentCopyWith(
          ReportContent value, $Res Function(ReportContent) then) =
      _$ReportContentCopyWithImpl<$Res, ReportContent>;
  @useResult
  $Res call(
      {String? subjectiveConditionTendency,
      String? objectiveConditionTendency,
      String? analysisResult,
      String? advice});
}

/// @nodoc
class _$ReportContentCopyWithImpl<$Res, $Val extends ReportContent>
    implements $ReportContentCopyWith<$Res> {
  _$ReportContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectiveConditionTendency = freezed,
    Object? objectiveConditionTendency = freezed,
    Object? analysisResult = freezed,
    Object? advice = freezed,
  }) {
    return _then(_value.copyWith(
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportContentImplCopyWith<$Res>
    implements $ReportContentCopyWith<$Res> {
  factory _$$ReportContentImplCopyWith(
          _$ReportContentImpl value, $Res Function(_$ReportContentImpl) then) =
      __$$ReportContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? subjectiveConditionTendency,
      String? objectiveConditionTendency,
      String? analysisResult,
      String? advice});
}

/// @nodoc
class __$$ReportContentImplCopyWithImpl<$Res>
    extends _$ReportContentCopyWithImpl<$Res, _$ReportContentImpl>
    implements _$$ReportContentImplCopyWith<$Res> {
  __$$ReportContentImplCopyWithImpl(
      _$ReportContentImpl _value, $Res Function(_$ReportContentImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectiveConditionTendency = freezed,
    Object? objectiveConditionTendency = freezed,
    Object? analysisResult = freezed,
    Object? advice = freezed,
  }) {
    return _then(_$ReportContentImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportContentImpl implements _ReportContent {
  const _$ReportContentImpl(
      {this.subjectiveConditionTendency,
      this.objectiveConditionTendency,
      this.analysisResult,
      this.advice});

  factory _$ReportContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportContentImplFromJson(json);

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

  @override
  String toString() {
    return 'ReportContent(subjectiveConditionTendency: $subjectiveConditionTendency, objectiveConditionTendency: $objectiveConditionTendency, analysisResult: $analysisResult, advice: $advice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportContentImpl &&
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
            (identical(other.advice, advice) || other.advice == advice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, subjectiveConditionTendency,
      objectiveConditionTendency, analysisResult, advice);

  /// Create a copy of ReportContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportContentImplCopyWith<_$ReportContentImpl> get copyWith =>
      __$$ReportContentImplCopyWithImpl<_$ReportContentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportContentImplToJson(
      this,
    );
  }
}

abstract class _ReportContent implements ReportContent {
  const factory _ReportContent(
      {final String? subjectiveConditionTendency,
      final String? objectiveConditionTendency,
      final String? analysisResult,
      final String? advice}) = _$ReportContentImpl;

  factory _ReportContent.fromJson(Map<String, dynamic> json) =
      _$ReportContentImpl.fromJson;

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

  /// Create a copy of ReportContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportContentImplCopyWith<_$ReportContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

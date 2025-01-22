// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'highlight_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HighlightContent _$HighlightContentFromJson(Map<String, dynamic> json) {
  return _HighlightContent.fromJson(json);
}

/// @nodoc
mixin _$HighlightContent {
  /// 主観的なデータのトレンド
  String get subjectiveTrend => throw _privateConstructorUsedError;

  /// 客観的なデータのトレンド
  String get objectiveTrend => throw _privateConstructorUsedError;

  /// 分析結果
  String get analysisResult => throw _privateConstructorUsedError;

  /// アドバイス
  String get advice => throw _privateConstructorUsedError;

  /// 分析結果の要旨
  String get abstract => throw _privateConstructorUsedError;

  /// Serializes this HighlightContent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HighlightContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HighlightContentCopyWith<HighlightContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HighlightContentCopyWith<$Res> {
  factory $HighlightContentCopyWith(
          HighlightContent value, $Res Function(HighlightContent) then) =
      _$HighlightContentCopyWithImpl<$Res, HighlightContent>;
  @useResult
  $Res call(
      {String subjectiveTrend,
      String objectiveTrend,
      String analysisResult,
      String advice,
      String abstract});
}

/// @nodoc
class _$HighlightContentCopyWithImpl<$Res, $Val extends HighlightContent>
    implements $HighlightContentCopyWith<$Res> {
  _$HighlightContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HighlightContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectiveTrend = null,
    Object? objectiveTrend = null,
    Object? analysisResult = null,
    Object? advice = null,
    Object? abstract = null,
  }) {
    return _then(_value.copyWith(
      subjectiveTrend: null == subjectiveTrend
          ? _value.subjectiveTrend
          : subjectiveTrend // ignore: cast_nullable_to_non_nullable
              as String,
      objectiveTrend: null == objectiveTrend
          ? _value.objectiveTrend
          : objectiveTrend // ignore: cast_nullable_to_non_nullable
              as String,
      analysisResult: null == analysisResult
          ? _value.analysisResult
          : analysisResult // ignore: cast_nullable_to_non_nullable
              as String,
      advice: null == advice
          ? _value.advice
          : advice // ignore: cast_nullable_to_non_nullable
              as String,
      abstract: null == abstract
          ? _value.abstract
          : abstract // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HighlightContentImplCopyWith<$Res>
    implements $HighlightContentCopyWith<$Res> {
  factory _$$HighlightContentImplCopyWith(_$HighlightContentImpl value,
          $Res Function(_$HighlightContentImpl) then) =
      __$$HighlightContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String subjectiveTrend,
      String objectiveTrend,
      String analysisResult,
      String advice,
      String abstract});
}

/// @nodoc
class __$$HighlightContentImplCopyWithImpl<$Res>
    extends _$HighlightContentCopyWithImpl<$Res, _$HighlightContentImpl>
    implements _$$HighlightContentImplCopyWith<$Res> {
  __$$HighlightContentImplCopyWithImpl(_$HighlightContentImpl _value,
      $Res Function(_$HighlightContentImpl) _then)
      : super(_value, _then);

  /// Create a copy of HighlightContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectiveTrend = null,
    Object? objectiveTrend = null,
    Object? analysisResult = null,
    Object? advice = null,
    Object? abstract = null,
  }) {
    return _then(_$HighlightContentImpl(
      subjectiveTrend: null == subjectiveTrend
          ? _value.subjectiveTrend
          : subjectiveTrend // ignore: cast_nullable_to_non_nullable
              as String,
      objectiveTrend: null == objectiveTrend
          ? _value.objectiveTrend
          : objectiveTrend // ignore: cast_nullable_to_non_nullable
              as String,
      analysisResult: null == analysisResult
          ? _value.analysisResult
          : analysisResult // ignore: cast_nullable_to_non_nullable
              as String,
      advice: null == advice
          ? _value.advice
          : advice // ignore: cast_nullable_to_non_nullable
              as String,
      abstract: null == abstract
          ? _value.abstract
          : abstract // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HighlightContentImpl implements _HighlightContent {
  const _$HighlightContentImpl(
      {required this.subjectiveTrend,
      required this.objectiveTrend,
      required this.analysisResult,
      required this.advice,
      required this.abstract});

  factory _$HighlightContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$HighlightContentImplFromJson(json);

  /// 主観的なデータのトレンド
  @override
  final String subjectiveTrend;

  /// 客観的なデータのトレンド
  @override
  final String objectiveTrend;

  /// 分析結果
  @override
  final String analysisResult;

  /// アドバイス
  @override
  final String advice;

  /// 分析結果の要旨
  @override
  final String abstract;

  @override
  String toString() {
    return 'HighlightContent(subjectiveTrend: $subjectiveTrend, objectiveTrend: $objectiveTrend, analysisResult: $analysisResult, advice: $advice, abstract: $abstract)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HighlightContentImpl &&
            (identical(other.subjectiveTrend, subjectiveTrend) ||
                other.subjectiveTrend == subjectiveTrend) &&
            (identical(other.objectiveTrend, objectiveTrend) ||
                other.objectiveTrend == objectiveTrend) &&
            (identical(other.analysisResult, analysisResult) ||
                other.analysisResult == analysisResult) &&
            (identical(other.advice, advice) || other.advice == advice) &&
            (identical(other.abstract, abstract) ||
                other.abstract == abstract));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, subjectiveTrend, objectiveTrend,
      analysisResult, advice, abstract);

  /// Create a copy of HighlightContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HighlightContentImplCopyWith<_$HighlightContentImpl> get copyWith =>
      __$$HighlightContentImplCopyWithImpl<_$HighlightContentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HighlightContentImplToJson(
      this,
    );
  }
}

abstract class _HighlightContent implements HighlightContent {
  const factory _HighlightContent(
      {required final String subjectiveTrend,
      required final String objectiveTrend,
      required final String analysisResult,
      required final String advice,
      required final String abstract}) = _$HighlightContentImpl;

  factory _HighlightContent.fromJson(Map<String, dynamic> json) =
      _$HighlightContentImpl.fromJson;

  /// 主観的なデータのトレンド
  @override
  String get subjectiveTrend;

  /// 客観的なデータのトレンド
  @override
  String get objectiveTrend;

  /// 分析結果
  @override
  String get analysisResult;

  /// アドバイス
  @override
  String get advice;

  /// 分析結果の要旨
  @override
  String get abstract;

  /// Create a copy of HighlightContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HighlightContentImplCopyWith<_$HighlightContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

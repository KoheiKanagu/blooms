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
  switch (json['style']) {
    case 'private':
      return HighlightContentPrivate.fromJson(json);
    case 'professional':
      return HighlightContentProfessional.fromJson(json);

    default:
      return HighlightContentEmpty.fromJson(json);
  }
}

/// @nodoc
mixin _$HighlightContent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            String subjectiveTrend,
            String objectiveTrend,
            String analysisResult,
            String advice,
            String abstract,
            HighlightState state,
            String? promptFileUri)
        private,
    required TResult Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            List<String> analysisResults,
            String abstract,
            HighlightState state,
            String? promptFileUri)
        professional,
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            String subjectiveTrend,
            String objectiveTrend,
            String analysisResult,
            String advice,
            String abstract,
            HighlightState state,
            String? promptFileUri)?
        private,
    TResult? Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            List<String> analysisResults,
            String abstract,
            HighlightState state,
            String? promptFileUri)?
        professional,
    TResult? Function()? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            String subjectiveTrend,
            String objectiveTrend,
            String analysisResult,
            String advice,
            String abstract,
            HighlightState state,
            String? promptFileUri)?
        private,
    TResult Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            List<String> analysisResults,
            String abstract,
            HighlightState state,
            String? promptFileUri)?
        professional,
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HighlightContentPrivate value) private,
    required TResult Function(HighlightContentProfessional value) professional,
    required TResult Function(HighlightContentEmpty value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HighlightContentPrivate value)? private,
    TResult? Function(HighlightContentProfessional value)? professional,
    TResult? Function(HighlightContentEmpty value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HighlightContentPrivate value)? private,
    TResult Function(HighlightContentProfessional value)? professional,
    TResult Function(HighlightContentEmpty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this HighlightContent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HighlightContentCopyWith<$Res> {
  factory $HighlightContentCopyWith(
          HighlightContent value, $Res Function(HighlightContent) then) =
      _$HighlightContentCopyWithImpl<$Res, HighlightContent>;
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
}

/// @nodoc
abstract class _$$HighlightContentPrivateImplCopyWith<$Res> {
  factory _$$HighlightContentPrivateImplCopyWith(
          _$HighlightContentPrivateImpl value,
          $Res Function(_$HighlightContentPrivateImpl) then) =
      __$$HighlightContentPrivateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {@TimestampConverterNotNull() Timestamp startAt,
      HighlightPeriod period,
      String subjectiveTrend,
      String objectiveTrend,
      String analysisResult,
      String advice,
      String abstract,
      HighlightState state,
      String? promptFileUri});
}

/// @nodoc
class __$$HighlightContentPrivateImplCopyWithImpl<$Res>
    extends _$HighlightContentCopyWithImpl<$Res, _$HighlightContentPrivateImpl>
    implements _$$HighlightContentPrivateImplCopyWith<$Res> {
  __$$HighlightContentPrivateImplCopyWithImpl(
      _$HighlightContentPrivateImpl _value,
      $Res Function(_$HighlightContentPrivateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HighlightContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startAt = null,
    Object? period = null,
    Object? subjectiveTrend = null,
    Object? objectiveTrend = null,
    Object? analysisResult = null,
    Object? advice = null,
    Object? abstract = null,
    Object? state = null,
    Object? promptFileUri = freezed,
  }) {
    return _then(_$HighlightContentPrivateImpl(
      startAt: null == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as HighlightPeriod,
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
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as HighlightState,
      promptFileUri: freezed == promptFileUri
          ? _value.promptFileUri
          : promptFileUri // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HighlightContentPrivateImpl implements HighlightContentPrivate {
  const _$HighlightContentPrivateImpl(
      {@TimestampConverterNotNull() required this.startAt,
      required this.period,
      this.subjectiveTrend = '',
      this.objectiveTrend = '',
      this.analysisResult = '',
      this.advice = '',
      this.abstract = '',
      this.state = HighlightState.pending,
      this.promptFileUri,
      final String? $type})
      : $type = $type ?? 'private';

  factory _$HighlightContentPrivateImpl.fromJson(Map<String, dynamic> json) =>
      _$$HighlightContentPrivateImplFromJson(json);

  /// ハイライトを作成開始する日時。この日からN日前のハイライト
  @override
  @TimestampConverterNotNull()
  final Timestamp startAt;

  /// ハイライトの対象期間
  @override
  final HighlightPeriod period;

  /// 主観的なデータのトレンド
  @override
  @JsonKey()
  final String subjectiveTrend;

  /// 客観的なデータのトレンド
  @override
  @JsonKey()
  final String objectiveTrend;

  /// 分析結果
  @override
  @JsonKey()
  final String analysisResult;

  /// アドバイス
  @override
  @JsonKey()
  final String advice;

  /// 分析結果の要旨
  @override
  @JsonKey()
  final String abstract;

  /// 生成モデルでの処理の状態
  @override
  @JsonKey()
  final HighlightState state;

  /// 生成モデルによるハイライトの生成のプロンプトのファイルパス
  @override
  final String? promptFileUri;

  @JsonKey(name: 'style')
  final String $type;

  @override
  String toString() {
    return 'HighlightContent.private(startAt: $startAt, period: $period, subjectiveTrend: $subjectiveTrend, objectiveTrend: $objectiveTrend, analysisResult: $analysisResult, advice: $advice, abstract: $abstract, state: $state, promptFileUri: $promptFileUri)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HighlightContentPrivateImpl &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.subjectiveTrend, subjectiveTrend) ||
                other.subjectiveTrend == subjectiveTrend) &&
            (identical(other.objectiveTrend, objectiveTrend) ||
                other.objectiveTrend == objectiveTrend) &&
            (identical(other.analysisResult, analysisResult) ||
                other.analysisResult == analysisResult) &&
            (identical(other.advice, advice) || other.advice == advice) &&
            (identical(other.abstract, abstract) ||
                other.abstract == abstract) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.promptFileUri, promptFileUri) ||
                other.promptFileUri == promptFileUri));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, startAt, period, subjectiveTrend,
      objectiveTrend, analysisResult, advice, abstract, state, promptFileUri);

  /// Create a copy of HighlightContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HighlightContentPrivateImplCopyWith<_$HighlightContentPrivateImpl>
      get copyWith => __$$HighlightContentPrivateImplCopyWithImpl<
          _$HighlightContentPrivateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            String subjectiveTrend,
            String objectiveTrend,
            String analysisResult,
            String advice,
            String abstract,
            HighlightState state,
            String? promptFileUri)
        private,
    required TResult Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            List<String> analysisResults,
            String abstract,
            HighlightState state,
            String? promptFileUri)
        professional,
    required TResult Function() empty,
  }) {
    return private(startAt, period, subjectiveTrend, objectiveTrend,
        analysisResult, advice, abstract, state, promptFileUri);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            String subjectiveTrend,
            String objectiveTrend,
            String analysisResult,
            String advice,
            String abstract,
            HighlightState state,
            String? promptFileUri)?
        private,
    TResult? Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            List<String> analysisResults,
            String abstract,
            HighlightState state,
            String? promptFileUri)?
        professional,
    TResult? Function()? empty,
  }) {
    return private?.call(startAt, period, subjectiveTrend, objectiveTrend,
        analysisResult, advice, abstract, state, promptFileUri);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            String subjectiveTrend,
            String objectiveTrend,
            String analysisResult,
            String advice,
            String abstract,
            HighlightState state,
            String? promptFileUri)?
        private,
    TResult Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            List<String> analysisResults,
            String abstract,
            HighlightState state,
            String? promptFileUri)?
        professional,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (private != null) {
      return private(startAt, period, subjectiveTrend, objectiveTrend,
          analysisResult, advice, abstract, state, promptFileUri);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HighlightContentPrivate value) private,
    required TResult Function(HighlightContentProfessional value) professional,
    required TResult Function(HighlightContentEmpty value) empty,
  }) {
    return private(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HighlightContentPrivate value)? private,
    TResult? Function(HighlightContentProfessional value)? professional,
    TResult? Function(HighlightContentEmpty value)? empty,
  }) {
    return private?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HighlightContentPrivate value)? private,
    TResult Function(HighlightContentProfessional value)? professional,
    TResult Function(HighlightContentEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (private != null) {
      return private(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$HighlightContentPrivateImplToJson(
      this,
    );
  }
}

abstract class HighlightContentPrivate implements HighlightContent {
  const factory HighlightContentPrivate(
      {@TimestampConverterNotNull() required final Timestamp startAt,
      required final HighlightPeriod period,
      final String subjectiveTrend,
      final String objectiveTrend,
      final String analysisResult,
      final String advice,
      final String abstract,
      final HighlightState state,
      final String? promptFileUri}) = _$HighlightContentPrivateImpl;

  factory HighlightContentPrivate.fromJson(Map<String, dynamic> json) =
      _$HighlightContentPrivateImpl.fromJson;

  /// ハイライトを作成開始する日時。この日からN日前のハイライト
  @TimestampConverterNotNull()
  Timestamp get startAt;

  /// ハイライトの対象期間
  HighlightPeriod get period;

  /// 主観的なデータのトレンド
  String get subjectiveTrend;

  /// 客観的なデータのトレンド
  String get objectiveTrend;

  /// 分析結果
  String get analysisResult;

  /// アドバイス
  String get advice;

  /// 分析結果の要旨
  String get abstract;

  /// 生成モデルでの処理の状態
  HighlightState get state;

  /// 生成モデルによるハイライトの生成のプロンプトのファイルパス
  String? get promptFileUri;

  /// Create a copy of HighlightContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HighlightContentPrivateImplCopyWith<_$HighlightContentPrivateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HighlightContentProfessionalImplCopyWith<$Res> {
  factory _$$HighlightContentProfessionalImplCopyWith(
          _$HighlightContentProfessionalImpl value,
          $Res Function(_$HighlightContentProfessionalImpl) then) =
      __$$HighlightContentProfessionalImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {@TimestampConverterNotNull() Timestamp startAt,
      HighlightPeriod period,
      List<String> analysisResults,
      String abstract,
      HighlightState state,
      String? promptFileUri});
}

/// @nodoc
class __$$HighlightContentProfessionalImplCopyWithImpl<$Res>
    extends _$HighlightContentCopyWithImpl<$Res,
        _$HighlightContentProfessionalImpl>
    implements _$$HighlightContentProfessionalImplCopyWith<$Res> {
  __$$HighlightContentProfessionalImplCopyWithImpl(
      _$HighlightContentProfessionalImpl _value,
      $Res Function(_$HighlightContentProfessionalImpl) _then)
      : super(_value, _then);

  /// Create a copy of HighlightContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startAt = null,
    Object? period = null,
    Object? analysisResults = null,
    Object? abstract = null,
    Object? state = null,
    Object? promptFileUri = freezed,
  }) {
    return _then(_$HighlightContentProfessionalImpl(
      startAt: null == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as HighlightPeriod,
      analysisResults: null == analysisResults
          ? _value._analysisResults
          : analysisResults // ignore: cast_nullable_to_non_nullable
              as List<String>,
      abstract: null == abstract
          ? _value.abstract
          : abstract // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as HighlightState,
      promptFileUri: freezed == promptFileUri
          ? _value.promptFileUri
          : promptFileUri // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HighlightContentProfessionalImpl
    implements HighlightContentProfessional {
  const _$HighlightContentProfessionalImpl(
      {@TimestampConverterNotNull() required this.startAt,
      required this.period,
      final List<String> analysisResults = const [],
      this.abstract = '',
      this.state = HighlightState.pending,
      this.promptFileUri,
      final String? $type})
      : _analysisResults = analysisResults,
        $type = $type ?? 'professional';

  factory _$HighlightContentProfessionalImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$HighlightContentProfessionalImplFromJson(json);

  /// ハイライトを作成開始する日時。この日からN日前のハイライト
  @override
  @TimestampConverterNotNull()
  final Timestamp startAt;

  /// ハイライトの種類
  @override
  final HighlightPeriod period;

  /// 分析結果
  final List<String> _analysisResults;

  /// 分析結果
  @override
  @JsonKey()
  List<String> get analysisResults {
    if (_analysisResults is EqualUnmodifiableListView) return _analysisResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_analysisResults);
  }

  /// 分析結果の要旨
  @override
  @JsonKey()
  final String abstract;

  /// 生成モデルでの処理の状態
  @override
  @JsonKey()
  final HighlightState state;

  /// 生成モデルによるハイライトの生成のプロンプトのファイルパス
  @override
  final String? promptFileUri;

  @JsonKey(name: 'style')
  final String $type;

  @override
  String toString() {
    return 'HighlightContent.professional(startAt: $startAt, period: $period, analysisResults: $analysisResults, abstract: $abstract, state: $state, promptFileUri: $promptFileUri)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HighlightContentProfessionalImpl &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.period, period) || other.period == period) &&
            const DeepCollectionEquality()
                .equals(other._analysisResults, _analysisResults) &&
            (identical(other.abstract, abstract) ||
                other.abstract == abstract) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.promptFileUri, promptFileUri) ||
                other.promptFileUri == promptFileUri));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      startAt,
      period,
      const DeepCollectionEquality().hash(_analysisResults),
      abstract,
      state,
      promptFileUri);

  /// Create a copy of HighlightContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HighlightContentProfessionalImplCopyWith<
          _$HighlightContentProfessionalImpl>
      get copyWith => __$$HighlightContentProfessionalImplCopyWithImpl<
          _$HighlightContentProfessionalImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            String subjectiveTrend,
            String objectiveTrend,
            String analysisResult,
            String advice,
            String abstract,
            HighlightState state,
            String? promptFileUri)
        private,
    required TResult Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            List<String> analysisResults,
            String abstract,
            HighlightState state,
            String? promptFileUri)
        professional,
    required TResult Function() empty,
  }) {
    return professional(
        startAt, period, analysisResults, abstract, state, promptFileUri);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            String subjectiveTrend,
            String objectiveTrend,
            String analysisResult,
            String advice,
            String abstract,
            HighlightState state,
            String? promptFileUri)?
        private,
    TResult? Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            List<String> analysisResults,
            String abstract,
            HighlightState state,
            String? promptFileUri)?
        professional,
    TResult? Function()? empty,
  }) {
    return professional?.call(
        startAt, period, analysisResults, abstract, state, promptFileUri);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            String subjectiveTrend,
            String objectiveTrend,
            String analysisResult,
            String advice,
            String abstract,
            HighlightState state,
            String? promptFileUri)?
        private,
    TResult Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            List<String> analysisResults,
            String abstract,
            HighlightState state,
            String? promptFileUri)?
        professional,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (professional != null) {
      return professional(
          startAt, period, analysisResults, abstract, state, promptFileUri);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HighlightContentPrivate value) private,
    required TResult Function(HighlightContentProfessional value) professional,
    required TResult Function(HighlightContentEmpty value) empty,
  }) {
    return professional(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HighlightContentPrivate value)? private,
    TResult? Function(HighlightContentProfessional value)? professional,
    TResult? Function(HighlightContentEmpty value)? empty,
  }) {
    return professional?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HighlightContentPrivate value)? private,
    TResult Function(HighlightContentProfessional value)? professional,
    TResult Function(HighlightContentEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (professional != null) {
      return professional(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$HighlightContentProfessionalImplToJson(
      this,
    );
  }
}

abstract class HighlightContentProfessional implements HighlightContent {
  const factory HighlightContentProfessional(
      {@TimestampConverterNotNull() required final Timestamp startAt,
      required final HighlightPeriod period,
      final List<String> analysisResults,
      final String abstract,
      final HighlightState state,
      final String? promptFileUri}) = _$HighlightContentProfessionalImpl;

  factory HighlightContentProfessional.fromJson(Map<String, dynamic> json) =
      _$HighlightContentProfessionalImpl.fromJson;

  /// ハイライトを作成開始する日時。この日からN日前のハイライト
  @TimestampConverterNotNull()
  Timestamp get startAt;

  /// ハイライトの種類
  HighlightPeriod get period;

  /// 分析結果
  List<String> get analysisResults;

  /// 分析結果の要旨
  String get abstract;

  /// 生成モデルでの処理の状態
  HighlightState get state;

  /// 生成モデルによるハイライトの生成のプロンプトのファイルパス
  String? get promptFileUri;

  /// Create a copy of HighlightContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HighlightContentProfessionalImplCopyWith<
          _$HighlightContentProfessionalImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HighlightContentEmptyImplCopyWith<$Res> {
  factory _$$HighlightContentEmptyImplCopyWith(
          _$HighlightContentEmptyImpl value,
          $Res Function(_$HighlightContentEmptyImpl) then) =
      __$$HighlightContentEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HighlightContentEmptyImplCopyWithImpl<$Res>
    extends _$HighlightContentCopyWithImpl<$Res, _$HighlightContentEmptyImpl>
    implements _$$HighlightContentEmptyImplCopyWith<$Res> {
  __$$HighlightContentEmptyImplCopyWithImpl(_$HighlightContentEmptyImpl _value,
      $Res Function(_$HighlightContentEmptyImpl) _then)
      : super(_value, _then);

  /// Create a copy of HighlightContent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$HighlightContentEmptyImpl implements HighlightContentEmpty {
  const _$HighlightContentEmptyImpl({final String? $type})
      : $type = $type ?? 'empty';

  factory _$HighlightContentEmptyImpl.fromJson(Map<String, dynamic> json) =>
      _$$HighlightContentEmptyImplFromJson(json);

  @JsonKey(name: 'style')
  final String $type;

  @override
  String toString() {
    return 'HighlightContent.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HighlightContentEmptyImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            String subjectiveTrend,
            String objectiveTrend,
            String analysisResult,
            String advice,
            String abstract,
            HighlightState state,
            String? promptFileUri)
        private,
    required TResult Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            List<String> analysisResults,
            String abstract,
            HighlightState state,
            String? promptFileUri)
        professional,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            String subjectiveTrend,
            String objectiveTrend,
            String analysisResult,
            String advice,
            String abstract,
            HighlightState state,
            String? promptFileUri)?
        private,
    TResult? Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            List<String> analysisResults,
            String abstract,
            HighlightState state,
            String? promptFileUri)?
        professional,
    TResult? Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            String subjectiveTrend,
            String objectiveTrend,
            String analysisResult,
            String advice,
            String abstract,
            HighlightState state,
            String? promptFileUri)?
        private,
    TResult Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            List<String> analysisResults,
            String abstract,
            HighlightState state,
            String? promptFileUri)?
        professional,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HighlightContentPrivate value) private,
    required TResult Function(HighlightContentProfessional value) professional,
    required TResult Function(HighlightContentEmpty value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HighlightContentPrivate value)? private,
    TResult? Function(HighlightContentProfessional value)? professional,
    TResult? Function(HighlightContentEmpty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HighlightContentPrivate value)? private,
    TResult Function(HighlightContentProfessional value)? professional,
    TResult Function(HighlightContentEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$HighlightContentEmptyImplToJson(
      this,
    );
  }
}

abstract class HighlightContentEmpty implements HighlightContent {
  const factory HighlightContentEmpty() = _$HighlightContentEmptyImpl;

  factory HighlightContentEmpty.fromJson(Map<String, dynamic> json) =
      _$HighlightContentEmptyImpl.fromJson;
}

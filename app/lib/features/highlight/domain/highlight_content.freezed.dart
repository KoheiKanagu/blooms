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
  switch (json['type']) {
    case 'summary':
      return HighlightContentSummary.fromJson(json);

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
            String summary,
            String abstract,
            HighlightState state,
            String? promptFileUri)
        summary,
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            String summary,
            String abstract,
            HighlightState state,
            String? promptFileUri)?
        summary,
    TResult? Function()? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            String summary,
            String abstract,
            HighlightState state,
            String? promptFileUri)?
        summary,
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HighlightContentSummary value) summary,
    required TResult Function(HighlightContentEmpty value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HighlightContentSummary value)? summary,
    TResult? Function(HighlightContentEmpty value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HighlightContentSummary value)? summary,
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
abstract class _$$HighlightContentSummaryImplCopyWith<$Res> {
  factory _$$HighlightContentSummaryImplCopyWith(
          _$HighlightContentSummaryImpl value,
          $Res Function(_$HighlightContentSummaryImpl) then) =
      __$$HighlightContentSummaryImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {@TimestampConverterNotNull() Timestamp startAt,
      HighlightPeriod period,
      String summary,
      String abstract,
      HighlightState state,
      String? promptFileUri});
}

/// @nodoc
class __$$HighlightContentSummaryImplCopyWithImpl<$Res>
    extends _$HighlightContentCopyWithImpl<$Res, _$HighlightContentSummaryImpl>
    implements _$$HighlightContentSummaryImplCopyWith<$Res> {
  __$$HighlightContentSummaryImplCopyWithImpl(
      _$HighlightContentSummaryImpl _value,
      $Res Function(_$HighlightContentSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of HighlightContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startAt = null,
    Object? period = null,
    Object? summary = null,
    Object? abstract = null,
    Object? state = null,
    Object? promptFileUri = freezed,
  }) {
    return _then(_$HighlightContentSummaryImpl(
      startAt: null == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as HighlightPeriod,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
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
class _$HighlightContentSummaryImpl implements HighlightContentSummary {
  const _$HighlightContentSummaryImpl(
      {@TimestampConverterNotNull() required this.startAt,
      required this.period,
      required this.summary,
      required this.abstract,
      this.state = HighlightState.pending,
      this.promptFileUri,
      final String? $type})
      : $type = $type ?? 'summary';

  factory _$HighlightContentSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$HighlightContentSummaryImplFromJson(json);

  /// ハイライトを作成開始する日時。この日からN日前のハイライト
  @override
  @TimestampConverterNotNull()
  final Timestamp startAt;

  /// ハイライトの対象期間
  @override
  final HighlightPeriod period;

  /// コンディションの要約
  @override
  final String summary;

  /// 分析結果の要旨
  @override
  final String abstract;

  /// 生成モデルでの処理の状態
  @override
  @JsonKey()
  final HighlightState state;

  /// 生成モデルによるハイライトの生成プロンプトのファイルパス
  @override
  final String? promptFileUri;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'HighlightContent.summary(startAt: $startAt, period: $period, summary: $summary, abstract: $abstract, state: $state, promptFileUri: $promptFileUri)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HighlightContentSummaryImpl &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.abstract, abstract) ||
                other.abstract == abstract) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.promptFileUri, promptFileUri) ||
                other.promptFileUri == promptFileUri));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, startAt, period, summary, abstract, state, promptFileUri);

  /// Create a copy of HighlightContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HighlightContentSummaryImplCopyWith<_$HighlightContentSummaryImpl>
      get copyWith => __$$HighlightContentSummaryImplCopyWithImpl<
          _$HighlightContentSummaryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            String summary,
            String abstract,
            HighlightState state,
            String? promptFileUri)
        summary,
    required TResult Function() empty,
  }) {
    return summary(
        startAt, period, this.summary, abstract, state, promptFileUri);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            String summary,
            String abstract,
            HighlightState state,
            String? promptFileUri)?
        summary,
    TResult? Function()? empty,
  }) {
    return summary?.call(
        startAt, period, this.summary, abstract, state, promptFileUri);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @TimestampConverterNotNull() Timestamp startAt,
            HighlightPeriod period,
            String summary,
            String abstract,
            HighlightState state,
            String? promptFileUri)?
        summary,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (summary != null) {
      return summary(
          startAt, period, this.summary, abstract, state, promptFileUri);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HighlightContentSummary value) summary,
    required TResult Function(HighlightContentEmpty value) empty,
  }) {
    return summary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HighlightContentSummary value)? summary,
    TResult? Function(HighlightContentEmpty value)? empty,
  }) {
    return summary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HighlightContentSummary value)? summary,
    TResult Function(HighlightContentEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (summary != null) {
      return summary(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$HighlightContentSummaryImplToJson(
      this,
    );
  }
}

abstract class HighlightContentSummary implements HighlightContent {
  const factory HighlightContentSummary(
      {@TimestampConverterNotNull() required final Timestamp startAt,
      required final HighlightPeriod period,
      required final String summary,
      required final String abstract,
      final HighlightState state,
      final String? promptFileUri}) = _$HighlightContentSummaryImpl;

  factory HighlightContentSummary.fromJson(Map<String, dynamic> json) =
      _$HighlightContentSummaryImpl.fromJson;

  /// ハイライトを作成開始する日時。この日からN日前のハイライト
  @TimestampConverterNotNull()
  Timestamp get startAt;

  /// ハイライトの対象期間
  HighlightPeriod get period;

  /// コンディションの要約
  String get summary;

  /// 分析結果の要旨
  String get abstract;

  /// 生成モデルでの処理の状態
  HighlightState get state;

  /// 生成モデルによるハイライトの生成プロンプトのファイルパス
  String? get promptFileUri;

  /// Create a copy of HighlightContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HighlightContentSummaryImplCopyWith<_$HighlightContentSummaryImpl>
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

  @JsonKey(name: 'type')
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
            String summary,
            String abstract,
            HighlightState state,
            String? promptFileUri)
        summary,
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
            String summary,
            String abstract,
            HighlightState state,
            String? promptFileUri)?
        summary,
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
            String summary,
            String abstract,
            HighlightState state,
            String? promptFileUri)?
        summary,
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
    required TResult Function(HighlightContentSummary value) summary,
    required TResult Function(HighlightContentEmpty value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HighlightContentSummary value)? summary,
    TResult? Function(HighlightContentEmpty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HighlightContentSummary value)? summary,
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

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
    case 'forOwn':
      return _HighlightContentForOwn.fromJson(json);
    case 'forProfessional':
      return _HighlightContentForProfessional.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'style', 'HighlightContent',
          'Invalid union type "${json['style']}"!');
  }
}

/// @nodoc
mixin _$HighlightContent {
  /// 分析結果の要旨
  String get abstract => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String subjectiveTrend, String objectiveTrend,
            String analysisResult, String advice, String abstract)
        forOwn,
    required TResult Function(List<String> analysisResults, String abstract)
        forProfessional,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String subjectiveTrend, String objectiveTrend,
            String analysisResult, String advice, String abstract)?
        forOwn,
    TResult? Function(List<String> analysisResults, String abstract)?
        forProfessional,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String subjectiveTrend, String objectiveTrend,
            String analysisResult, String advice, String abstract)?
        forOwn,
    TResult Function(List<String> analysisResults, String abstract)?
        forProfessional,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HighlightContentForOwn value) forOwn,
    required TResult Function(_HighlightContentForProfessional value)
        forProfessional,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HighlightContentForOwn value)? forOwn,
    TResult? Function(_HighlightContentForProfessional value)? forProfessional,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HighlightContentForOwn value)? forOwn,
    TResult Function(_HighlightContentForProfessional value)? forProfessional,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

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
  $Res call({String abstract});
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
    Object? abstract = null,
  }) {
    return _then(_value.copyWith(
      abstract: null == abstract
          ? _value.abstract
          : abstract // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HighlightContentForOwnImplCopyWith<$Res>
    implements $HighlightContentCopyWith<$Res> {
  factory _$$HighlightContentForOwnImplCopyWith(
          _$HighlightContentForOwnImpl value,
          $Res Function(_$HighlightContentForOwnImpl) then) =
      __$$HighlightContentForOwnImplCopyWithImpl<$Res>;
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
class __$$HighlightContentForOwnImplCopyWithImpl<$Res>
    extends _$HighlightContentCopyWithImpl<$Res, _$HighlightContentForOwnImpl>
    implements _$$HighlightContentForOwnImplCopyWith<$Res> {
  __$$HighlightContentForOwnImplCopyWithImpl(
      _$HighlightContentForOwnImpl _value,
      $Res Function(_$HighlightContentForOwnImpl) _then)
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
    return _then(_$HighlightContentForOwnImpl(
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
class _$HighlightContentForOwnImpl implements _HighlightContentForOwn {
  const _$HighlightContentForOwnImpl(
      {required this.subjectiveTrend,
      required this.objectiveTrend,
      required this.analysisResult,
      required this.advice,
      required this.abstract,
      final String? $type})
      : $type = $type ?? 'forOwn';

  factory _$HighlightContentForOwnImpl.fromJson(Map<String, dynamic> json) =>
      _$$HighlightContentForOwnImplFromJson(json);

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

  @JsonKey(name: 'style')
  final String $type;

  @override
  String toString() {
    return 'HighlightContent.forOwn(subjectiveTrend: $subjectiveTrend, objectiveTrend: $objectiveTrend, analysisResult: $analysisResult, advice: $advice, abstract: $abstract)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HighlightContentForOwnImpl &&
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
  _$$HighlightContentForOwnImplCopyWith<_$HighlightContentForOwnImpl>
      get copyWith => __$$HighlightContentForOwnImplCopyWithImpl<
          _$HighlightContentForOwnImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String subjectiveTrend, String objectiveTrend,
            String analysisResult, String advice, String abstract)
        forOwn,
    required TResult Function(List<String> analysisResults, String abstract)
        forProfessional,
  }) {
    return forOwn(
        subjectiveTrend, objectiveTrend, analysisResult, advice, abstract);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String subjectiveTrend, String objectiveTrend,
            String analysisResult, String advice, String abstract)?
        forOwn,
    TResult? Function(List<String> analysisResults, String abstract)?
        forProfessional,
  }) {
    return forOwn?.call(
        subjectiveTrend, objectiveTrend, analysisResult, advice, abstract);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String subjectiveTrend, String objectiveTrend,
            String analysisResult, String advice, String abstract)?
        forOwn,
    TResult Function(List<String> analysisResults, String abstract)?
        forProfessional,
    required TResult orElse(),
  }) {
    if (forOwn != null) {
      return forOwn(
          subjectiveTrend, objectiveTrend, analysisResult, advice, abstract);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HighlightContentForOwn value) forOwn,
    required TResult Function(_HighlightContentForProfessional value)
        forProfessional,
  }) {
    return forOwn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HighlightContentForOwn value)? forOwn,
    TResult? Function(_HighlightContentForProfessional value)? forProfessional,
  }) {
    return forOwn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HighlightContentForOwn value)? forOwn,
    TResult Function(_HighlightContentForProfessional value)? forProfessional,
    required TResult orElse(),
  }) {
    if (forOwn != null) {
      return forOwn(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$HighlightContentForOwnImplToJson(
      this,
    );
  }
}

abstract class _HighlightContentForOwn implements HighlightContent {
  const factory _HighlightContentForOwn(
      {required final String subjectiveTrend,
      required final String objectiveTrend,
      required final String analysisResult,
      required final String advice,
      required final String abstract}) = _$HighlightContentForOwnImpl;

  factory _HighlightContentForOwn.fromJson(Map<String, dynamic> json) =
      _$HighlightContentForOwnImpl.fromJson;

  /// 主観的なデータのトレンド
  String get subjectiveTrend;

  /// 客観的なデータのトレンド
  String get objectiveTrend;

  /// 分析結果
  String get analysisResult;

  /// アドバイス
  String get advice;

  /// 分析結果の要旨
  @override
  String get abstract;

  /// Create a copy of HighlightContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HighlightContentForOwnImplCopyWith<_$HighlightContentForOwnImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HighlightContentForProfessionalImplCopyWith<$Res>
    implements $HighlightContentCopyWith<$Res> {
  factory _$$HighlightContentForProfessionalImplCopyWith(
          _$HighlightContentForProfessionalImpl value,
          $Res Function(_$HighlightContentForProfessionalImpl) then) =
      __$$HighlightContentForProfessionalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> analysisResults, String abstract});
}

/// @nodoc
class __$$HighlightContentForProfessionalImplCopyWithImpl<$Res>
    extends _$HighlightContentCopyWithImpl<$Res,
        _$HighlightContentForProfessionalImpl>
    implements _$$HighlightContentForProfessionalImplCopyWith<$Res> {
  __$$HighlightContentForProfessionalImplCopyWithImpl(
      _$HighlightContentForProfessionalImpl _value,
      $Res Function(_$HighlightContentForProfessionalImpl) _then)
      : super(_value, _then);

  /// Create a copy of HighlightContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? analysisResults = null,
    Object? abstract = null,
  }) {
    return _then(_$HighlightContentForProfessionalImpl(
      analysisResults: null == analysisResults
          ? _value._analysisResults
          : analysisResults // ignore: cast_nullable_to_non_nullable
              as List<String>,
      abstract: null == abstract
          ? _value.abstract
          : abstract // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HighlightContentForProfessionalImpl
    implements _HighlightContentForProfessional {
  const _$HighlightContentForProfessionalImpl(
      {required final List<String> analysisResults,
      required this.abstract,
      final String? $type})
      : _analysisResults = analysisResults,
        $type = $type ?? 'forProfessional';

  factory _$HighlightContentForProfessionalImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$HighlightContentForProfessionalImplFromJson(json);

  /// 分析結果
  final List<String> _analysisResults;

  /// 分析結果
  @override
  List<String> get analysisResults {
    if (_analysisResults is EqualUnmodifiableListView) return _analysisResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_analysisResults);
  }

  /// 分析結果の要旨
  @override
  final String abstract;

  @JsonKey(name: 'style')
  final String $type;

  @override
  String toString() {
    return 'HighlightContent.forProfessional(analysisResults: $analysisResults, abstract: $abstract)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HighlightContentForProfessionalImpl &&
            const DeepCollectionEquality()
                .equals(other._analysisResults, _analysisResults) &&
            (identical(other.abstract, abstract) ||
                other.abstract == abstract));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_analysisResults), abstract);

  /// Create a copy of HighlightContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HighlightContentForProfessionalImplCopyWith<
          _$HighlightContentForProfessionalImpl>
      get copyWith => __$$HighlightContentForProfessionalImplCopyWithImpl<
          _$HighlightContentForProfessionalImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String subjectiveTrend, String objectiveTrend,
            String analysisResult, String advice, String abstract)
        forOwn,
    required TResult Function(List<String> analysisResults, String abstract)
        forProfessional,
  }) {
    return forProfessional(analysisResults, abstract);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String subjectiveTrend, String objectiveTrend,
            String analysisResult, String advice, String abstract)?
        forOwn,
    TResult? Function(List<String> analysisResults, String abstract)?
        forProfessional,
  }) {
    return forProfessional?.call(analysisResults, abstract);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String subjectiveTrend, String objectiveTrend,
            String analysisResult, String advice, String abstract)?
        forOwn,
    TResult Function(List<String> analysisResults, String abstract)?
        forProfessional,
    required TResult orElse(),
  }) {
    if (forProfessional != null) {
      return forProfessional(analysisResults, abstract);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HighlightContentForOwn value) forOwn,
    required TResult Function(_HighlightContentForProfessional value)
        forProfessional,
  }) {
    return forProfessional(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HighlightContentForOwn value)? forOwn,
    TResult? Function(_HighlightContentForProfessional value)? forProfessional,
  }) {
    return forProfessional?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HighlightContentForOwn value)? forOwn,
    TResult Function(_HighlightContentForProfessional value)? forProfessional,
    required TResult orElse(),
  }) {
    if (forProfessional != null) {
      return forProfessional(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$HighlightContentForProfessionalImplToJson(
      this,
    );
  }
}

abstract class _HighlightContentForProfessional implements HighlightContent {
  const factory _HighlightContentForProfessional(
      {required final List<String> analysisResults,
      required final String abstract}) = _$HighlightContentForProfessionalImpl;

  factory _HighlightContentForProfessional.fromJson(Map<String, dynamic> json) =
      _$HighlightContentForProfessionalImpl.fromJson;

  /// 分析結果
  List<String> get analysisResults;

  /// 分析結果の要旨
  @override
  String get abstract;

  /// Create a copy of HighlightContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HighlightContentForProfessionalImplCopyWith<
          _$HighlightContentForProfessionalImpl>
      get copyWith => throw _privateConstructorUsedError;
}

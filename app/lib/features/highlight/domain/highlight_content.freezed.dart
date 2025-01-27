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
    required TResult Function(String subjectiveTrend, String objectiveTrend,
            String analysisResult, String advice, String abstract)
        private,
    required TResult Function(List<String> analysisResults, String abstract)
        professional,
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String subjectiveTrend, String objectiveTrend,
            String analysisResult, String advice, String abstract)?
        private,
    TResult? Function(List<String> analysisResults, String abstract)?
        professional,
    TResult? Function()? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String subjectiveTrend, String objectiveTrend,
            String analysisResult, String advice, String abstract)?
        private,
    TResult Function(List<String> analysisResults, String abstract)?
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
      {String subjectiveTrend,
      String objectiveTrend,
      String analysisResult,
      String advice,
      String abstract});
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
    Object? subjectiveTrend = null,
    Object? objectiveTrend = null,
    Object? analysisResult = null,
    Object? advice = null,
    Object? abstract = null,
  }) {
    return _then(_$HighlightContentPrivateImpl(
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
class _$HighlightContentPrivateImpl implements HighlightContentPrivate {
  const _$HighlightContentPrivateImpl(
      {required this.subjectiveTrend,
      required this.objectiveTrend,
      required this.analysisResult,
      required this.advice,
      required this.abstract,
      final String? $type})
      : $type = $type ?? 'private';

  factory _$HighlightContentPrivateImpl.fromJson(Map<String, dynamic> json) =>
      _$$HighlightContentPrivateImplFromJson(json);

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
    return 'HighlightContent.private(subjectiveTrend: $subjectiveTrend, objectiveTrend: $objectiveTrend, analysisResult: $analysisResult, advice: $advice, abstract: $abstract)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HighlightContentPrivateImpl &&
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
  _$$HighlightContentPrivateImplCopyWith<_$HighlightContentPrivateImpl>
      get copyWith => __$$HighlightContentPrivateImplCopyWithImpl<
          _$HighlightContentPrivateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String subjectiveTrend, String objectiveTrend,
            String analysisResult, String advice, String abstract)
        private,
    required TResult Function(List<String> analysisResults, String abstract)
        professional,
    required TResult Function() empty,
  }) {
    return private(
        subjectiveTrend, objectiveTrend, analysisResult, advice, abstract);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String subjectiveTrend, String objectiveTrend,
            String analysisResult, String advice, String abstract)?
        private,
    TResult? Function(List<String> analysisResults, String abstract)?
        professional,
    TResult? Function()? empty,
  }) {
    return private?.call(
        subjectiveTrend, objectiveTrend, analysisResult, advice, abstract);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String subjectiveTrend, String objectiveTrend,
            String analysisResult, String advice, String abstract)?
        private,
    TResult Function(List<String> analysisResults, String abstract)?
        professional,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (private != null) {
      return private(
          subjectiveTrend, objectiveTrend, analysisResult, advice, abstract);
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
      {required final String subjectiveTrend,
      required final String objectiveTrend,
      required final String analysisResult,
      required final String advice,
      required final String abstract}) = _$HighlightContentPrivateImpl;

  factory HighlightContentPrivate.fromJson(Map<String, dynamic> json) =
      _$HighlightContentPrivateImpl.fromJson;

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
  $Res call({List<String> analysisResults, String abstract});
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
    Object? analysisResults = null,
    Object? abstract = null,
  }) {
    return _then(_$HighlightContentProfessionalImpl(
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
class _$HighlightContentProfessionalImpl
    implements HighlightContentProfessional {
  const _$HighlightContentProfessionalImpl(
      {required final List<String> analysisResults,
      required this.abstract,
      final String? $type})
      : _analysisResults = analysisResults,
        $type = $type ?? 'professional';

  factory _$HighlightContentProfessionalImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$HighlightContentProfessionalImplFromJson(json);

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
    return 'HighlightContent.professional(analysisResults: $analysisResults, abstract: $abstract)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HighlightContentProfessionalImpl &&
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
  _$$HighlightContentProfessionalImplCopyWith<
          _$HighlightContentProfessionalImpl>
      get copyWith => __$$HighlightContentProfessionalImplCopyWithImpl<
          _$HighlightContentProfessionalImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String subjectiveTrend, String objectiveTrend,
            String analysisResult, String advice, String abstract)
        private,
    required TResult Function(List<String> analysisResults, String abstract)
        professional,
    required TResult Function() empty,
  }) {
    return professional(analysisResults, abstract);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String subjectiveTrend, String objectiveTrend,
            String analysisResult, String advice, String abstract)?
        private,
    TResult? Function(List<String> analysisResults, String abstract)?
        professional,
    TResult? Function()? empty,
  }) {
    return professional?.call(analysisResults, abstract);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String subjectiveTrend, String objectiveTrend,
            String analysisResult, String advice, String abstract)?
        private,
    TResult Function(List<String> analysisResults, String abstract)?
        professional,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (professional != null) {
      return professional(analysisResults, abstract);
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
      {required final List<String> analysisResults,
      required final String abstract}) = _$HighlightContentProfessionalImpl;

  factory HighlightContentProfessional.fromJson(Map<String, dynamic> json) =
      _$HighlightContentProfessionalImpl.fromJson;

  /// 分析結果
  List<String> get analysisResults;

  /// 分析結果の要旨
  String get abstract;

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
    required TResult Function(String subjectiveTrend, String objectiveTrend,
            String analysisResult, String advice, String abstract)
        private,
    required TResult Function(List<String> analysisResults, String abstract)
        professional,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String subjectiveTrend, String objectiveTrend,
            String analysisResult, String advice, String abstract)?
        private,
    TResult? Function(List<String> analysisResults, String abstract)?
        professional,
    TResult? Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String subjectiveTrend, String objectiveTrend,
            String analysisResult, String advice, String abstract)?
        private,
    TResult Function(List<String> analysisResults, String abstract)?
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

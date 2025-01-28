// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'condition_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConditionContent _$ConditionContentFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'subjective':
      return ConditionContentSubjective.fromJson(json);
    case 'photo':
      return ConditionContentPhoto.fromJson(json);

    default:
      return ConditionContentEmpty.fromJson(json);
  }
}

/// @nodoc
mixin _$ConditionContent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String record) subjective,
    required TResult Function(List<ConditionContentAttachment> attachments)
        photo,
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String record)? subjective,
    TResult? Function(List<ConditionContentAttachment> attachments)? photo,
    TResult? Function()? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String record)? subjective,
    TResult Function(List<ConditionContentAttachment> attachments)? photo,
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConditionContentSubjective value) subjective,
    required TResult Function(ConditionContentPhoto value) photo,
    required TResult Function(ConditionContentEmpty value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConditionContentSubjective value)? subjective,
    TResult? Function(ConditionContentPhoto value)? photo,
    TResult? Function(ConditionContentEmpty value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConditionContentSubjective value)? subjective,
    TResult Function(ConditionContentPhoto value)? photo,
    TResult Function(ConditionContentEmpty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this ConditionContent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConditionContentCopyWith<$Res> {
  factory $ConditionContentCopyWith(
          ConditionContent value, $Res Function(ConditionContent) then) =
      _$ConditionContentCopyWithImpl<$Res, ConditionContent>;
}

/// @nodoc
class _$ConditionContentCopyWithImpl<$Res, $Val extends ConditionContent>
    implements $ConditionContentCopyWith<$Res> {
  _$ConditionContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConditionContent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ConditionContentSubjectiveImplCopyWith<$Res> {
  factory _$$ConditionContentSubjectiveImplCopyWith(
          _$ConditionContentSubjectiveImpl value,
          $Res Function(_$ConditionContentSubjectiveImpl) then) =
      __$$ConditionContentSubjectiveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String record});
}

/// @nodoc
class __$$ConditionContentSubjectiveImplCopyWithImpl<$Res>
    extends _$ConditionContentCopyWithImpl<$Res,
        _$ConditionContentSubjectiveImpl>
    implements _$$ConditionContentSubjectiveImplCopyWith<$Res> {
  __$$ConditionContentSubjectiveImplCopyWithImpl(
      _$ConditionContentSubjectiveImpl _value,
      $Res Function(_$ConditionContentSubjectiveImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConditionContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? record = null,
  }) {
    return _then(_$ConditionContentSubjectiveImpl(
      record: null == record
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConditionContentSubjectiveImpl implements ConditionContentSubjective {
  const _$ConditionContentSubjectiveImpl(
      {required this.record, final String? $type})
      : $type = $type ?? 'subjective';

  factory _$ConditionContentSubjectiveImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConditionContentSubjectiveImplFromJson(json);

  @override
  final String record;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ConditionContent.subjective(record: $record)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionContentSubjectiveImpl &&
            (identical(other.record, record) || other.record == record));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, record);

  /// Create a copy of ConditionContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConditionContentSubjectiveImplCopyWith<_$ConditionContentSubjectiveImpl>
      get copyWith => __$$ConditionContentSubjectiveImplCopyWithImpl<
          _$ConditionContentSubjectiveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String record) subjective,
    required TResult Function(List<ConditionContentAttachment> attachments)
        photo,
    required TResult Function() empty,
  }) {
    return subjective(record);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String record)? subjective,
    TResult? Function(List<ConditionContentAttachment> attachments)? photo,
    TResult? Function()? empty,
  }) {
    return subjective?.call(record);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String record)? subjective,
    TResult Function(List<ConditionContentAttachment> attachments)? photo,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (subjective != null) {
      return subjective(record);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConditionContentSubjective value) subjective,
    required TResult Function(ConditionContentPhoto value) photo,
    required TResult Function(ConditionContentEmpty value) empty,
  }) {
    return subjective(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConditionContentSubjective value)? subjective,
    TResult? Function(ConditionContentPhoto value)? photo,
    TResult? Function(ConditionContentEmpty value)? empty,
  }) {
    return subjective?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConditionContentSubjective value)? subjective,
    TResult Function(ConditionContentPhoto value)? photo,
    TResult Function(ConditionContentEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (subjective != null) {
      return subjective(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionContentSubjectiveImplToJson(
      this,
    );
  }
}

abstract class ConditionContentSubjective implements ConditionContent {
  const factory ConditionContentSubjective({required final String record}) =
      _$ConditionContentSubjectiveImpl;

  factory ConditionContentSubjective.fromJson(Map<String, dynamic> json) =
      _$ConditionContentSubjectiveImpl.fromJson;

  String get record;

  /// Create a copy of ConditionContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConditionContentSubjectiveImplCopyWith<_$ConditionContentSubjectiveImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConditionContentPhotoImplCopyWith<$Res> {
  factory _$$ConditionContentPhotoImplCopyWith(
          _$ConditionContentPhotoImpl value,
          $Res Function(_$ConditionContentPhotoImpl) then) =
      __$$ConditionContentPhotoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ConditionContentAttachment> attachments});
}

/// @nodoc
class __$$ConditionContentPhotoImplCopyWithImpl<$Res>
    extends _$ConditionContentCopyWithImpl<$Res, _$ConditionContentPhotoImpl>
    implements _$$ConditionContentPhotoImplCopyWith<$Res> {
  __$$ConditionContentPhotoImplCopyWithImpl(_$ConditionContentPhotoImpl _value,
      $Res Function(_$ConditionContentPhotoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConditionContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attachments = null,
  }) {
    return _then(_$ConditionContentPhotoImpl(
      attachments: null == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<ConditionContentAttachment>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConditionContentPhotoImpl implements ConditionContentPhoto {
  const _$ConditionContentPhotoImpl(
      {required final List<ConditionContentAttachment> attachments,
      final String? $type})
      : _attachments = attachments,
        $type = $type ?? 'photo';

  factory _$ConditionContentPhotoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConditionContentPhotoImplFromJson(json);

  final List<ConditionContentAttachment> _attachments;
  @override
  List<ConditionContentAttachment> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ConditionContent.photo(attachments: $attachments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionContentPhotoImpl &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_attachments));

  /// Create a copy of ConditionContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConditionContentPhotoImplCopyWith<_$ConditionContentPhotoImpl>
      get copyWith => __$$ConditionContentPhotoImplCopyWithImpl<
          _$ConditionContentPhotoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String record) subjective,
    required TResult Function(List<ConditionContentAttachment> attachments)
        photo,
    required TResult Function() empty,
  }) {
    return photo(attachments);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String record)? subjective,
    TResult? Function(List<ConditionContentAttachment> attachments)? photo,
    TResult? Function()? empty,
  }) {
    return photo?.call(attachments);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String record)? subjective,
    TResult Function(List<ConditionContentAttachment> attachments)? photo,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (photo != null) {
      return photo(attachments);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConditionContentSubjective value) subjective,
    required TResult Function(ConditionContentPhoto value) photo,
    required TResult Function(ConditionContentEmpty value) empty,
  }) {
    return photo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConditionContentSubjective value)? subjective,
    TResult? Function(ConditionContentPhoto value)? photo,
    TResult? Function(ConditionContentEmpty value)? empty,
  }) {
    return photo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConditionContentSubjective value)? subjective,
    TResult Function(ConditionContentPhoto value)? photo,
    TResult Function(ConditionContentEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (photo != null) {
      return photo(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionContentPhotoImplToJson(
      this,
    );
  }
}

abstract class ConditionContentPhoto implements ConditionContent {
  const factory ConditionContentPhoto(
          {required final List<ConditionContentAttachment> attachments}) =
      _$ConditionContentPhotoImpl;

  factory ConditionContentPhoto.fromJson(Map<String, dynamic> json) =
      _$ConditionContentPhotoImpl.fromJson;

  List<ConditionContentAttachment> get attachments;

  /// Create a copy of ConditionContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConditionContentPhotoImplCopyWith<_$ConditionContentPhotoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConditionContentEmptyImplCopyWith<$Res> {
  factory _$$ConditionContentEmptyImplCopyWith(
          _$ConditionContentEmptyImpl value,
          $Res Function(_$ConditionContentEmptyImpl) then) =
      __$$ConditionContentEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConditionContentEmptyImplCopyWithImpl<$Res>
    extends _$ConditionContentCopyWithImpl<$Res, _$ConditionContentEmptyImpl>
    implements _$$ConditionContentEmptyImplCopyWith<$Res> {
  __$$ConditionContentEmptyImplCopyWithImpl(_$ConditionContentEmptyImpl _value,
      $Res Function(_$ConditionContentEmptyImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConditionContent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ConditionContentEmptyImpl implements ConditionContentEmpty {
  const _$ConditionContentEmptyImpl({final String? $type})
      : $type = $type ?? 'empty';

  factory _$ConditionContentEmptyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConditionContentEmptyImplFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ConditionContent.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionContentEmptyImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String record) subjective,
    required TResult Function(List<ConditionContentAttachment> attachments)
        photo,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String record)? subjective,
    TResult? Function(List<ConditionContentAttachment> attachments)? photo,
    TResult? Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String record)? subjective,
    TResult Function(List<ConditionContentAttachment> attachments)? photo,
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
    required TResult Function(ConditionContentSubjective value) subjective,
    required TResult Function(ConditionContentPhoto value) photo,
    required TResult Function(ConditionContentEmpty value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConditionContentSubjective value)? subjective,
    TResult? Function(ConditionContentPhoto value)? photo,
    TResult? Function(ConditionContentEmpty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConditionContentSubjective value)? subjective,
    TResult Function(ConditionContentPhoto value)? photo,
    TResult Function(ConditionContentEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionContentEmptyImplToJson(
      this,
    );
  }
}

abstract class ConditionContentEmpty implements ConditionContent {
  const factory ConditionContentEmpty() = _$ConditionContentEmptyImpl;

  factory ConditionContentEmpty.fromJson(Map<String, dynamic> json) =
      _$ConditionContentEmptyImpl.fromJson;
}

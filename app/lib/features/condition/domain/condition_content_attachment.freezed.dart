// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'condition_content_attachment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConditionContentAttachment _$ConditionContentAttachmentFromJson(
    Map<String, dynamic> json) {
  return _ConditionContentAttachment.fromJson(json);
}

/// @nodoc
mixin _$ConditionContentAttachment {
  /// gs://パス
  String get gsPath => throw _privateConstructorUsedError;

  /// 添付ファイルに対する処理状況
  ConditionState get state => throw _privateConstructorUsedError;

  /// 代替テキスト
  String? get alt => throw _privateConstructorUsedError;

  /// Serializes this ConditionContentAttachment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConditionContentAttachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConditionContentAttachmentCopyWith<ConditionContentAttachment>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConditionContentAttachmentCopyWith<$Res> {
  factory $ConditionContentAttachmentCopyWith(ConditionContentAttachment value,
          $Res Function(ConditionContentAttachment) then) =
      _$ConditionContentAttachmentCopyWithImpl<$Res,
          ConditionContentAttachment>;
  @useResult
  $Res call({String gsPath, ConditionState state, String? alt});
}

/// @nodoc
class _$ConditionContentAttachmentCopyWithImpl<$Res,
        $Val extends ConditionContentAttachment>
    implements $ConditionContentAttachmentCopyWith<$Res> {
  _$ConditionContentAttachmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConditionContentAttachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gsPath = null,
    Object? state = null,
    Object? alt = freezed,
  }) {
    return _then(_value.copyWith(
      gsPath: null == gsPath
          ? _value.gsPath
          : gsPath // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ConditionState,
      alt: freezed == alt
          ? _value.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConditionContentAttachmentImplCopyWith<$Res>
    implements $ConditionContentAttachmentCopyWith<$Res> {
  factory _$$ConditionContentAttachmentImplCopyWith(
          _$ConditionContentAttachmentImpl value,
          $Res Function(_$ConditionContentAttachmentImpl) then) =
      __$$ConditionContentAttachmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String gsPath, ConditionState state, String? alt});
}

/// @nodoc
class __$$ConditionContentAttachmentImplCopyWithImpl<$Res>
    extends _$ConditionContentAttachmentCopyWithImpl<$Res,
        _$ConditionContentAttachmentImpl>
    implements _$$ConditionContentAttachmentImplCopyWith<$Res> {
  __$$ConditionContentAttachmentImplCopyWithImpl(
      _$ConditionContentAttachmentImpl _value,
      $Res Function(_$ConditionContentAttachmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConditionContentAttachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gsPath = null,
    Object? state = null,
    Object? alt = freezed,
  }) {
    return _then(_$ConditionContentAttachmentImpl(
      gsPath: null == gsPath
          ? _value.gsPath
          : gsPath // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ConditionState,
      alt: freezed == alt
          ? _value.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConditionContentAttachmentImpl implements _ConditionContentAttachment {
  const _$ConditionContentAttachmentImpl(
      {required this.gsPath, required this.state, this.alt});

  factory _$ConditionContentAttachmentImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConditionContentAttachmentImplFromJson(json);

  /// gs://パス
  @override
  final String gsPath;

  /// 添付ファイルに対する処理状況
  @override
  final ConditionState state;

  /// 代替テキスト
  @override
  final String? alt;

  @override
  String toString() {
    return 'ConditionContentAttachment(gsPath: $gsPath, state: $state, alt: $alt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionContentAttachmentImpl &&
            (identical(other.gsPath, gsPath) || other.gsPath == gsPath) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.alt, alt) || other.alt == alt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, gsPath, state, alt);

  /// Create a copy of ConditionContentAttachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConditionContentAttachmentImplCopyWith<_$ConditionContentAttachmentImpl>
      get copyWith => __$$ConditionContentAttachmentImplCopyWithImpl<
          _$ConditionContentAttachmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionContentAttachmentImplToJson(
      this,
    );
  }
}

abstract class _ConditionContentAttachment
    implements ConditionContentAttachment {
  const factory _ConditionContentAttachment(
      {required final String gsPath,
      required final ConditionState state,
      final String? alt}) = _$ConditionContentAttachmentImpl;

  factory _ConditionContentAttachment.fromJson(Map<String, dynamic> json) =
      _$ConditionContentAttachmentImpl.fromJson;

  /// gs://パス
  @override
  String get gsPath;

  /// 添付ファイルに対する処理状況
  @override
  ConditionState get state;

  /// 代替テキスト
  @override
  String? get alt;

  /// Create a copy of ConditionContentAttachment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConditionContentAttachmentImplCopyWith<_$ConditionContentAttachmentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

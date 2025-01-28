// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'condition_content_audio_attachment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConditionContentAudioAttachment _$ConditionContentAudioAttachmentFromJson(
    Map<String, dynamic> json) {
  return _ConditionContentAudioAttachment.fromJson(json);
}

/// @nodoc
mixin _$ConditionContentAudioAttachment {
  /// gs://パス
  String get fileUri => throw _privateConstructorUsedError;
  String get mimeType => throw _privateConstructorUsedError;

  /// Serializes this ConditionContentAudioAttachment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConditionContentAudioAttachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConditionContentAudioAttachmentCopyWith<ConditionContentAudioAttachment>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConditionContentAudioAttachmentCopyWith<$Res> {
  factory $ConditionContentAudioAttachmentCopyWith(
          ConditionContentAudioAttachment value,
          $Res Function(ConditionContentAudioAttachment) then) =
      _$ConditionContentAudioAttachmentCopyWithImpl<$Res,
          ConditionContentAudioAttachment>;
  @useResult
  $Res call({String fileUri, String mimeType});
}

/// @nodoc
class _$ConditionContentAudioAttachmentCopyWithImpl<$Res,
        $Val extends ConditionContentAudioAttachment>
    implements $ConditionContentAudioAttachmentCopyWith<$Res> {
  _$ConditionContentAudioAttachmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConditionContentAudioAttachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileUri = null,
    Object? mimeType = null,
  }) {
    return _then(_value.copyWith(
      fileUri: null == fileUri
          ? _value.fileUri
          : fileUri // ignore: cast_nullable_to_non_nullable
              as String,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConditionContentAudioAttachmentImplCopyWith<$Res>
    implements $ConditionContentAudioAttachmentCopyWith<$Res> {
  factory _$$ConditionContentAudioAttachmentImplCopyWith(
          _$ConditionContentAudioAttachmentImpl value,
          $Res Function(_$ConditionContentAudioAttachmentImpl) then) =
      __$$ConditionContentAudioAttachmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fileUri, String mimeType});
}

/// @nodoc
class __$$ConditionContentAudioAttachmentImplCopyWithImpl<$Res>
    extends _$ConditionContentAudioAttachmentCopyWithImpl<$Res,
        _$ConditionContentAudioAttachmentImpl>
    implements _$$ConditionContentAudioAttachmentImplCopyWith<$Res> {
  __$$ConditionContentAudioAttachmentImplCopyWithImpl(
      _$ConditionContentAudioAttachmentImpl _value,
      $Res Function(_$ConditionContentAudioAttachmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConditionContentAudioAttachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileUri = null,
    Object? mimeType = null,
  }) {
    return _then(_$ConditionContentAudioAttachmentImpl(
      fileUri: null == fileUri
          ? _value.fileUri
          : fileUri // ignore: cast_nullable_to_non_nullable
              as String,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConditionContentAudioAttachmentImpl
    implements _ConditionContentAudioAttachment {
  const _$ConditionContentAudioAttachmentImpl(
      {required this.fileUri, required this.mimeType});

  factory _$ConditionContentAudioAttachmentImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConditionContentAudioAttachmentImplFromJson(json);

  /// gs://パス
  @override
  final String fileUri;
  @override
  final String mimeType;

  @override
  String toString() {
    return 'ConditionContentAudioAttachment(fileUri: $fileUri, mimeType: $mimeType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionContentAudioAttachmentImpl &&
            (identical(other.fileUri, fileUri) || other.fileUri == fileUri) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fileUri, mimeType);

  /// Create a copy of ConditionContentAudioAttachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConditionContentAudioAttachmentImplCopyWith<
          _$ConditionContentAudioAttachmentImpl>
      get copyWith => __$$ConditionContentAudioAttachmentImplCopyWithImpl<
          _$ConditionContentAudioAttachmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionContentAudioAttachmentImplToJson(
      this,
    );
  }
}

abstract class _ConditionContentAudioAttachment
    implements ConditionContentAudioAttachment {
  const factory _ConditionContentAudioAttachment(
      {required final String fileUri,
      required final String mimeType}) = _$ConditionContentAudioAttachmentImpl;

  factory _ConditionContentAudioAttachment.fromJson(Map<String, dynamic> json) =
      _$ConditionContentAudioAttachmentImpl.fromJson;

  /// gs://パス
  @override
  String get fileUri;
  @override
  String get mimeType;

  /// Create a copy of ConditionContentAudioAttachment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConditionContentAudioAttachmentImplCopyWith<
          _$ConditionContentAudioAttachmentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

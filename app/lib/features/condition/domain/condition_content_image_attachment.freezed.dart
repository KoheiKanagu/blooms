// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'condition_content_image_attachment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConditionContentImageAttachment _$ConditionContentImageAttachmentFromJson(
    Map<String, dynamic> json) {
  return _ConditionContentImageAttachment.fromJson(json);
}

/// @nodoc
mixin _$ConditionContentImageAttachment {
  /// gs://パス
  String get fileUri => throw _privateConstructorUsedError;
  String get mimeType => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  ConditionContentImageAttachmentAdditionalInfo get additionalInfo =>
      throw _privateConstructorUsedError;

  /// Serializes this ConditionContentImageAttachment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConditionContentImageAttachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConditionContentImageAttachmentCopyWith<ConditionContentImageAttachment>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConditionContentImageAttachmentCopyWith<$Res> {
  factory $ConditionContentImageAttachmentCopyWith(
          ConditionContentImageAttachment value,
          $Res Function(ConditionContentImageAttachment) then) =
      _$ConditionContentImageAttachmentCopyWithImpl<$Res,
          ConditionContentImageAttachment>;
  @useResult
  $Res call(
      {String fileUri,
      String mimeType,
      int width,
      int height,
      ConditionContentImageAttachmentAdditionalInfo additionalInfo});

  $ConditionContentImageAttachmentAdditionalInfoCopyWith<$Res>
      get additionalInfo;
}

/// @nodoc
class _$ConditionContentImageAttachmentCopyWithImpl<$Res,
        $Val extends ConditionContentImageAttachment>
    implements $ConditionContentImageAttachmentCopyWith<$Res> {
  _$ConditionContentImageAttachmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConditionContentImageAttachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileUri = null,
    Object? mimeType = null,
    Object? width = null,
    Object? height = null,
    Object? additionalInfo = null,
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
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      additionalInfo: null == additionalInfo
          ? _value.additionalInfo
          : additionalInfo // ignore: cast_nullable_to_non_nullable
              as ConditionContentImageAttachmentAdditionalInfo,
    ) as $Val);
  }

  /// Create a copy of ConditionContentImageAttachment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConditionContentImageAttachmentAdditionalInfoCopyWith<$Res>
      get additionalInfo {
    return $ConditionContentImageAttachmentAdditionalInfoCopyWith<$Res>(
        _value.additionalInfo, (value) {
      return _then(_value.copyWith(additionalInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConditionContentImageAttachmentImplCopyWith<$Res>
    implements $ConditionContentImageAttachmentCopyWith<$Res> {
  factory _$$ConditionContentImageAttachmentImplCopyWith(
          _$ConditionContentImageAttachmentImpl value,
          $Res Function(_$ConditionContentImageAttachmentImpl) then) =
      __$$ConditionContentImageAttachmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fileUri,
      String mimeType,
      int width,
      int height,
      ConditionContentImageAttachmentAdditionalInfo additionalInfo});

  @override
  $ConditionContentImageAttachmentAdditionalInfoCopyWith<$Res>
      get additionalInfo;
}

/// @nodoc
class __$$ConditionContentImageAttachmentImplCopyWithImpl<$Res>
    extends _$ConditionContentImageAttachmentCopyWithImpl<$Res,
        _$ConditionContentImageAttachmentImpl>
    implements _$$ConditionContentImageAttachmentImplCopyWith<$Res> {
  __$$ConditionContentImageAttachmentImplCopyWithImpl(
      _$ConditionContentImageAttachmentImpl _value,
      $Res Function(_$ConditionContentImageAttachmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConditionContentImageAttachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileUri = null,
    Object? mimeType = null,
    Object? width = null,
    Object? height = null,
    Object? additionalInfo = null,
  }) {
    return _then(_$ConditionContentImageAttachmentImpl(
      fileUri: null == fileUri
          ? _value.fileUri
          : fileUri // ignore: cast_nullable_to_non_nullable
              as String,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      additionalInfo: null == additionalInfo
          ? _value.additionalInfo
          : additionalInfo // ignore: cast_nullable_to_non_nullable
              as ConditionContentImageAttachmentAdditionalInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConditionContentImageAttachmentImpl
    implements _ConditionContentImageAttachment {
  const _$ConditionContentImageAttachmentImpl(
      {required this.fileUri,
      required this.mimeType,
      required this.width,
      required this.height,
      required this.additionalInfo});

  factory _$ConditionContentImageAttachmentImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConditionContentImageAttachmentImplFromJson(json);

  /// gs://パス
  @override
  final String fileUri;
  @override
  final String mimeType;
  @override
  final int width;
  @override
  final int height;
  @override
  final ConditionContentImageAttachmentAdditionalInfo additionalInfo;

  @override
  String toString() {
    return 'ConditionContentImageAttachment(fileUri: $fileUri, mimeType: $mimeType, width: $width, height: $height, additionalInfo: $additionalInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionContentImageAttachmentImpl &&
            (identical(other.fileUri, fileUri) || other.fileUri == fileUri) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.additionalInfo, additionalInfo) ||
                other.additionalInfo == additionalInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, fileUri, mimeType, width, height, additionalInfo);

  /// Create a copy of ConditionContentImageAttachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConditionContentImageAttachmentImplCopyWith<
          _$ConditionContentImageAttachmentImpl>
      get copyWith => __$$ConditionContentImageAttachmentImplCopyWithImpl<
          _$ConditionContentImageAttachmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionContentImageAttachmentImplToJson(
      this,
    );
  }
}

abstract class _ConditionContentImageAttachment
    implements ConditionContentImageAttachment {
  const factory _ConditionContentImageAttachment(
      {required final String fileUri,
      required final String mimeType,
      required final int width,
      required final int height,
      required final ConditionContentImageAttachmentAdditionalInfo
          additionalInfo}) = _$ConditionContentImageAttachmentImpl;

  factory _ConditionContentImageAttachment.fromJson(Map<String, dynamic> json) =
      _$ConditionContentImageAttachmentImpl.fromJson;

  /// gs://パス
  @override
  String get fileUri;
  @override
  String get mimeType;
  @override
  int get width;
  @override
  int get height;
  @override
  ConditionContentImageAttachmentAdditionalInfo get additionalInfo;

  /// Create a copy of ConditionContentImageAttachment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConditionContentImageAttachmentImplCopyWith<
          _$ConditionContentImageAttachmentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ConditionContentImageAttachmentAdditionalInfo
    _$ConditionContentImageAttachmentAdditionalInfoFromJson(
        Map<String, dynamic> json) {
  return _ConditionContentImageAttachmentAdditionalInfo.fromJson(json);
}

/// @nodoc
mixin _$ConditionContentImageAttachmentAdditionalInfo {
  String? get blurHash => throw _privateConstructorUsedError;

  /// Serializes this ConditionContentImageAttachmentAdditionalInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConditionContentImageAttachmentAdditionalInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConditionContentImageAttachmentAdditionalInfoCopyWith<
          ConditionContentImageAttachmentAdditionalInfo>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConditionContentImageAttachmentAdditionalInfoCopyWith<$Res> {
  factory $ConditionContentImageAttachmentAdditionalInfoCopyWith(
          ConditionContentImageAttachmentAdditionalInfo value,
          $Res Function(ConditionContentImageAttachmentAdditionalInfo) then) =
      _$ConditionContentImageAttachmentAdditionalInfoCopyWithImpl<$Res,
          ConditionContentImageAttachmentAdditionalInfo>;
  @useResult
  $Res call({String? blurHash});
}

/// @nodoc
class _$ConditionContentImageAttachmentAdditionalInfoCopyWithImpl<$Res,
        $Val extends ConditionContentImageAttachmentAdditionalInfo>
    implements $ConditionContentImageAttachmentAdditionalInfoCopyWith<$Res> {
  _$ConditionContentImageAttachmentAdditionalInfoCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConditionContentImageAttachmentAdditionalInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blurHash = freezed,
  }) {
    return _then(_value.copyWith(
      blurHash: freezed == blurHash
          ? _value.blurHash
          : blurHash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConditionContentImageAttachmentAdditionalInfoImplCopyWith<
        $Res>
    implements $ConditionContentImageAttachmentAdditionalInfoCopyWith<$Res> {
  factory _$$ConditionContentImageAttachmentAdditionalInfoImplCopyWith(
          _$ConditionContentImageAttachmentAdditionalInfoImpl value,
          $Res Function(_$ConditionContentImageAttachmentAdditionalInfoImpl)
              then) =
      __$$ConditionContentImageAttachmentAdditionalInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? blurHash});
}

/// @nodoc
class __$$ConditionContentImageAttachmentAdditionalInfoImplCopyWithImpl<$Res>
    extends _$ConditionContentImageAttachmentAdditionalInfoCopyWithImpl<$Res,
        _$ConditionContentImageAttachmentAdditionalInfoImpl>
    implements
        _$$ConditionContentImageAttachmentAdditionalInfoImplCopyWith<$Res> {
  __$$ConditionContentImageAttachmentAdditionalInfoImplCopyWithImpl(
      _$ConditionContentImageAttachmentAdditionalInfoImpl _value,
      $Res Function(_$ConditionContentImageAttachmentAdditionalInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConditionContentImageAttachmentAdditionalInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blurHash = freezed,
  }) {
    return _then(_$ConditionContentImageAttachmentAdditionalInfoImpl(
      blurHash: freezed == blurHash
          ? _value.blurHash
          : blurHash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConditionContentImageAttachmentAdditionalInfoImpl
    implements _ConditionContentImageAttachmentAdditionalInfo {
  const _$ConditionContentImageAttachmentAdditionalInfoImpl({this.blurHash});

  factory _$ConditionContentImageAttachmentAdditionalInfoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConditionContentImageAttachmentAdditionalInfoImplFromJson(json);

  @override
  final String? blurHash;

  @override
  String toString() {
    return 'ConditionContentImageAttachmentAdditionalInfo(blurHash: $blurHash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionContentImageAttachmentAdditionalInfoImpl &&
            (identical(other.blurHash, blurHash) ||
                other.blurHash == blurHash));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, blurHash);

  /// Create a copy of ConditionContentImageAttachmentAdditionalInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConditionContentImageAttachmentAdditionalInfoImplCopyWith<
          _$ConditionContentImageAttachmentAdditionalInfoImpl>
      get copyWith =>
          __$$ConditionContentImageAttachmentAdditionalInfoImplCopyWithImpl<
                  _$ConditionContentImageAttachmentAdditionalInfoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionContentImageAttachmentAdditionalInfoImplToJson(
      this,
    );
  }
}

abstract class _ConditionContentImageAttachmentAdditionalInfo
    implements ConditionContentImageAttachmentAdditionalInfo {
  const factory _ConditionContentImageAttachmentAdditionalInfo(
          {final String? blurHash}) =
      _$ConditionContentImageAttachmentAdditionalInfoImpl;

  factory _ConditionContentImageAttachmentAdditionalInfo.fromJson(
          Map<String, dynamic> json) =
      _$ConditionContentImageAttachmentAdditionalInfoImpl.fromJson;

  @override
  String? get blurHash;

  /// Create a copy of ConditionContentImageAttachmentAdditionalInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConditionContentImageAttachmentAdditionalInfoImplCopyWith<
          _$ConditionContentImageAttachmentAdditionalInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

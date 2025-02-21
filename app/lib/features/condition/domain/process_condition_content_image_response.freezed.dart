// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'process_condition_content_image_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProcessConditionContentImageResponse
_$ProcessConditionContentImageResponseFromJson(Map<String, dynamic> json) {
  return _ProcessConditionContentImageResponse.fromJson(json);
}

/// @nodoc
mixin _$ProcessConditionContentImageResponse {
  String get gsFilePath => throw _privateConstructorUsedError;
  String get blurHash => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  String get mimeType => throw _privateConstructorUsedError;

  /// Serializes this ProcessConditionContentImageResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProcessConditionContentImageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProcessConditionContentImageResponseCopyWith<
    ProcessConditionContentImageResponse
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessConditionContentImageResponseCopyWith<$Res> {
  factory $ProcessConditionContentImageResponseCopyWith(
    ProcessConditionContentImageResponse value,
    $Res Function(ProcessConditionContentImageResponse) then,
  ) =
      _$ProcessConditionContentImageResponseCopyWithImpl<
        $Res,
        ProcessConditionContentImageResponse
      >;
  @useResult
  $Res call({
    String gsFilePath,
    String blurHash,
    int width,
    int height,
    String mimeType,
  });
}

/// @nodoc
class _$ProcessConditionContentImageResponseCopyWithImpl<
  $Res,
  $Val extends ProcessConditionContentImageResponse
>
    implements $ProcessConditionContentImageResponseCopyWith<$Res> {
  _$ProcessConditionContentImageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProcessConditionContentImageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gsFilePath = null,
    Object? blurHash = null,
    Object? width = null,
    Object? height = null,
    Object? mimeType = null,
  }) {
    return _then(
      _value.copyWith(
            gsFilePath:
                null == gsFilePath
                    ? _value.gsFilePath
                    : gsFilePath // ignore: cast_nullable_to_non_nullable
                        as String,
            blurHash:
                null == blurHash
                    ? _value.blurHash
                    : blurHash // ignore: cast_nullable_to_non_nullable
                        as String,
            width:
                null == width
                    ? _value.width
                    : width // ignore: cast_nullable_to_non_nullable
                        as int,
            height:
                null == height
                    ? _value.height
                    : height // ignore: cast_nullable_to_non_nullable
                        as int,
            mimeType:
                null == mimeType
                    ? _value.mimeType
                    : mimeType // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProcessConditionContentImageResponseImplCopyWith<$Res>
    implements $ProcessConditionContentImageResponseCopyWith<$Res> {
  factory _$$ProcessConditionContentImageResponseImplCopyWith(
    _$ProcessConditionContentImageResponseImpl value,
    $Res Function(_$ProcessConditionContentImageResponseImpl) then,
  ) = __$$ProcessConditionContentImageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String gsFilePath,
    String blurHash,
    int width,
    int height,
    String mimeType,
  });
}

/// @nodoc
class __$$ProcessConditionContentImageResponseImplCopyWithImpl<$Res>
    extends
        _$ProcessConditionContentImageResponseCopyWithImpl<
          $Res,
          _$ProcessConditionContentImageResponseImpl
        >
    implements _$$ProcessConditionContentImageResponseImplCopyWith<$Res> {
  __$$ProcessConditionContentImageResponseImplCopyWithImpl(
    _$ProcessConditionContentImageResponseImpl _value,
    $Res Function(_$ProcessConditionContentImageResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProcessConditionContentImageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gsFilePath = null,
    Object? blurHash = null,
    Object? width = null,
    Object? height = null,
    Object? mimeType = null,
  }) {
    return _then(
      _$ProcessConditionContentImageResponseImpl(
        gsFilePath:
            null == gsFilePath
                ? _value.gsFilePath
                : gsFilePath // ignore: cast_nullable_to_non_nullable
                    as String,
        blurHash:
            null == blurHash
                ? _value.blurHash
                : blurHash // ignore: cast_nullable_to_non_nullable
                    as String,
        width:
            null == width
                ? _value.width
                : width // ignore: cast_nullable_to_non_nullable
                    as int,
        height:
            null == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                    as int,
        mimeType:
            null == mimeType
                ? _value.mimeType
                : mimeType // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessConditionContentImageResponseImpl
    implements _ProcessConditionContentImageResponse {
  const _$ProcessConditionContentImageResponseImpl({
    required this.gsFilePath,
    required this.blurHash,
    required this.width,
    required this.height,
    required this.mimeType,
  });

  factory _$ProcessConditionContentImageResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$ProcessConditionContentImageResponseImplFromJson(json);

  @override
  final String gsFilePath;
  @override
  final String blurHash;
  @override
  final int width;
  @override
  final int height;
  @override
  final String mimeType;

  @override
  String toString() {
    return 'ProcessConditionContentImageResponse(gsFilePath: $gsFilePath, blurHash: $blurHash, width: $width, height: $height, mimeType: $mimeType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessConditionContentImageResponseImpl &&
            (identical(other.gsFilePath, gsFilePath) ||
                other.gsFilePath == gsFilePath) &&
            (identical(other.blurHash, blurHash) ||
                other.blurHash == blurHash) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, gsFilePath, blurHash, width, height, mimeType);

  /// Create a copy of ProcessConditionContentImageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessConditionContentImageResponseImplCopyWith<
    _$ProcessConditionContentImageResponseImpl
  >
  get copyWith => __$$ProcessConditionContentImageResponseImplCopyWithImpl<
    _$ProcessConditionContentImageResponseImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessConditionContentImageResponseImplToJson(this);
  }
}

abstract class _ProcessConditionContentImageResponse
    implements ProcessConditionContentImageResponse {
  const factory _ProcessConditionContentImageResponse({
    required final String gsFilePath,
    required final String blurHash,
    required final int width,
    required final int height,
    required final String mimeType,
  }) = _$ProcessConditionContentImageResponseImpl;

  factory _ProcessConditionContentImageResponse.fromJson(
    Map<String, dynamic> json,
  ) = _$ProcessConditionContentImageResponseImpl.fromJson;

  @override
  String get gsFilePath;
  @override
  String get blurHash;
  @override
  int get width;
  @override
  int get height;
  @override
  String get mimeType;

  /// Create a copy of ProcessConditionContentImageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProcessConditionContentImageResponseImplCopyWith<
    _$ProcessConditionContentImageResponseImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

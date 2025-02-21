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
    case 'text':
      return ConditionContentText.fromJson(json);
    case 'textWithSearchKeywords':
      return ConditionContentTextWithSearchKeywords.fromJson(json);
    case 'image':
      return ConditionContentImage.fromJson(json);
    case 'audio':
      return ConditionContentAudio.fromJson(json);

    default:
      return ConditionContentEmpty.fromJson(json);
  }
}

/// @nodoc
mixin _$ConditionContent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) text,
    required TResult Function(String text, List<String> searchKeywords)
        textWithSearchKeywords,
    required TResult Function(List<ConditionContentImageAttachment> attachments)
        image,
    required TResult Function(List<ConditionContentAudioAttachment> attachments)
        audio,
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? text,
    TResult? Function(String text, List<String> searchKeywords)?
        textWithSearchKeywords,
    TResult? Function(List<ConditionContentImageAttachment> attachments)? image,
    TResult? Function(List<ConditionContentAudioAttachment> attachments)? audio,
    TResult? Function()? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? text,
    TResult Function(String text, List<String> searchKeywords)?
        textWithSearchKeywords,
    TResult Function(List<ConditionContentImageAttachment> attachments)? image,
    TResult Function(List<ConditionContentAudioAttachment> attachments)? audio,
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConditionContentText value) text,
    required TResult Function(ConditionContentTextWithSearchKeywords value)
        textWithSearchKeywords,
    required TResult Function(ConditionContentImage value) image,
    required TResult Function(ConditionContentAudio value) audio,
    required TResult Function(ConditionContentEmpty value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConditionContentText value)? text,
    TResult? Function(ConditionContentTextWithSearchKeywords value)?
        textWithSearchKeywords,
    TResult? Function(ConditionContentImage value)? image,
    TResult? Function(ConditionContentAudio value)? audio,
    TResult? Function(ConditionContentEmpty value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConditionContentText value)? text,
    TResult Function(ConditionContentTextWithSearchKeywords value)?
        textWithSearchKeywords,
    TResult Function(ConditionContentImage value)? image,
    TResult Function(ConditionContentAudio value)? audio,
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
abstract class _$$ConditionContentTextImplCopyWith<$Res> {
  factory _$$ConditionContentTextImplCopyWith(_$ConditionContentTextImpl value,
          $Res Function(_$ConditionContentTextImpl) then) =
      __$$ConditionContentTextImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$ConditionContentTextImplCopyWithImpl<$Res>
    extends _$ConditionContentCopyWithImpl<$Res, _$ConditionContentTextImpl>
    implements _$$ConditionContentTextImplCopyWith<$Res> {
  __$$ConditionContentTextImplCopyWithImpl(_$ConditionContentTextImpl _value,
      $Res Function(_$ConditionContentTextImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConditionContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$ConditionContentTextImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConditionContentTextImpl implements ConditionContentText {
  const _$ConditionContentTextImpl({required this.text, final String? $type})
      : $type = $type ?? 'text';

  factory _$ConditionContentTextImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConditionContentTextImplFromJson(json);

  @override
  final String text;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ConditionContent.text(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionContentTextImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text);

  /// Create a copy of ConditionContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConditionContentTextImplCopyWith<_$ConditionContentTextImpl>
      get copyWith =>
          __$$ConditionContentTextImplCopyWithImpl<_$ConditionContentTextImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) text,
    required TResult Function(String text, List<String> searchKeywords)
        textWithSearchKeywords,
    required TResult Function(List<ConditionContentImageAttachment> attachments)
        image,
    required TResult Function(List<ConditionContentAudioAttachment> attachments)
        audio,
    required TResult Function() empty,
  }) {
    return text(this.text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? text,
    TResult? Function(String text, List<String> searchKeywords)?
        textWithSearchKeywords,
    TResult? Function(List<ConditionContentImageAttachment> attachments)? image,
    TResult? Function(List<ConditionContentAudioAttachment> attachments)? audio,
    TResult? Function()? empty,
  }) {
    return text?.call(this.text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? text,
    TResult Function(String text, List<String> searchKeywords)?
        textWithSearchKeywords,
    TResult Function(List<ConditionContentImageAttachment> attachments)? image,
    TResult Function(List<ConditionContentAudioAttachment> attachments)? audio,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this.text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConditionContentText value) text,
    required TResult Function(ConditionContentTextWithSearchKeywords value)
        textWithSearchKeywords,
    required TResult Function(ConditionContentImage value) image,
    required TResult Function(ConditionContentAudio value) audio,
    required TResult Function(ConditionContentEmpty value) empty,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConditionContentText value)? text,
    TResult? Function(ConditionContentTextWithSearchKeywords value)?
        textWithSearchKeywords,
    TResult? Function(ConditionContentImage value)? image,
    TResult? Function(ConditionContentAudio value)? audio,
    TResult? Function(ConditionContentEmpty value)? empty,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConditionContentText value)? text,
    TResult Function(ConditionContentTextWithSearchKeywords value)?
        textWithSearchKeywords,
    TResult Function(ConditionContentImage value)? image,
    TResult Function(ConditionContentAudio value)? audio,
    TResult Function(ConditionContentEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionContentTextImplToJson(
      this,
    );
  }
}

abstract class ConditionContentText implements ConditionContent {
  const factory ConditionContentText({required final String text}) =
      _$ConditionContentTextImpl;

  factory ConditionContentText.fromJson(Map<String, dynamic> json) =
      _$ConditionContentTextImpl.fromJson;

  String get text;

  /// Create a copy of ConditionContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConditionContentTextImplCopyWith<_$ConditionContentTextImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConditionContentTextWithSearchKeywordsImplCopyWith<$Res> {
  factory _$$ConditionContentTextWithSearchKeywordsImplCopyWith(
          _$ConditionContentTextWithSearchKeywordsImpl value,
          $Res Function(_$ConditionContentTextWithSearchKeywordsImpl) then) =
      __$$ConditionContentTextWithSearchKeywordsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text, List<String> searchKeywords});
}

/// @nodoc
class __$$ConditionContentTextWithSearchKeywordsImplCopyWithImpl<$Res>
    extends _$ConditionContentCopyWithImpl<$Res,
        _$ConditionContentTextWithSearchKeywordsImpl>
    implements _$$ConditionContentTextWithSearchKeywordsImplCopyWith<$Res> {
  __$$ConditionContentTextWithSearchKeywordsImplCopyWithImpl(
      _$ConditionContentTextWithSearchKeywordsImpl _value,
      $Res Function(_$ConditionContentTextWithSearchKeywordsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConditionContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? searchKeywords = null,
  }) {
    return _then(_$ConditionContentTextWithSearchKeywordsImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      searchKeywords: null == searchKeywords
          ? _value._searchKeywords
          : searchKeywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConditionContentTextWithSearchKeywordsImpl
    implements ConditionContentTextWithSearchKeywords {
  const _$ConditionContentTextWithSearchKeywordsImpl(
      {required this.text,
      required final List<String> searchKeywords,
      final String? $type})
      : _searchKeywords = searchKeywords,
        $type = $type ?? 'textWithSearchKeywords';

  factory _$ConditionContentTextWithSearchKeywordsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConditionContentTextWithSearchKeywordsImplFromJson(json);

  @override
  final String text;
  final List<String> _searchKeywords;
  @override
  List<String> get searchKeywords {
    if (_searchKeywords is EqualUnmodifiableListView) return _searchKeywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchKeywords);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ConditionContent.textWithSearchKeywords(text: $text, searchKeywords: $searchKeywords)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionContentTextWithSearchKeywordsImpl &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality()
                .equals(other._searchKeywords, _searchKeywords));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, text, const DeepCollectionEquality().hash(_searchKeywords));

  /// Create a copy of ConditionContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConditionContentTextWithSearchKeywordsImplCopyWith<
          _$ConditionContentTextWithSearchKeywordsImpl>
      get copyWith =>
          __$$ConditionContentTextWithSearchKeywordsImplCopyWithImpl<
              _$ConditionContentTextWithSearchKeywordsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) text,
    required TResult Function(String text, List<String> searchKeywords)
        textWithSearchKeywords,
    required TResult Function(List<ConditionContentImageAttachment> attachments)
        image,
    required TResult Function(List<ConditionContentAudioAttachment> attachments)
        audio,
    required TResult Function() empty,
  }) {
    return textWithSearchKeywords(this.text, searchKeywords);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? text,
    TResult? Function(String text, List<String> searchKeywords)?
        textWithSearchKeywords,
    TResult? Function(List<ConditionContentImageAttachment> attachments)? image,
    TResult? Function(List<ConditionContentAudioAttachment> attachments)? audio,
    TResult? Function()? empty,
  }) {
    return textWithSearchKeywords?.call(this.text, searchKeywords);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? text,
    TResult Function(String text, List<String> searchKeywords)?
        textWithSearchKeywords,
    TResult Function(List<ConditionContentImageAttachment> attachments)? image,
    TResult Function(List<ConditionContentAudioAttachment> attachments)? audio,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (textWithSearchKeywords != null) {
      return textWithSearchKeywords(this.text, searchKeywords);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConditionContentText value) text,
    required TResult Function(ConditionContentTextWithSearchKeywords value)
        textWithSearchKeywords,
    required TResult Function(ConditionContentImage value) image,
    required TResult Function(ConditionContentAudio value) audio,
    required TResult Function(ConditionContentEmpty value) empty,
  }) {
    return textWithSearchKeywords(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConditionContentText value)? text,
    TResult? Function(ConditionContentTextWithSearchKeywords value)?
        textWithSearchKeywords,
    TResult? Function(ConditionContentImage value)? image,
    TResult? Function(ConditionContentAudio value)? audio,
    TResult? Function(ConditionContentEmpty value)? empty,
  }) {
    return textWithSearchKeywords?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConditionContentText value)? text,
    TResult Function(ConditionContentTextWithSearchKeywords value)?
        textWithSearchKeywords,
    TResult Function(ConditionContentImage value)? image,
    TResult Function(ConditionContentAudio value)? audio,
    TResult Function(ConditionContentEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (textWithSearchKeywords != null) {
      return textWithSearchKeywords(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionContentTextWithSearchKeywordsImplToJson(
      this,
    );
  }
}

abstract class ConditionContentTextWithSearchKeywords
    implements ConditionContent {
  const factory ConditionContentTextWithSearchKeywords(
          {required final String text,
          required final List<String> searchKeywords}) =
      _$ConditionContentTextWithSearchKeywordsImpl;

  factory ConditionContentTextWithSearchKeywords.fromJson(
          Map<String, dynamic> json) =
      _$ConditionContentTextWithSearchKeywordsImpl.fromJson;

  String get text;
  List<String> get searchKeywords;

  /// Create a copy of ConditionContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConditionContentTextWithSearchKeywordsImplCopyWith<
          _$ConditionContentTextWithSearchKeywordsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConditionContentImageImplCopyWith<$Res> {
  factory _$$ConditionContentImageImplCopyWith(
          _$ConditionContentImageImpl value,
          $Res Function(_$ConditionContentImageImpl) then) =
      __$$ConditionContentImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ConditionContentImageAttachment> attachments});
}

/// @nodoc
class __$$ConditionContentImageImplCopyWithImpl<$Res>
    extends _$ConditionContentCopyWithImpl<$Res, _$ConditionContentImageImpl>
    implements _$$ConditionContentImageImplCopyWith<$Res> {
  __$$ConditionContentImageImplCopyWithImpl(_$ConditionContentImageImpl _value,
      $Res Function(_$ConditionContentImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConditionContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attachments = null,
  }) {
    return _then(_$ConditionContentImageImpl(
      attachments: null == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<ConditionContentImageAttachment>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConditionContentImageImpl implements ConditionContentImage {
  const _$ConditionContentImageImpl(
      {required final List<ConditionContentImageAttachment> attachments,
      final String? $type})
      : _attachments = attachments,
        $type = $type ?? 'image';

  factory _$ConditionContentImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConditionContentImageImplFromJson(json);

  final List<ConditionContentImageAttachment> _attachments;
  @override
  List<ConditionContentImageAttachment> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ConditionContent.image(attachments: $attachments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionContentImageImpl &&
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
  _$$ConditionContentImageImplCopyWith<_$ConditionContentImageImpl>
      get copyWith => __$$ConditionContentImageImplCopyWithImpl<
          _$ConditionContentImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) text,
    required TResult Function(String text, List<String> searchKeywords)
        textWithSearchKeywords,
    required TResult Function(List<ConditionContentImageAttachment> attachments)
        image,
    required TResult Function(List<ConditionContentAudioAttachment> attachments)
        audio,
    required TResult Function() empty,
  }) {
    return image(attachments);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? text,
    TResult? Function(String text, List<String> searchKeywords)?
        textWithSearchKeywords,
    TResult? Function(List<ConditionContentImageAttachment> attachments)? image,
    TResult? Function(List<ConditionContentAudioAttachment> attachments)? audio,
    TResult? Function()? empty,
  }) {
    return image?.call(attachments);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? text,
    TResult Function(String text, List<String> searchKeywords)?
        textWithSearchKeywords,
    TResult Function(List<ConditionContentImageAttachment> attachments)? image,
    TResult Function(List<ConditionContentAudioAttachment> attachments)? audio,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (image != null) {
      return image(attachments);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConditionContentText value) text,
    required TResult Function(ConditionContentTextWithSearchKeywords value)
        textWithSearchKeywords,
    required TResult Function(ConditionContentImage value) image,
    required TResult Function(ConditionContentAudio value) audio,
    required TResult Function(ConditionContentEmpty value) empty,
  }) {
    return image(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConditionContentText value)? text,
    TResult? Function(ConditionContentTextWithSearchKeywords value)?
        textWithSearchKeywords,
    TResult? Function(ConditionContentImage value)? image,
    TResult? Function(ConditionContentAudio value)? audio,
    TResult? Function(ConditionContentEmpty value)? empty,
  }) {
    return image?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConditionContentText value)? text,
    TResult Function(ConditionContentTextWithSearchKeywords value)?
        textWithSearchKeywords,
    TResult Function(ConditionContentImage value)? image,
    TResult Function(ConditionContentAudio value)? audio,
    TResult Function(ConditionContentEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (image != null) {
      return image(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionContentImageImplToJson(
      this,
    );
  }
}

abstract class ConditionContentImage implements ConditionContent {
  const factory ConditionContentImage(
          {required final List<ConditionContentImageAttachment> attachments}) =
      _$ConditionContentImageImpl;

  factory ConditionContentImage.fromJson(Map<String, dynamic> json) =
      _$ConditionContentImageImpl.fromJson;

  List<ConditionContentImageAttachment> get attachments;

  /// Create a copy of ConditionContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConditionContentImageImplCopyWith<_$ConditionContentImageImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConditionContentAudioImplCopyWith<$Res> {
  factory _$$ConditionContentAudioImplCopyWith(
          _$ConditionContentAudioImpl value,
          $Res Function(_$ConditionContentAudioImpl) then) =
      __$$ConditionContentAudioImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ConditionContentAudioAttachment> attachments});
}

/// @nodoc
class __$$ConditionContentAudioImplCopyWithImpl<$Res>
    extends _$ConditionContentCopyWithImpl<$Res, _$ConditionContentAudioImpl>
    implements _$$ConditionContentAudioImplCopyWith<$Res> {
  __$$ConditionContentAudioImplCopyWithImpl(_$ConditionContentAudioImpl _value,
      $Res Function(_$ConditionContentAudioImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConditionContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attachments = null,
  }) {
    return _then(_$ConditionContentAudioImpl(
      attachments: null == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<ConditionContentAudioAttachment>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConditionContentAudioImpl implements ConditionContentAudio {
  const _$ConditionContentAudioImpl(
      {required final List<ConditionContentAudioAttachment> attachments,
      final String? $type})
      : _attachments = attachments,
        $type = $type ?? 'audio';

  factory _$ConditionContentAudioImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConditionContentAudioImplFromJson(json);

  final List<ConditionContentAudioAttachment> _attachments;
  @override
  List<ConditionContentAudioAttachment> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ConditionContent.audio(attachments: $attachments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionContentAudioImpl &&
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
  _$$ConditionContentAudioImplCopyWith<_$ConditionContentAudioImpl>
      get copyWith => __$$ConditionContentAudioImplCopyWithImpl<
          _$ConditionContentAudioImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) text,
    required TResult Function(String text, List<String> searchKeywords)
        textWithSearchKeywords,
    required TResult Function(List<ConditionContentImageAttachment> attachments)
        image,
    required TResult Function(List<ConditionContentAudioAttachment> attachments)
        audio,
    required TResult Function() empty,
  }) {
    return audio(attachments);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? text,
    TResult? Function(String text, List<String> searchKeywords)?
        textWithSearchKeywords,
    TResult? Function(List<ConditionContentImageAttachment> attachments)? image,
    TResult? Function(List<ConditionContentAudioAttachment> attachments)? audio,
    TResult? Function()? empty,
  }) {
    return audio?.call(attachments);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? text,
    TResult Function(String text, List<String> searchKeywords)?
        textWithSearchKeywords,
    TResult Function(List<ConditionContentImageAttachment> attachments)? image,
    TResult Function(List<ConditionContentAudioAttachment> attachments)? audio,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (audio != null) {
      return audio(attachments);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConditionContentText value) text,
    required TResult Function(ConditionContentTextWithSearchKeywords value)
        textWithSearchKeywords,
    required TResult Function(ConditionContentImage value) image,
    required TResult Function(ConditionContentAudio value) audio,
    required TResult Function(ConditionContentEmpty value) empty,
  }) {
    return audio(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConditionContentText value)? text,
    TResult? Function(ConditionContentTextWithSearchKeywords value)?
        textWithSearchKeywords,
    TResult? Function(ConditionContentImage value)? image,
    TResult? Function(ConditionContentAudio value)? audio,
    TResult? Function(ConditionContentEmpty value)? empty,
  }) {
    return audio?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConditionContentText value)? text,
    TResult Function(ConditionContentTextWithSearchKeywords value)?
        textWithSearchKeywords,
    TResult Function(ConditionContentImage value)? image,
    TResult Function(ConditionContentAudio value)? audio,
    TResult Function(ConditionContentEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (audio != null) {
      return audio(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionContentAudioImplToJson(
      this,
    );
  }
}

abstract class ConditionContentAudio implements ConditionContent {
  const factory ConditionContentAudio(
          {required final List<ConditionContentAudioAttachment> attachments}) =
      _$ConditionContentAudioImpl;

  factory ConditionContentAudio.fromJson(Map<String, dynamic> json) =
      _$ConditionContentAudioImpl.fromJson;

  List<ConditionContentAudioAttachment> get attachments;

  /// Create a copy of ConditionContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConditionContentAudioImplCopyWith<_$ConditionContentAudioImpl>
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
    required TResult Function(String text) text,
    required TResult Function(String text, List<String> searchKeywords)
        textWithSearchKeywords,
    required TResult Function(List<ConditionContentImageAttachment> attachments)
        image,
    required TResult Function(List<ConditionContentAudioAttachment> attachments)
        audio,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? text,
    TResult? Function(String text, List<String> searchKeywords)?
        textWithSearchKeywords,
    TResult? Function(List<ConditionContentImageAttachment> attachments)? image,
    TResult? Function(List<ConditionContentAudioAttachment> attachments)? audio,
    TResult? Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? text,
    TResult Function(String text, List<String> searchKeywords)?
        textWithSearchKeywords,
    TResult Function(List<ConditionContentImageAttachment> attachments)? image,
    TResult Function(List<ConditionContentAudioAttachment> attachments)? audio,
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
    required TResult Function(ConditionContentText value) text,
    required TResult Function(ConditionContentTextWithSearchKeywords value)
        textWithSearchKeywords,
    required TResult Function(ConditionContentImage value) image,
    required TResult Function(ConditionContentAudio value) audio,
    required TResult Function(ConditionContentEmpty value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConditionContentText value)? text,
    TResult? Function(ConditionContentTextWithSearchKeywords value)?
        textWithSearchKeywords,
    TResult? Function(ConditionContentImage value)? image,
    TResult? Function(ConditionContentAudio value)? audio,
    TResult? Function(ConditionContentEmpty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConditionContentText value)? text,
    TResult Function(ConditionContentTextWithSearchKeywords value)?
        textWithSearchKeywords,
    TResult Function(ConditionContentImage value)? image,
    TResult Function(ConditionContentAudio value)? audio,
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

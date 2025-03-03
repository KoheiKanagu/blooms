// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'highlight_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
HighlightContent _$HighlightContentFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'summary':
          return HighlightContentSummary.fromJson(
            json
          );
        
          default:
            return HighlightContentEmpty.fromJson(
  json
);
        }
      
}

/// @nodoc
mixin _$HighlightContent {



  /// Serializes this HighlightContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HighlightContent);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HighlightContent()';
}


}

/// @nodoc
class $HighlightContentCopyWith<$Res>  {
$HighlightContentCopyWith(HighlightContent _, $Res Function(HighlightContent) __);
}


/// @nodoc
@JsonSerializable()

class HighlightContentSummary extends HighlightContent {
  const HighlightContentSummary({@TimestampConverterNotNull() required this.startAt, required this.period, required this.summary, required this.abstract, this.state = HighlightState.pending, this.promptFileUri, final  String? $type}): $type = $type ?? 'summary',super._();
  factory HighlightContentSummary.fromJson(Map<String, dynamic> json) => _$HighlightContentSummaryFromJson(json);

/// ハイライトを作成開始する日時。この日からN日前のハイライト
@TimestampConverterNotNull() final  Timestamp startAt;
/// ハイライトの対象期間
 final  HighlightPeriod period;
/// コンディションの要約
 final  String summary;
/// 分析結果の要旨
 final  String abstract;
/// 生成モデルでの処理の状態
@JsonKey() final  HighlightState state;
/// 生成モデルによるハイライトの生成プロンプトのファイルパス
 final  String? promptFileUri;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of HighlightContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HighlightContentSummaryCopyWith<HighlightContentSummary> get copyWith => _$HighlightContentSummaryCopyWithImpl<HighlightContentSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HighlightContentSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HighlightContentSummary&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.period, period) || other.period == period)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.abstract, abstract) || other.abstract == abstract)&&(identical(other.state, state) || other.state == state)&&(identical(other.promptFileUri, promptFileUri) || other.promptFileUri == promptFileUri));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startAt,period,summary,abstract,state,promptFileUri);

@override
String toString() {
  return 'HighlightContent.summary(startAt: $startAt, period: $period, summary: $summary, abstract: $abstract, state: $state, promptFileUri: $promptFileUri)';
}


}

/// @nodoc
abstract mixin class $HighlightContentSummaryCopyWith<$Res> implements $HighlightContentCopyWith<$Res> {
  factory $HighlightContentSummaryCopyWith(HighlightContentSummary value, $Res Function(HighlightContentSummary) _then) = _$HighlightContentSummaryCopyWithImpl;
@useResult
$Res call({
@TimestampConverterNotNull() Timestamp startAt, HighlightPeriod period, String summary, String abstract, HighlightState state, String? promptFileUri
});




}
/// @nodoc
class _$HighlightContentSummaryCopyWithImpl<$Res>
    implements $HighlightContentSummaryCopyWith<$Res> {
  _$HighlightContentSummaryCopyWithImpl(this._self, this._then);

  final HighlightContentSummary _self;
  final $Res Function(HighlightContentSummary) _then;

/// Create a copy of HighlightContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? startAt = null,Object? period = null,Object? summary = null,Object? abstract = null,Object? state = null,Object? promptFileUri = freezed,}) {
  return _then(HighlightContentSummary(
startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as Timestamp,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as HighlightPeriod,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,abstract: null == abstract ? _self.abstract : abstract // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as HighlightState,promptFileUri: freezed == promptFileUri ? _self.promptFileUri : promptFileUri // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class HighlightContentEmpty extends HighlightContent {
  const HighlightContentEmpty({final  String? $type}): $type = $type ?? 'empty',super._();
  factory HighlightContentEmpty.fromJson(Map<String, dynamic> json) => _$HighlightContentEmptyFromJson(json);



@JsonKey(name: 'type')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$HighlightContentEmptyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HighlightContentEmpty);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HighlightContent.empty()';
}


}




// dart format on

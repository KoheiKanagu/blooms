import 'package:blooms/features/highlight/domain/highlight_period.dart';
import 'package:blooms/features/highlight/domain/highlight_state.dart';
import 'package:blooms/utils/timestamp_converter.dart';
import 'package:blooms/utils/typedefs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'highlight_content.freezed.dart';
part 'highlight_content.g.dart';

@Freezed(
  unionKey: 'type',
  unionValueCase: FreezedUnionCase.none,
  fallbackUnion: 'empty',
)
sealed class HighlightContent with _$HighlightContent {
  const factory HighlightContent.summary({
    /// ハイライトを作成開始する日時。この日からN日前のハイライト
    @TimestampConverterNotNull() required Timestamp startAt,

    /// ハイライトの対象期間
    required HighlightPeriod period,

    /// コンディションの要約
    required String summary,

    /// 分析結果の要旨
    required String abstract,

    /// 生成モデルでの処理の状態
    @Default(HighlightState.pending) HighlightState state,

    /// 生成モデルによるハイライトの生成プロンプトのファイルパス
    String? promptFileUri,
  }) = HighlightContentSummary;

  const HighlightContent._();

  const factory HighlightContent.empty() = HighlightContentEmpty;

  factory HighlightContent.fromJson(Json json) =>
      _$HighlightContentFromJson(json);

  String? get promptFileUri => switch (this) {
        HighlightContentSummary(:final promptFileUri) => promptFileUri,
        HighlightContentEmpty() => null,
      };
}

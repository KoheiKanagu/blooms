import 'package:blooms/features/highlight/domain/highlight_period.dart';
import 'package:blooms/features/highlight/domain/highlight_state.dart';
import 'package:blooms/utils/timestamp_converter.dart';
import 'package:blooms/utils/typedefs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'highlight_content.freezed.dart';
part 'highlight_content.g.dart';

@Freezed(
  unionKey: 'style',
  unionValueCase: FreezedUnionCase.none,
  fallbackUnion: 'empty',
)
sealed class HighlightContent with _$HighlightContent {
  const factory HighlightContent.private({
    /// ハイライトを作成開始する日時。この日からN日前のハイライト
    @TimestampConverterNotNull() required Timestamp startAt,

    /// ハイライトの対象期間
    required HighlightPeriod period,

    /// 主観的なデータのトレンド
    @Default('') String subjectiveTrend,

    /// 客観的なデータのトレンド
    @Default('') String objectiveTrend,

    /// 分析結果
    @Default('') String analysisResult,

    /// アドバイス
    @Default('') String advice,

    /// 分析結果の要旨
    @Default('') String abstract,

    /// 生成モデルでの処理の状態
    @Default(HighlightState.pending) HighlightState state,

    /// 生成モデルによるハイライトの生成プロンプトのファイルパス
    String? promptFileUri,
  }) = HighlightContentPrivate;

  const factory HighlightContent.professional({
    /// ハイライトを作成開始する日時。この日からN日前のハイライト
    @TimestampConverterNotNull() required Timestamp startAt,

    /// ハイライトの種類
    required HighlightPeriod period,

    /// 分析結果
    @Default([]) List<String> analysisResults,

    /// 分析結果の要旨
    @Default('') String abstract,

    /// 生成モデルでの処理の状態
    @Default(HighlightState.pending) HighlightState state,

    /// 生成モデルによるハイライトの生成のプロンプトのファイルパス
    String? promptFileUri,
  }) = HighlightContentProfessional;

  const factory HighlightContent.empty() = HighlightContentEmpty;

  factory HighlightContent.fromJson(Json json) =>
      _$HighlightContentFromJson(json);
}

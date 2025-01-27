import 'package:blooms/utils/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'highlight_content.freezed.dart';
part 'highlight_content.g.dart';

@Freezed(
  unionKey: 'style',
  unionValueCase: FreezedUnionCase.none,
  fallbackUnion: 'empty',
)
sealed class HighlightContent with _$HighlightContent {
  const factory HighlightContent.forOwn({
    /// 主観的なデータのトレンド
    required String subjectiveTrend,

    /// 客観的なデータのトレンド
    required String objectiveTrend,

    /// 分析結果
    required String analysisResult,

    /// アドバイス
    required String advice,

    /// 分析結果の要旨
    required String abstract,
  }) = HighlightContentForOwn;

  const factory HighlightContent.forProfessional({
    /// 分析結果
    required List<String> analysisResults,

    /// 分析結果の要旨
    required String abstract,
  }) = HighlightContentForProfessional;

  const factory HighlightContent.empty() = HighlightContentEmpty;

  factory HighlightContent.fromJson(Json json) =>
      _$HighlightContentFromJson(json);
}

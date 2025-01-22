import 'package:blooms/utils/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'highlight_content.freezed.dart';
part 'highlight_content.g.dart';

@freezed
class HighlightContent with _$HighlightContent {
  const factory HighlightContent({
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
  }) = _HighlightContent;

  factory HighlightContent.fromJson(Json json) =>
      _$HighlightContentFromJson(json);
}

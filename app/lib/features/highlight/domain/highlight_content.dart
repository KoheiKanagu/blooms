import 'package:blooms/utils/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'highlight_content.freezed.dart';
part 'highlight_content.g.dart';

@freezed
class HighlightContent with _$HighlightContent {
  const factory HighlightContent({
    /// 主観的な状態の傾向
    String? subjectiveConditionTendency,

    /// 客観的な状態の傾向
    String? objectiveConditionTendency,

    /// 分析結果
    String? analysisResult,

    /// アドバイス
    String? advice,
  }) = _HighlightContent;

  factory HighlightContent.fromJson(Json json) =>
      _$HighlightContentFromJson(json);
}

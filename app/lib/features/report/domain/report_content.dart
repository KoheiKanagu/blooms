import 'package:blooms/utils/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_content.freezed.dart';
part 'report_content.g.dart';

@freezed
class ReportContent with _$ReportContent {
  const factory ReportContent({
    /// 主観的な状態の傾向
    String? subjectiveConditionTendency,

    /// 客観的な状態の傾向
    String? objectiveConditionTendency,

    /// 分析結果
    String? analysisResult,

    /// アドバイス
    String? advice,
  }) = _ReportContent;

  factory ReportContent.fromJson(Json json) => _$ReportContentFromJson(json);
}

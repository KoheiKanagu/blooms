import 'package:blooms/features/report/domain/report_type.dart';
import 'package:blooms/utils/timestamp_converter.dart';
import 'package:blooms/utils/typedefs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report.freezed.dart';
part 'report.g.dart';

@freezed
class Report with _$Report {
  const factory Report({
    /// Geminiによるレポートの生成のプロンプトのファイルパス
    required String prompt,

    /// レポートの種類
    required ReportType reportType,

    /// 主観的な状態の傾向
    required String subjectiveConditionTendency,

    /// 客観的な状態の傾向
    required String objectiveConditionTendency,

    /// 分析結果
    required String analysisResult,

    /// アドバイス
    required String advice,
    @TimestampConverter() Timestamp? createdAt,
    @TimestampConverter() Timestamp? updatedAt,
    @TimestampConverter() Timestamp? deletedAt,

    /// 何日を対象にしたレポートか
    @TimestampConverter() Timestamp? targetDate,
  }) = _Report;

  factory Report.fromJson(Json json) => _$ReportFromJson(json);

  static FromFirestore<Report> get fromFirestore =>
      (snapshot, _) => Report.fromJson(
            snapshot.data() ?? {},
          );

  static ToFirestore<Report> get toFirestore =>
      (data, _) => TimestampConverter.updateServerTimestamp(
            data.toJson(),
          );
}

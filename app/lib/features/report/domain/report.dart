import 'package:blooms/features/report/domain/report_state.dart';
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
    /// レポートの種類
    required ReportType type,

    /// レポートの対象者のUID
    required String subjectUid,

    /// Geminiによるレポートの生成のプロンプトのファイルパス
    String? prompt,

    /// 主観的な状態の傾向
    String? subjectiveConditionTendency,

    /// 客観的な状態の傾向
    String? objectiveConditionTendency,

    /// 分析結果
    String? analysisResult,

    /// アドバイス
    String? advice,

    /// Geminiでの処理の状態
    @Default(ReportState.unknown) ReportState state,
    @TimestampConverter() Timestamp? createdAt,
    @TimestampConverter() Timestamp? updatedAt,
    @TimestampConverter() Timestamp? deletedAt,

    /// 何日を対象にしたレポートか
    @TimestampConverter() Timestamp? targetDate,
  }) = _Report;

  factory Report.fromJson(Json json) => _$ReportFromJson(json);

  static FromFirestore<Report> get fromFirestore =>
      (snapshot, _) => Report.fromJson(snapshot.data() ?? {});

  static ToFirestore<Report> get toFirestore =>
      (data, _) => TimestampConverter.updateServerTimestamp(data.toJson());
}

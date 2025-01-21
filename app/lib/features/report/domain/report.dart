import 'package:blooms/features/report/domain/report_content.dart';
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

    /// 生成モデルによるレポートの生成のプロンプトのファイルパス
    String? prompt,

    /// レポートの内容
    ReportContent? content,

    /// 生成モデルでの処理の状態
    @Default(ReportState.pending) ReportState state,
    @TimestampConverter() Timestamp? createdAt,
    @TimestampConverter() Timestamp? updatedAt,
    @TimestampConverter() Timestamp? deletedAt,

    /// レポートを作成開始する日時。この日からN日前のレポート
    @TimestampConverter() Timestamp? startAt,
  }) = _Report;

  factory Report.fromJson(Json json) => _$ReportFromJson(json);

  static FromFirestore<Report> get fromFirestore =>
      (snapshot, _) => Report.fromJson(snapshot.data() ?? {});

  static ToFirestore<Report> get toFirestore =>
      (data, _) => TimestampConverter.updateServerTimestamp(data.toJson());
}

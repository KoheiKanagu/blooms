import 'package:blooms/features/highlight/domain/highlight_content.dart';
import 'package:blooms/features/highlight/domain/highlight_state.dart';
import 'package:blooms/features/highlight/domain/highlight_type.dart';
import 'package:blooms/theme/my_date_format.dart';
import 'package:blooms/utils/timestamp_converter.dart';
import 'package:blooms/utils/typedefs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'highlight.freezed.dart';
part 'highlight.g.dart';

@freezed
class Highlight with _$Highlight {
  const factory Highlight({
    /// ハイライトの種類
    required HighlightType type,

    /// ハイライトの対象者のUID
    required String subjectUid,

    /// ハイライトを作成開始する日時。この日からN日前のハイライト
    @TimestampConverterNotNull() required Timestamp startAt,

    /// 生成モデルによるハイライトの生成のプロンプトのファイルパス
    String? prompt,

    /// ハイライトの内容
    HighlightContent? content,

    /// 生成モデルでの処理の状態
    @Default(HighlightState.pending) HighlightState state,
    @TimestampConverter() Timestamp? createdAt,
    @TimestampConverter() Timestamp? updatedAt,
    @TimestampConverter() Timestamp? deletedAt,
  }) = _Highlight;

  factory Highlight.create({
    required HighlightType type,
    required String subjectUid,
    required Timestamp startAt,
  }) =>
      Highlight(
        type: type,
        subjectUid: subjectUid,
        startAt: startAt,
      );

  const Highlight._();

  factory Highlight.fromJson(Json json) => _$HighlightFromJson(json);

  static FromFirestore<Highlight> get fromFirestore =>
      (snapshot, _) => Highlight.fromJson(snapshot.data() ?? {});

  static ToFirestore<Highlight> get toFirestore =>
      (data, _) => TimestampConverter.updateServerTimestamp(data.toJson());

  HighlightPeriod get highlightPeriod {
    final startDate = myDateFormat(
      startAt.toDate().subtract(
            Duration(
              days: type.days,
            ),
          ),
    );
    final endDate = myDateFormat(startAt.toDate());

    return (
      startDate: startDate,
      endDate: endDate,
    );
  }
}

typedef HighlightPeriod = ({
  String startDate,
  String endDate,
});

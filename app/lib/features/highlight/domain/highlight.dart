import 'package:blooms/features/highlight/domain/highlight_content.dart';
import 'package:blooms/features/highlight/domain/highlight_state.dart';
import 'package:blooms/features/highlight/domain/highlight_type.dart';
import 'package:blooms/utils/timestamp_converter.dart';
import 'package:blooms/utils/typedefs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

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

  const Highlight._();

  factory Highlight.fromJson(Json json) => _$HighlightFromJson(json);

  static FromFirestore<Highlight> get fromFirestore =>
      (snapshot, _) => Highlight.fromJson(snapshot.data() ?? {});

  static ToFirestore<Highlight> get toFirestore =>
      (data, _) => TimestampConverter.updateServerTimestamp(data.toJson());

  ({
    String startDate,
    String endDate,
  }) get highlightPeriod {
    final format = DateFormat.MEd();

    final startDate = format.format(startAt.toDate());
    final endDate = format.format(
      startAt.toDate().subtract(
            Duration(
              days: type.days,
            ),
          ),
    );

    return (
      startDate: startDate,
      endDate: endDate,
    );
  }
}

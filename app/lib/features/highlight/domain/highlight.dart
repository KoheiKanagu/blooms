import 'package:blooms/features/highlight/domain/highlight_content.dart';
import 'package:blooms/features/highlight/domain/highlight_period.dart';
import 'package:blooms/features/highlight/domain/highlight_state.dart';
import 'package:blooms/features/highlight/domain/highlight_style.dart';
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
    /// ハイライトの対象者のUID
    required String subjectUid,

    /// 内容
    required HighlightContent content,
    @TimestampConverter() Timestamp? createdAt,
    @TimestampConverter() Timestamp? updatedAt,
    @TimestampConverter() Timestamp? deletedAt,
  }) = _Highlight;

  factory Highlight.create({
    required HighlightPeriod period,
    required HighlightStyle style,
    required String subjectUid,
    required Timestamp startAt,
  }) =>
      Highlight(
        subjectUid: subjectUid,
        content: switch (style) {
          HighlightStyle.private => HighlightContentSummary(
              startAt: startAt,
              period: period,
              summary: '',
              abstract: '',
            ),
        },
      );

  const Highlight._();

  factory Highlight.fromJson(Json json) => _$HighlightFromJson(json);

  static FromFirestore<Highlight> get fromFirestore =>
      (snapshot, _) => Highlight.fromJson(snapshot.data() ?? {});

  static ToFirestore<Highlight> get toFirestore =>
      (data, _) => TimestampConverter.updateServerTimestamp(data.toJson());

  HighlightRange get highlightRange {
    final (startAt, period) = switch (content) {
      HighlightContentSummary(:final startAt, :final period) => (
          startAt,
          period
        ),
      HighlightContentEmpty() => throw UnimplementedError(),
    };

    final startDate = myDateFormat(
      startAt.toDate().subtract(
            Duration(
              days: period.days,
            ),
          ),
    );
    final endDate = myDateFormat(startAt.toDate());

    return (
      startDate: startDate,
      endDate: endDate,
    );
  }

  HighlightPeriod? get period {
    return switch (content) {
      HighlightContentSummary(:final period) => period,
      HighlightContentEmpty() => null,
    };
  }

  HighlightState? get state {
    return switch (content) {
      HighlightContentSummary(:final state) => state,
      HighlightContentEmpty() => null,
    };
  }
}

typedef HighlightRange = ({
  String startDate,
  String endDate,
});

import 'package:blooms/features/condition/domain/condition_state.dart';
import 'package:blooms/features/condition/domain/condition_type.dart';
import 'package:blooms/utils/timestamp_converter.dart';
import 'package:blooms/utils/typedefs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'condition.freezed.dart';
part 'condition.g.dart';

@freezed
class Condition with _$Condition {
  const factory Condition({
    /// 作成者
    required String createdBy,

    @TimestampConverter() Timestamp? createdAt,
    @TimestampConverter() Timestamp? updatedAt,
    @TimestampConverter() Timestamp? deletedAt,

    /// コンディションの種類
    @Default(ConditionType.unknown) ConditionType type,

    /// 添付ファイルのgs://パス
    @Default([]) List<String> attachments,

    /// attachmentsの解析で処理が必要な場合の状態
    @Default(ConditionState.unknown) ConditionState state,

    /// 記録
    String? record,
  }) = _Condition;

  factory Condition.subjective({required String uid, required String record}) =>
      Condition(
        createdBy: uid,
        record: record,
        type: ConditionType.subjective,
        attachments: [],
        state: ConditionState.success,
      );

  factory Condition.photo({
    required String uid,
    required List<String> attachments,
  }) => Condition(
    createdBy: uid,
    type: ConditionType.photo,
    attachments: attachments,
    state: ConditionState.pending,
  );

  factory Condition.fromJson(Json json) => _$ConditionFromJson(json);

  static FromFirestore<Condition> get fromFirestore =>
      (snapshot, _) => Condition.fromJson(snapshot.data() ?? {});

  static ToFirestore<Condition> get toFirestore =>
      (data, _) => TimestampConverter.updateServerTimestamp(data.toJson());
}

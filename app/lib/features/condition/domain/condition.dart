import 'package:blooms/features/condition/domain/condition_content.dart';
import 'package:blooms/features/condition/domain/condition_content_audio_attachment.dart';
import 'package:blooms/features/condition/domain/condition_content_image_attachment.dart';
import 'package:blooms/features/condition/domain/condition_creator_type.dart';
import 'package:blooms/utils/timestamp_converter.dart';
import 'package:blooms/utils/typedefs.dart';
import 'package:clock/clock.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'condition.freezed.dart';
part 'condition.g.dart';

@freezed
abstract class Condition with _$Condition {
  const factory Condition({
    /// 対象者のUID
    required String subjectUid,

    /// contentの作成者の種類
    required ConditionCreatorType creatorType,

    /// 内容
    required ConditionContent content,

    /// ISO8601形式の作成日時
    String? createdAtIso8601,
    @TimestampConverter() Timestamp? createdAt,
    @TimestampConverter() Timestamp? updatedAt,
    @TimestampConverter() Timestamp? deletedAt,
  }) = _Condition;

  factory Condition.text({required String uid, required String text}) =>
      Condition(
        subjectUid: uid,
        creatorType: ConditionCreatorType.user,
        content: ConditionContent.text(text: text),
        createdAtIso8601: clock.now().toIso8601String(),
      );

  factory Condition.image({
    required String uid,
    required List<ConditionContentImageAttachment> attachments,
  }) => Condition(
    subjectUid: uid,
    creatorType: ConditionCreatorType.user,
    content: ConditionContent.image(attachments: attachments),
    createdAtIso8601: clock.now().toIso8601String(),
  );

  factory Condition.audio({
    required String uid,
    required List<ConditionContentAudioAttachment> attachments,
  }) => Condition(
    subjectUid: uid,
    creatorType: ConditionCreatorType.user,
    content: ConditionContent.audio(attachments: attachments),
    createdAtIso8601: clock.now().toIso8601String(),
  );

  factory Condition.fromJson(Json json) => _$ConditionFromJson(json);

  static FromFirestore<Condition> get fromFirestore =>
      (snapshot, _) => Condition.fromJson(snapshot.data() ?? {});

  static ToFirestore<Condition> get toFirestore =>
      (data, _) => TimestampConverter.updateServerTimestamp(data.toJson());
}

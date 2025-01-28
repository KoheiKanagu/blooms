import 'package:blooms/features/condition/domain/condition_content_attachment.dart';
import 'package:blooms/utils/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'condition_content.freezed.dart';
part 'condition_content.g.dart';

@Freezed(
  unionKey: 'type',
  unionValueCase: FreezedUnionCase.none,
  fallbackUnion: 'empty',
)
class ConditionContent with _$ConditionContent {
  const factory ConditionContent.subjective({
    required String record,
  }) = ConditionContentSubjective;

  const factory ConditionContent.photo({
    required List<ConditionContentAttachment> attachments,
  }) = ConditionContentPhoto;

  const factory ConditionContent.empty() = ConditionContentEmpty;

  factory ConditionContent.fromJson(Json json) =>
      _$ConditionContentFromJson(json);
}

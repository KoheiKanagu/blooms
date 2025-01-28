import 'package:blooms/features/condition/domain/condition_content_audio_attachment.dart';
import 'package:blooms/features/condition/domain/condition_content_image_attachment.dart';
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
  /// テキストの記録
  const factory ConditionContent.text({
    required String text,
  }) = ConditionContentText;

  /// 画像の記録
  const factory ConditionContent.image({
    required List<ConditionContentImageAttachment> attachments,
  }) = ConditionContentImage;

  /// 音声の記録
  const factory ConditionContent.audio({
    required List<ConditionContentAudioAttachment> attachments,
  }) = ConditionContentAudio;

  const factory ConditionContent.empty() = ConditionContentEmpty;

  factory ConditionContent.fromJson(Json json) =>
      _$ConditionContentFromJson(json);
}

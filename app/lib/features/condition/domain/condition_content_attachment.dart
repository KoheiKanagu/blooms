import 'package:blooms/features/condition/domain/condition_state.dart';
import 'package:blooms/utils/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'condition_content_attachment.freezed.dart';
part 'condition_content_attachment.g.dart';

@freezed
class ConditionContentAttachment with _$ConditionContentAttachment {
  const factory ConditionContentAttachment({
    /// gs://パス
    required String gsPath,

    /// 添付ファイルに対する処理状況
    required ConditionState state,

    /// 代替テキスト
    String? alt,
  }) = _ConditionContentAttachment;

  factory ConditionContentAttachment.fromJson(Json json) =>
      _$ConditionContentAttachmentFromJson(json);
}

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:blooms/features/condition/domain/condition_content.dart';
import 'package:blooms/features/condition/domain/condition_creator_type.dart';
import 'package:blooms/features/condition/presentation/condition_bubble_blooms_icon.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/utils/firebase/firebase_providers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConditionBubbleImage extends HookConsumerWidget {
  const ConditionBubbleImage(
    this.content, {
    required this.creatorType,
    super.key,
  });

  final ConditionContentImage content;

  final ConditionCreatorType creatorType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        if (creatorType == ConditionCreatorType.model)
          const ConditionBubbleBloomsIcon(),
        Column(
          spacing: 4,
          children:
              content.attachments
                  .map<Widget>((attachment) {
                    final placeholder = Image(
                      image: BlurHashImage(
                        attachment.additionalInfo.blurHash ?? '',
                        decodingHeight: attachment.height,
                        decodingWidth: attachment.width,
                      ),
                    );

                    return ref
                        .watch(
                          firebaseStorageGsFileDownloadUrlProvider(
                            fileUri: attachment.fileUri,
                          ),
                        )
                        .maybeWhen(
                          orElse: () => placeholder,
                          data:
                              (url) => CachedNetworkImage(
                                imageUrl: url,
                                placeholder: (context, url) => placeholder,
                                errorWidget:
                                    (context, url, error) => Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        placeholder,
                                        CupertinoButton(
                                          color: CupertinoColors.white,
                                          sizeStyle: CupertinoButtonSize.small,
                                          padding: EdgeInsets.zero,
                                          onPressed: () {
                                            showOkAlertDialog(
                                              context: context,
                                              title: i18n.imageLoadFailed,
                                              style: AdaptiveStyle.iOS,
                                              routeSettings:
                                                  const RouteSettings(
                                                    name: 'imageLoadFailed',
                                                  ),
                                            );
                                          },
                                          child: Icon(
                                            CupertinoIcons.clear_circled_solid,
                                            color: CupertinoColors.systemRed
                                                .resolveFrom(context),
                                            size: 32,
                                          ),
                                        ),
                                      ],
                                    ),
                              ),
                        );
                  })
                  .map(
                    (e) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: e,
                    ),
                  )
                  .toList(),
        ),
      ],
    );
  }
}

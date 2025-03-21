import 'package:blooms/utils/blurhash/blurhash_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyBlurHash extends HookConsumerWidget {
  const MyBlurHash({
    required this.blurHash,
    required this.width,
    required this.height,
    super.key,
  });

  final String blurHash;
  final int width;
  final int height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AspectRatio(
      aspectRatio: width / height,
      child: ref
          .watch(
            blurHashDecodeImageIsolateProvider(
              blurHash: blurHash,
              width: width,
              height: height,
            ),
          )
          .maybeWhen(
            orElse: () => const Center(child: CupertinoActivityIndicator()),
            data: (image) => Image(image: image),
          ),
    );
  }
}

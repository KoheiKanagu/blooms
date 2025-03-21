import 'dart:async';
import 'dart:ui' as ui;

import 'package:blooms/extensions/ref_extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'blurhash_providers.g.dart';

/// BlurHashをデコードして、[ui.Image]を返すProvider
/// 別のスレッドでデコードを行うため、UIスレッドをブロックしない
///
@riverpod
Future<UiImage> blurHashDecodeImageIsolate(
  Ref ref, {
  required String blurHash,
  required int width,
  required int height,
}) async {
  ref.cacheFor(const Duration(seconds: 10));

  final pixels = await _isolateBlurHashDecode(
    blurHash: blurHash,
    width: width,
    height: height,
  );

  final completer = Completer<ui.Image>();
  ui.decodeImageFromPixels(
    pixels,
    width,
    height,
    ui.PixelFormat.rgba8888,
    completer.complete,
  );

  return completer.future.then(UiImage.new);
}

Future<Uint8List> _isolateBlurHashDecode({
  required String blurHash,
  required int width,
  required int height,
  double punch = 1.0,
}) => compute(_blurHashDecode, <String, dynamic>{
  'blurHash': blurHash,
  'width': width,
  'height': height,
  'punch': punch,
});

Future<Uint8List> _blurHashDecode(Map<String, dynamic> params) {
  final blurHash = params['blurHash'] as String;
  final width = params['width'] as int;
  final height = params['height'] as int;
  final punch = params['punch'] as double;

  return blurHashDecode(
    blurHash: blurHash,
    width: width,
    height: height,
    punch: punch,
  );
}

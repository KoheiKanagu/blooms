// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'blurhash_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$blurHashDecodeImageIsolateHash() =>
    r'454f185d5a584a4bd42f783335814b98fc71909f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// BlurHashをデコードして、[ui.Image]を返すProvider
/// 別のスレッドでデコードを行うため、UIスレッドをブロックしない
///
///
/// Copied from [blurHashDecodeImageIsolate].
@ProviderFor(blurHashDecodeImageIsolate)
const blurHashDecodeImageIsolateProvider = BlurHashDecodeImageIsolateFamily();

/// BlurHashをデコードして、[ui.Image]を返すProvider
/// 別のスレッドでデコードを行うため、UIスレッドをブロックしない
///
///
/// Copied from [blurHashDecodeImageIsolate].
class BlurHashDecodeImageIsolateFamily extends Family<AsyncValue<UiImage>> {
  /// BlurHashをデコードして、[ui.Image]を返すProvider
  /// 別のスレッドでデコードを行うため、UIスレッドをブロックしない
  ///
  ///
  /// Copied from [blurHashDecodeImageIsolate].
  const BlurHashDecodeImageIsolateFamily();

  /// BlurHashをデコードして、[ui.Image]を返すProvider
  /// 別のスレッドでデコードを行うため、UIスレッドをブロックしない
  ///
  ///
  /// Copied from [blurHashDecodeImageIsolate].
  BlurHashDecodeImageIsolateProvider call({
    required String blurHash,
    required int width,
    required int height,
  }) {
    return BlurHashDecodeImageIsolateProvider(
      blurHash: blurHash,
      width: width,
      height: height,
    );
  }

  @override
  BlurHashDecodeImageIsolateProvider getProviderOverride(
    covariant BlurHashDecodeImageIsolateProvider provider,
  ) {
    return call(
      blurHash: provider.blurHash,
      width: provider.width,
      height: provider.height,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'blurHashDecodeImageIsolateProvider';
}

/// BlurHashをデコードして、[ui.Image]を返すProvider
/// 別のスレッドでデコードを行うため、UIスレッドをブロックしない
///
///
/// Copied from [blurHashDecodeImageIsolate].
class BlurHashDecodeImageIsolateProvider
    extends AutoDisposeFutureProvider<UiImage> {
  /// BlurHashをデコードして、[ui.Image]を返すProvider
  /// 別のスレッドでデコードを行うため、UIスレッドをブロックしない
  ///
  ///
  /// Copied from [blurHashDecodeImageIsolate].
  BlurHashDecodeImageIsolateProvider({
    required String blurHash,
    required int width,
    required int height,
  }) : this._internal(
         (ref) => blurHashDecodeImageIsolate(
           ref as BlurHashDecodeImageIsolateRef,
           blurHash: blurHash,
           width: width,
           height: height,
         ),
         from: blurHashDecodeImageIsolateProvider,
         name: r'blurHashDecodeImageIsolateProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$blurHashDecodeImageIsolateHash,
         dependencies: BlurHashDecodeImageIsolateFamily._dependencies,
         allTransitiveDependencies:
             BlurHashDecodeImageIsolateFamily._allTransitiveDependencies,
         blurHash: blurHash,
         width: width,
         height: height,
       );

  BlurHashDecodeImageIsolateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.blurHash,
    required this.width,
    required this.height,
  }) : super.internal();

  final String blurHash;
  final int width;
  final int height;

  @override
  Override overrideWith(
    FutureOr<UiImage> Function(BlurHashDecodeImageIsolateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BlurHashDecodeImageIsolateProvider._internal(
        (ref) => create(ref as BlurHashDecodeImageIsolateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        blurHash: blurHash,
        width: width,
        height: height,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UiImage> createElement() {
    return _BlurHashDecodeImageIsolateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BlurHashDecodeImageIsolateProvider &&
        other.blurHash == blurHash &&
        other.width == width &&
        other.height == height;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, blurHash.hashCode);
    hash = _SystemHash.combine(hash, width.hashCode);
    hash = _SystemHash.combine(hash, height.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin BlurHashDecodeImageIsolateRef on AutoDisposeFutureProviderRef<UiImage> {
  /// The parameter `blurHash` of this provider.
  String get blurHash;

  /// The parameter `width` of this provider.
  int get width;

  /// The parameter `height` of this provider.
  int get height;
}

class _BlurHashDecodeImageIsolateProviderElement
    extends AutoDisposeFutureProviderElement<UiImage>
    with BlurHashDecodeImageIsolateRef {
  _BlurHashDecodeImageIsolateProviderElement(super.provider);

  @override
  String get blurHash =>
      (origin as BlurHashDecodeImageIsolateProvider).blurHash;
  @override
  int get width => (origin as BlurHashDecodeImageIsolateProvider).width;
  @override
  int get height => (origin as BlurHashDecodeImageIsolateProvider).height;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'highlight_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$highlightCollectionReferenceHash() =>
    r'b4a41eac906094b65ecd0b2a1b72e3f18678d746';

/// See also [highlightCollectionReference].
@ProviderFor(highlightCollectionReference)
final highlightCollectionReferenceProvider =
    AutoDisposeProvider<CollectionReference<Highlight>>.internal(
  highlightCollectionReference,
  name: r'highlightCollectionReferenceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$highlightCollectionReferenceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HighlightCollectionReferenceRef
    = AutoDisposeProviderRef<CollectionReference<Highlight>>;
String _$highlightQueryHash() => r'2b000f460e1fdb8856f92af48eebc8535dd699c3';

/// See also [highlightQuery].
@ProviderFor(highlightQuery)
final highlightQueryProvider =
    AutoDisposeFutureProvider<Query<Highlight>>.internal(
  highlightQuery,
  name: r'highlightQueryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$highlightQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HighlightQueryRef = AutoDisposeFutureProviderRef<Query<Highlight>>;
String _$highlightCreateHash() => r'66866cf89919cf48edae4258540dc4a65b5c3281';

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

/// See also [highlightCreate].
@ProviderFor(highlightCreate)
const highlightCreateProvider = HighlightCreateFamily();

/// See also [highlightCreate].
class HighlightCreateFamily extends Family<AsyncValue<void>> {
  /// See also [highlightCreate].
  const HighlightCreateFamily();

  /// See also [highlightCreate].
  HighlightCreateProvider call(
    HighlightType type,
  ) {
    return HighlightCreateProvider(
      type,
    );
  }

  @override
  HighlightCreateProvider getProviderOverride(
    covariant HighlightCreateProvider provider,
  ) {
    return call(
      provider.type,
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
  String? get name => r'highlightCreateProvider';
}

/// See also [highlightCreate].
class HighlightCreateProvider extends AutoDisposeFutureProvider<void> {
  /// See also [highlightCreate].
  HighlightCreateProvider(
    HighlightType type,
  ) : this._internal(
          (ref) => highlightCreate(
            ref as HighlightCreateRef,
            type,
          ),
          from: highlightCreateProvider,
          name: r'highlightCreateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$highlightCreateHash,
          dependencies: HighlightCreateFamily._dependencies,
          allTransitiveDependencies:
              HighlightCreateFamily._allTransitiveDependencies,
          type: type,
        );

  HighlightCreateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final HighlightType type;

  @override
  Override overrideWith(
    FutureOr<void> Function(HighlightCreateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HighlightCreateProvider._internal(
        (ref) => create(ref as HighlightCreateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _HighlightCreateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HighlightCreateProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HighlightCreateRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `type` of this provider.
  HighlightType get type;
}

class _HighlightCreateProviderElement
    extends AutoDisposeFutureProviderElement<void> with HighlightCreateRef {
  _HighlightCreateProviderElement(super.provider);

  @override
  HighlightType get type => (origin as HighlightCreateProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

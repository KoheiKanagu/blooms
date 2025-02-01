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
String _$highlightQueryHash() => r'dabbf2c37054c7f63279c5df11c4ee8a5281ffcf';

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
String _$highlightCreateHash() => r'9ea75bb3317ca06a1edb65a371b1acef01a3dbac';

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
  HighlightCreateProvider call({
    required HighlightPeriod period,
  }) {
    return HighlightCreateProvider(
      period: period,
    );
  }

  @override
  HighlightCreateProvider getProviderOverride(
    covariant HighlightCreateProvider provider,
  ) {
    return call(
      period: provider.period,
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
  HighlightCreateProvider({
    required HighlightPeriod period,
  }) : this._internal(
          (ref) => highlightCreate(
            ref as HighlightCreateRef,
            period: period,
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
          period: period,
        );

  HighlightCreateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.period,
  }) : super.internal();

  final HighlightPeriod period;

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
        period: period,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _HighlightCreateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HighlightCreateProvider && other.period == period;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, period.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HighlightCreateRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `period` of this provider.
  HighlightPeriod get period;
}

class _HighlightCreateProviderElement
    extends AutoDisposeFutureProviderElement<void> with HighlightCreateRef {
  _HighlightCreateProviderElement(super.provider);

  @override
  HighlightPeriod get period => (origin as HighlightCreateProvider).period;
}

String _$highlightDeleteHash() => r'260028c23eaa1ca4c9e487a2bb3e053d6824ca07';

/// See also [highlightDelete].
@ProviderFor(highlightDelete)
const highlightDeleteProvider = HighlightDeleteFamily();

/// See also [highlightDelete].
class HighlightDeleteFamily extends Family<AsyncValue<void>> {
  /// See also [highlightDelete].
  const HighlightDeleteFamily();

  /// See also [highlightDelete].
  HighlightDeleteProvider call({
    required String documentId,
  }) {
    return HighlightDeleteProvider(
      documentId: documentId,
    );
  }

  @override
  HighlightDeleteProvider getProviderOverride(
    covariant HighlightDeleteProvider provider,
  ) {
    return call(
      documentId: provider.documentId,
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
  String? get name => r'highlightDeleteProvider';
}

/// See also [highlightDelete].
class HighlightDeleteProvider extends AutoDisposeFutureProvider<void> {
  /// See also [highlightDelete].
  HighlightDeleteProvider({
    required String documentId,
  }) : this._internal(
          (ref) => highlightDelete(
            ref as HighlightDeleteRef,
            documentId: documentId,
          ),
          from: highlightDeleteProvider,
          name: r'highlightDeleteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$highlightDeleteHash,
          dependencies: HighlightDeleteFamily._dependencies,
          allTransitiveDependencies:
              HighlightDeleteFamily._allTransitiveDependencies,
          documentId: documentId,
        );

  HighlightDeleteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.documentId,
  }) : super.internal();

  final String documentId;

  @override
  Override overrideWith(
    FutureOr<void> Function(HighlightDeleteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HighlightDeleteProvider._internal(
        (ref) => create(ref as HighlightDeleteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        documentId: documentId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _HighlightDeleteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HighlightDeleteProvider && other.documentId == documentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, documentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HighlightDeleteRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `documentId` of this provider.
  String get documentId;
}

class _HighlightDeleteProviderElement
    extends AutoDisposeFutureProviderElement<void> with HighlightDeleteRef {
  _HighlightDeleteProviderElement(super.provider);

  @override
  String get documentId => (origin as HighlightDeleteProvider).documentId;
}

String _$highlightPromptHash() => r'31b52fa140c2fc37c97a5557f06b301f897c7eb7';

/// See also [highlightPrompt].
@ProviderFor(highlightPrompt)
const highlightPromptProvider = HighlightPromptFamily();

/// See also [highlightPrompt].
class HighlightPromptFamily extends Family<AsyncValue<String?>> {
  /// See also [highlightPrompt].
  const HighlightPromptFamily();

  /// See also [highlightPrompt].
  HighlightPromptProvider call({
    required String? gsFilePath,
  }) {
    return HighlightPromptProvider(
      gsFilePath: gsFilePath,
    );
  }

  @override
  HighlightPromptProvider getProviderOverride(
    covariant HighlightPromptProvider provider,
  ) {
    return call(
      gsFilePath: provider.gsFilePath,
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
  String? get name => r'highlightPromptProvider';
}

/// See also [highlightPrompt].
class HighlightPromptProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [highlightPrompt].
  HighlightPromptProvider({
    required String? gsFilePath,
  }) : this._internal(
          (ref) => highlightPrompt(
            ref as HighlightPromptRef,
            gsFilePath: gsFilePath,
          ),
          from: highlightPromptProvider,
          name: r'highlightPromptProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$highlightPromptHash,
          dependencies: HighlightPromptFamily._dependencies,
          allTransitiveDependencies:
              HighlightPromptFamily._allTransitiveDependencies,
          gsFilePath: gsFilePath,
        );

  HighlightPromptProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.gsFilePath,
  }) : super.internal();

  final String? gsFilePath;

  @override
  Override overrideWith(
    FutureOr<String?> Function(HighlightPromptRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HighlightPromptProvider._internal(
        (ref) => create(ref as HighlightPromptRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        gsFilePath: gsFilePath,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _HighlightPromptProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HighlightPromptProvider && other.gsFilePath == gsFilePath;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, gsFilePath.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HighlightPromptRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `gsFilePath` of this provider.
  String? get gsFilePath;
}

class _HighlightPromptProviderElement
    extends AutoDisposeFutureProviderElement<String?> with HighlightPromptRef {
  _HighlightPromptProviderElement(super.provider);

  @override
  String? get gsFilePath => (origin as HighlightPromptProvider).gsFilePath;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'condition_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$conditionCollectionReferenceHash() =>
    r'f8307e781b15030663350a9f08858e8da6634ad0';

/// See also [conditionCollectionReference].
@ProviderFor(conditionCollectionReference)
final conditionCollectionReferenceProvider =
    AutoDisposeProvider<CollectionReference<Condition>>.internal(
  conditionCollectionReference,
  name: r'conditionCollectionReferenceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$conditionCollectionReferenceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConditionCollectionReferenceRef
    = AutoDisposeProviderRef<CollectionReference<Condition>>;
String _$conditionQueryHash() => r'5609586f5a79943fae85d4aa0860199bd015a9a1';

/// See also [conditionQuery].
@ProviderFor(conditionQuery)
final conditionQueryProvider =
    AutoDisposeFutureProvider<Query<Condition>>.internal(
  conditionQuery,
  name: r'conditionQueryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$conditionQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConditionQueryRef = AutoDisposeFutureProviderRef<Query<Condition>>;
String _$conditionDeleteHash() => r'b2ce26c517f0740d9e55d4847e3a52b6c84cd7a1';

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

/// See also [conditionDelete].
@ProviderFor(conditionDelete)
const conditionDeleteProvider = ConditionDeleteFamily();

/// See also [conditionDelete].
class ConditionDeleteFamily extends Family<AsyncValue<void>> {
  /// See also [conditionDelete].
  const ConditionDeleteFamily();

  /// See also [conditionDelete].
  ConditionDeleteProvider call({
    required String documentId,
  }) {
    return ConditionDeleteProvider(
      documentId: documentId,
    );
  }

  @override
  ConditionDeleteProvider getProviderOverride(
    covariant ConditionDeleteProvider provider,
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
  String? get name => r'conditionDeleteProvider';
}

/// See also [conditionDelete].
class ConditionDeleteProvider extends AutoDisposeFutureProvider<void> {
  /// See also [conditionDelete].
  ConditionDeleteProvider({
    required String documentId,
  }) : this._internal(
          (ref) => conditionDelete(
            ref as ConditionDeleteRef,
            documentId: documentId,
          ),
          from: conditionDeleteProvider,
          name: r'conditionDeleteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$conditionDeleteHash,
          dependencies: ConditionDeleteFamily._dependencies,
          allTransitiveDependencies:
              ConditionDeleteFamily._allTransitiveDependencies,
          documentId: documentId,
        );

  ConditionDeleteProvider._internal(
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
    FutureOr<void> Function(ConditionDeleteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConditionDeleteProvider._internal(
        (ref) => create(ref as ConditionDeleteRef),
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
    return _ConditionDeleteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConditionDeleteProvider && other.documentId == documentId;
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
mixin ConditionDeleteRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `documentId` of this provider.
  String get documentId;
}

class _ConditionDeleteProviderElement
    extends AutoDisposeFutureProviderElement<void> with ConditionDeleteRef {
  _ConditionDeleteProviderElement(super.provider);

  @override
  String get documentId => (origin as ConditionDeleteProvider).documentId;
}

String _$conditionCreateTextHash() =>
    r'b55a9be5821d87cac1f32d5db9c00b4b3431050b';

/// See also [conditionCreateText].
@ProviderFor(conditionCreateText)
const conditionCreateTextProvider = ConditionCreateTextFamily();

/// See also [conditionCreateText].
class ConditionCreateTextFamily extends Family<AsyncValue<void>> {
  /// See also [conditionCreateText].
  const ConditionCreateTextFamily();

  /// See also [conditionCreateText].
  ConditionCreateTextProvider call({
    required String text,
  }) {
    return ConditionCreateTextProvider(
      text: text,
    );
  }

  @override
  ConditionCreateTextProvider getProviderOverride(
    covariant ConditionCreateTextProvider provider,
  ) {
    return call(
      text: provider.text,
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
  String? get name => r'conditionCreateTextProvider';
}

/// See also [conditionCreateText].
class ConditionCreateTextProvider extends AutoDisposeFutureProvider<void> {
  /// See also [conditionCreateText].
  ConditionCreateTextProvider({
    required String text,
  }) : this._internal(
          (ref) => conditionCreateText(
            ref as ConditionCreateTextRef,
            text: text,
          ),
          from: conditionCreateTextProvider,
          name: r'conditionCreateTextProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$conditionCreateTextHash,
          dependencies: ConditionCreateTextFamily._dependencies,
          allTransitiveDependencies:
              ConditionCreateTextFamily._allTransitiveDependencies,
          text: text,
        );

  ConditionCreateTextProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.text,
  }) : super.internal();

  final String text;

  @override
  Override overrideWith(
    FutureOr<void> Function(ConditionCreateTextRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConditionCreateTextProvider._internal(
        (ref) => create(ref as ConditionCreateTextRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        text: text,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ConditionCreateTextProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConditionCreateTextProvider && other.text == text;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, text.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ConditionCreateTextRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `text` of this provider.
  String get text;
}

class _ConditionCreateTextProviderElement
    extends AutoDisposeFutureProviderElement<void> with ConditionCreateTextRef {
  _ConditionCreateTextProviderElement(super.provider);

  @override
  String get text => (origin as ConditionCreateTextProvider).text;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

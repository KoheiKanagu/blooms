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
String _$conditionQueryHash() => r'b21afc4d4f529573a18fc31105878ed4ef46f528';

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

String _$conditionCreateSubjectiveHash() =>
    r'e1cd42e97ee68b58406e3b6710a8ee46cc3b33ed';

/// See also [conditionCreateSubjective].
@ProviderFor(conditionCreateSubjective)
const conditionCreateSubjectiveProvider = ConditionCreateSubjectiveFamily();

/// See also [conditionCreateSubjective].
class ConditionCreateSubjectiveFamily extends Family<AsyncValue<void>> {
  /// See also [conditionCreateSubjective].
  const ConditionCreateSubjectiveFamily();

  /// See also [conditionCreateSubjective].
  ConditionCreateSubjectiveProvider call({
    required String record,
  }) {
    return ConditionCreateSubjectiveProvider(
      record: record,
    );
  }

  @override
  ConditionCreateSubjectiveProvider getProviderOverride(
    covariant ConditionCreateSubjectiveProvider provider,
  ) {
    return call(
      record: provider.record,
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
  String? get name => r'conditionCreateSubjectiveProvider';
}

/// See also [conditionCreateSubjective].
class ConditionCreateSubjectiveProvider
    extends AutoDisposeFutureProvider<void> {
  /// See also [conditionCreateSubjective].
  ConditionCreateSubjectiveProvider({
    required String record,
  }) : this._internal(
          (ref) => conditionCreateSubjective(
            ref as ConditionCreateSubjectiveRef,
            record: record,
          ),
          from: conditionCreateSubjectiveProvider,
          name: r'conditionCreateSubjectiveProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$conditionCreateSubjectiveHash,
          dependencies: ConditionCreateSubjectiveFamily._dependencies,
          allTransitiveDependencies:
              ConditionCreateSubjectiveFamily._allTransitiveDependencies,
          record: record,
        );

  ConditionCreateSubjectiveProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.record,
  }) : super.internal();

  final String record;

  @override
  Override overrideWith(
    FutureOr<void> Function(ConditionCreateSubjectiveRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConditionCreateSubjectiveProvider._internal(
        (ref) => create(ref as ConditionCreateSubjectiveRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        record: record,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ConditionCreateSubjectiveProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConditionCreateSubjectiveProvider && other.record == record;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, record.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ConditionCreateSubjectiveRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `record` of this provider.
  String get record;
}

class _ConditionCreateSubjectiveProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with ConditionCreateSubjectiveRef {
  _ConditionCreateSubjectiveProviderElement(super.provider);

  @override
  String get record => (origin as ConditionCreateSubjectiveProvider).record;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

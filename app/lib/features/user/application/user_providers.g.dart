// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'user_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userCollectionReferenceHash() =>
    r'c2c2d5d6d979c6cdd18c3a9d25303c6d6df1b37d';

/// See also [userCollectionReference].
@ProviderFor(userCollectionReference)
final userCollectionReferenceProvider =
    Provider<CollectionReference<User>>.internal(
  userCollectionReference,
  name: r'userCollectionReferenceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userCollectionReferenceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserCollectionReferenceRef = ProviderRef<CollectionReference<User>>;
String _$userDocumentSnapshotHash() =>
    r'0819feb0eb14e41023de9556b8ec29cfe4c13598';

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

/// See also [userDocumentSnapshot].
@ProviderFor(userDocumentSnapshot)
const userDocumentSnapshotProvider = UserDocumentSnapshotFamily();

/// See also [userDocumentSnapshot].
class UserDocumentSnapshotFamily
    extends Family<AsyncValue<DocumentSnapshot<User>>> {
  /// See also [userDocumentSnapshot].
  const UserDocumentSnapshotFamily();

  /// See also [userDocumentSnapshot].
  UserDocumentSnapshotProvider call(
    String uid,
  ) {
    return UserDocumentSnapshotProvider(
      uid,
    );
  }

  @override
  UserDocumentSnapshotProvider getProviderOverride(
    covariant UserDocumentSnapshotProvider provider,
  ) {
    return call(
      provider.uid,
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
  String? get name => r'userDocumentSnapshotProvider';
}

/// See also [userDocumentSnapshot].
class UserDocumentSnapshotProvider
    extends AutoDisposeStreamProvider<DocumentSnapshot<User>> {
  /// See also [userDocumentSnapshot].
  UserDocumentSnapshotProvider(
    String uid,
  ) : this._internal(
          (ref) => userDocumentSnapshot(
            ref as UserDocumentSnapshotRef,
            uid,
          ),
          from: userDocumentSnapshotProvider,
          name: r'userDocumentSnapshotProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userDocumentSnapshotHash,
          dependencies: UserDocumentSnapshotFamily._dependencies,
          allTransitiveDependencies:
              UserDocumentSnapshotFamily._allTransitiveDependencies,
          uid: uid,
        );

  UserDocumentSnapshotProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
  }) : super.internal();

  final String uid;

  @override
  Override overrideWith(
    Stream<DocumentSnapshot<User>> Function(UserDocumentSnapshotRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserDocumentSnapshotProvider._internal(
        (ref) => create(ref as UserDocumentSnapshotRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uid: uid,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<DocumentSnapshot<User>> createElement() {
    return _UserDocumentSnapshotProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserDocumentSnapshotProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserDocumentSnapshotRef
    on AutoDisposeStreamProviderRef<DocumentSnapshot<User>> {
  /// The parameter `uid` of this provider.
  String get uid;
}

class _UserDocumentSnapshotProviderElement
    extends AutoDisposeStreamProviderElement<DocumentSnapshot<User>>
    with UserDocumentSnapshotRef {
  _UserDocumentSnapshotProviderElement(super.provider);

  @override
  String get uid => (origin as UserDocumentSnapshotProvider).uid;
}

String _$userDeleteHash() => r'b55c58404e01a2c3ddf21075b14055ab4f924f5c';

/// See also [userDelete].
@ProviderFor(userDelete)
const userDeleteProvider = UserDeleteFamily();

/// See also [userDelete].
class UserDeleteFamily extends Family<AsyncValue<void>> {
  /// See also [userDelete].
  const UserDeleteFamily();

  /// See also [userDelete].
  UserDeleteProvider call({
    required DocumentReference<User> reference,
  }) {
    return UserDeleteProvider(
      reference: reference,
    );
  }

  @override
  UserDeleteProvider getProviderOverride(
    covariant UserDeleteProvider provider,
  ) {
    return call(
      reference: provider.reference,
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
  String? get name => r'userDeleteProvider';
}

/// See also [userDelete].
class UserDeleteProvider extends AutoDisposeFutureProvider<void> {
  /// See also [userDelete].
  UserDeleteProvider({
    required DocumentReference<User> reference,
  }) : this._internal(
          (ref) => userDelete(
            ref as UserDeleteRef,
            reference: reference,
          ),
          from: userDeleteProvider,
          name: r'userDeleteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userDeleteHash,
          dependencies: UserDeleteFamily._dependencies,
          allTransitiveDependencies:
              UserDeleteFamily._allTransitiveDependencies,
          reference: reference,
        );

  UserDeleteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.reference,
  }) : super.internal();

  final DocumentReference<User> reference;

  @override
  Override overrideWith(
    FutureOr<void> Function(UserDeleteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserDeleteProvider._internal(
        (ref) => create(ref as UserDeleteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        reference: reference,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UserDeleteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserDeleteProvider && other.reference == reference;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, reference.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserDeleteRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `reference` of this provider.
  DocumentReference<User> get reference;
}

class _UserDeleteProviderElement extends AutoDisposeFutureProviderElement<void>
    with UserDeleteRef {
  _UserDeleteProviderElement(super.provider);

  @override
  DocumentReference<User> get reference =>
      (origin as UserDeleteProvider).reference;
}

String _$userHash() => r'9e15d0b0f2c01d7be55fb7aeb8ec502ebf5f69ab';

/// See also [user].
@ProviderFor(user)
final userProvider = AutoDisposeStreamProvider<UserDocument?>.internal(
  user,
  name: r'userProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserRef = AutoDisposeStreamProviderRef<UserDocument?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'firebase_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseFirestoreHash() => r'eca974fdc891fcd3f9586742678f47582b20adec';

/// See also [firebaseFirestore].
@ProviderFor(firebaseFirestore)
final firebaseFirestoreProvider =
    AutoDisposeProvider<FirebaseFirestore>.internal(
  firebaseFirestore,
  name: r'firebaseFirestoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseFirestoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirebaseFirestoreRef = AutoDisposeProviderRef<FirebaseFirestore>;
String _$firebaseCrashlyticsHash() =>
    r'011819a5f3ce1923a2df677a4d83544b648711e6';

/// See also [firebaseCrashlytics].
@ProviderFor(firebaseCrashlytics)
final firebaseCrashlyticsProvider =
    AutoDisposeProvider<FirebaseCrashlytics>.internal(
  firebaseCrashlytics,
  name: r'firebaseCrashlyticsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseCrashlyticsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirebaseCrashlyticsRef = AutoDisposeProviderRef<FirebaseCrashlytics>;
String _$firebaseAuthHash() => r'8f84097cccd00af817397c1715c5f537399ba780';

/// See also [firebaseAuth].
@ProviderFor(firebaseAuth)
final firebaseAuthProvider = AutoDisposeProvider<FirebaseAuth>.internal(
  firebaseAuth,
  name: r'firebaseAuthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$firebaseAuthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirebaseAuthRef = AutoDisposeProviderRef<FirebaseAuth>;
String _$firebaseMessagingHash() => r'5e9baf830c916e075321e6c66ba316573c77e98f';

/// See also [firebaseMessaging].
@ProviderFor(firebaseMessaging)
final firebaseMessagingProvider =
    AutoDisposeProvider<FirebaseMessaging>.internal(
  firebaseMessaging,
  name: r'firebaseMessagingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseMessagingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirebaseMessagingRef = AutoDisposeProviderRef<FirebaseMessaging>;
String _$firebaseStorageHash() => r'47903c48019f7dfa1ba82fa0a905885442d69f6b';

/// See also [firebaseStorage].
@ProviderFor(firebaseStorage)
final firebaseStorageProvider = AutoDisposeProvider<FirebaseStorage>.internal(
  firebaseStorage,
  name: r'firebaseStorageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseStorageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirebaseStorageRef = AutoDisposeProviderRef<FirebaseStorage>;
String _$firebaseStorageGsFileDownloadUrlsHash() =>
    r'ee2d6b0a8e5c4189087ad32fbe7f4ab47a53f4c9';

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

/// See also [firebaseStorageGsFileDownloadUrls].
@ProviderFor(firebaseStorageGsFileDownloadUrls)
const firebaseStorageGsFileDownloadUrlsProvider =
    FirebaseStorageGsFileDownloadUrlsFamily();

/// See also [firebaseStorageGsFileDownloadUrls].
class FirebaseStorageGsFileDownloadUrlsFamily
    extends Family<AsyncValue<List<String>>> {
  /// See also [firebaseStorageGsFileDownloadUrls].
  const FirebaseStorageGsFileDownloadUrlsFamily();

  /// See also [firebaseStorageGsFileDownloadUrls].
  FirebaseStorageGsFileDownloadUrlsProvider call({
    required List<String> gsPaths,
  }) {
    return FirebaseStorageGsFileDownloadUrlsProvider(
      gsPaths: gsPaths,
    );
  }

  @override
  FirebaseStorageGsFileDownloadUrlsProvider getProviderOverride(
    covariant FirebaseStorageGsFileDownloadUrlsProvider provider,
  ) {
    return call(
      gsPaths: provider.gsPaths,
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
  String? get name => r'firebaseStorageGsFileDownloadUrlsProvider';
}

/// See also [firebaseStorageGsFileDownloadUrls].
class FirebaseStorageGsFileDownloadUrlsProvider
    extends AutoDisposeFutureProvider<List<String>> {
  /// See also [firebaseStorageGsFileDownloadUrls].
  FirebaseStorageGsFileDownloadUrlsProvider({
    required List<String> gsPaths,
  }) : this._internal(
          (ref) => firebaseStorageGsFileDownloadUrls(
            ref as FirebaseStorageGsFileDownloadUrlsRef,
            gsPaths: gsPaths,
          ),
          from: firebaseStorageGsFileDownloadUrlsProvider,
          name: r'firebaseStorageGsFileDownloadUrlsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$firebaseStorageGsFileDownloadUrlsHash,
          dependencies: FirebaseStorageGsFileDownloadUrlsFamily._dependencies,
          allTransitiveDependencies: FirebaseStorageGsFileDownloadUrlsFamily
              ._allTransitiveDependencies,
          gsPaths: gsPaths,
        );

  FirebaseStorageGsFileDownloadUrlsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.gsPaths,
  }) : super.internal();

  final List<String> gsPaths;

  @override
  Override overrideWith(
    FutureOr<List<String>> Function(
            FirebaseStorageGsFileDownloadUrlsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FirebaseStorageGsFileDownloadUrlsProvider._internal(
        (ref) => create(ref as FirebaseStorageGsFileDownloadUrlsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        gsPaths: gsPaths,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<String>> createElement() {
    return _FirebaseStorageGsFileDownloadUrlsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FirebaseStorageGsFileDownloadUrlsProvider &&
        other.gsPaths == gsPaths;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, gsPaths.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FirebaseStorageGsFileDownloadUrlsRef
    on AutoDisposeFutureProviderRef<List<String>> {
  /// The parameter `gsPaths` of this provider.
  List<String> get gsPaths;
}

class _FirebaseStorageGsFileDownloadUrlsProviderElement
    extends AutoDisposeFutureProviderElement<List<String>>
    with FirebaseStorageGsFileDownloadUrlsRef {
  _FirebaseStorageGsFileDownloadUrlsProviderElement(super.provider);

  @override
  List<String> get gsPaths =>
      (origin as FirebaseStorageGsFileDownloadUrlsProvider).gsPaths;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

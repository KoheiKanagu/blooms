// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'firebase_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseFirestoreHash() => r'211c9d7cd91051da8adfacbf85a09b8bad1d41e8';

/// See also [firebaseFirestore].
@ProviderFor(firebaseFirestore)
final firebaseFirestoreProvider = Provider<FirebaseFirestore>.internal(
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
typedef FirebaseFirestoreRef = ProviderRef<FirebaseFirestore>;
String _$firebaseCrashlyticsHash() =>
    r'b676b545954cfaab78c5f4cfd7d774d97c96dcad';

/// See also [firebaseCrashlytics].
@ProviderFor(firebaseCrashlytics)
final firebaseCrashlyticsProvider = Provider<FirebaseCrashlytics>.internal(
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
typedef FirebaseCrashlyticsRef = ProviderRef<FirebaseCrashlytics>;
String _$firebaseAuthHash() => r'8c3e9d11b27110ca96130356b5ef4d5d34a5ffc2';

/// See also [firebaseAuth].
@ProviderFor(firebaseAuth)
final firebaseAuthProvider = Provider<FirebaseAuth>.internal(
  firebaseAuth,
  name: r'firebaseAuthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$firebaseAuthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirebaseAuthRef = ProviderRef<FirebaseAuth>;
String _$firebaseMessagingHash() => r'6765ce963b9b8c50186b5132356d60eb68265741';

/// See also [firebaseMessaging].
@ProviderFor(firebaseMessaging)
final firebaseMessagingProvider = Provider<FirebaseMessaging>.internal(
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
typedef FirebaseMessagingRef = ProviderRef<FirebaseMessaging>;
String _$firebaseStorageHash() => r'4d34fbbd82ac849c74805e19a05079afa5e20cad';

/// See also [firebaseStorage].
@ProviderFor(firebaseStorage)
final firebaseStorageProvider = Provider<FirebaseStorage>.internal(
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
typedef FirebaseStorageRef = ProviderRef<FirebaseStorage>;
String _$firebaseStorageGsFileDownloadUrlsHash() =>
    r'a0cec94b1d0986b4a068aa8beadd617065dc53f1';

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
    required List<String> fileUris,
  }) {
    return FirebaseStorageGsFileDownloadUrlsProvider(
      fileUris: fileUris,
    );
  }

  @override
  FirebaseStorageGsFileDownloadUrlsProvider getProviderOverride(
    covariant FirebaseStorageGsFileDownloadUrlsProvider provider,
  ) {
    return call(
      fileUris: provider.fileUris,
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
    required List<String> fileUris,
  }) : this._internal(
          (ref) => firebaseStorageGsFileDownloadUrls(
            ref as FirebaseStorageGsFileDownloadUrlsRef,
            fileUris: fileUris,
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
          fileUris: fileUris,
        );

  FirebaseStorageGsFileDownloadUrlsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fileUris,
  }) : super.internal();

  final List<String> fileUris;

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
        fileUris: fileUris,
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
        other.fileUris == fileUris;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fileUris.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FirebaseStorageGsFileDownloadUrlsRef
    on AutoDisposeFutureProviderRef<List<String>> {
  /// The parameter `fileUris` of this provider.
  List<String> get fileUris;
}

class _FirebaseStorageGsFileDownloadUrlsProviderElement
    extends AutoDisposeFutureProviderElement<List<String>>
    with FirebaseStorageGsFileDownloadUrlsRef {
  _FirebaseStorageGsFileDownloadUrlsProviderElement(super.provider);

  @override
  List<String> get fileUris =>
      (origin as FirebaseStorageGsFileDownloadUrlsProvider).fileUris;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

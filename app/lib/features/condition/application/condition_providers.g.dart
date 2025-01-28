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
String _$conditionQueryHash() => r'b4fe3f715bc4c98a873bee7335bb96d093b90e13';

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

String _$conditionImageStorageReferenceHash() =>
    r'd102346438f1ad2154f9da66fff6bfd61e04c10f';

/// See also [conditionImageStorageReference].
@ProviderFor(conditionImageStorageReference)
const conditionImageStorageReferenceProvider =
    ConditionImageStorageReferenceFamily();

/// See also [conditionImageStorageReference].
class ConditionImageStorageReferenceFamily
    extends Family<AsyncValue<Reference>> {
  /// See also [conditionImageStorageReference].
  const ConditionImageStorageReferenceFamily();

  /// See also [conditionImageStorageReference].
  ConditionImageStorageReferenceProvider call({
    required String uid,
    required String fileName,
  }) {
    return ConditionImageStorageReferenceProvider(
      uid: uid,
      fileName: fileName,
    );
  }

  @override
  ConditionImageStorageReferenceProvider getProviderOverride(
    covariant ConditionImageStorageReferenceProvider provider,
  ) {
    return call(
      uid: provider.uid,
      fileName: provider.fileName,
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
  String? get name => r'conditionImageStorageReferenceProvider';
}

/// See also [conditionImageStorageReference].
class ConditionImageStorageReferenceProvider
    extends AutoDisposeFutureProvider<Reference> {
  /// See also [conditionImageStorageReference].
  ConditionImageStorageReferenceProvider({
    required String uid,
    required String fileName,
  }) : this._internal(
          (ref) => conditionImageStorageReference(
            ref as ConditionImageStorageReferenceRef,
            uid: uid,
            fileName: fileName,
          ),
          from: conditionImageStorageReferenceProvider,
          name: r'conditionImageStorageReferenceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$conditionImageStorageReferenceHash,
          dependencies: ConditionImageStorageReferenceFamily._dependencies,
          allTransitiveDependencies:
              ConditionImageStorageReferenceFamily._allTransitiveDependencies,
          uid: uid,
          fileName: fileName,
        );

  ConditionImageStorageReferenceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
    required this.fileName,
  }) : super.internal();

  final String uid;
  final String fileName;

  @override
  Override overrideWith(
    FutureOr<Reference> Function(ConditionImageStorageReferenceRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConditionImageStorageReferenceProvider._internal(
        (ref) => create(ref as ConditionImageStorageReferenceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uid: uid,
        fileName: fileName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Reference> createElement() {
    return _ConditionImageStorageReferenceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConditionImageStorageReferenceProvider &&
        other.uid == uid &&
        other.fileName == fileName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);
    hash = _SystemHash.combine(hash, fileName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ConditionImageStorageReferenceRef
    on AutoDisposeFutureProviderRef<Reference> {
  /// The parameter `uid` of this provider.
  String get uid;

  /// The parameter `fileName` of this provider.
  String get fileName;
}

class _ConditionImageStorageReferenceProviderElement
    extends AutoDisposeFutureProviderElement<Reference>
    with ConditionImageStorageReferenceRef {
  _ConditionImageStorageReferenceProviderElement(super.provider);

  @override
  String get uid => (origin as ConditionImageStorageReferenceProvider).uid;
  @override
  String get fileName =>
      (origin as ConditionImageStorageReferenceProvider).fileName;
}

String _$conditionCreateImageHash() =>
    r'11af638d485757eeb74ffade298ae3e65fbb0576';

/// See also [conditionCreateImage].
@ProviderFor(conditionCreateImage)
const conditionCreateImageProvider = ConditionCreateImageFamily();

/// See also [conditionCreateImage].
class ConditionCreateImageFamily extends Family<AsyncValue<void>> {
  /// See also [conditionCreateImage].
  const ConditionCreateImageFamily();

  /// See also [conditionCreateImage].
  ConditionCreateImageProvider call({
    required List<XFile> xFiles,
  }) {
    return ConditionCreateImageProvider(
      xFiles: xFiles,
    );
  }

  @override
  ConditionCreateImageProvider getProviderOverride(
    covariant ConditionCreateImageProvider provider,
  ) {
    return call(
      xFiles: provider.xFiles,
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
  String? get name => r'conditionCreateImageProvider';
}

/// See also [conditionCreateImage].
class ConditionCreateImageProvider extends AutoDisposeFutureProvider<void> {
  /// See also [conditionCreateImage].
  ConditionCreateImageProvider({
    required List<XFile> xFiles,
  }) : this._internal(
          (ref) => conditionCreateImage(
            ref as ConditionCreateImageRef,
            xFiles: xFiles,
          ),
          from: conditionCreateImageProvider,
          name: r'conditionCreateImageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$conditionCreateImageHash,
          dependencies: ConditionCreateImageFamily._dependencies,
          allTransitiveDependencies:
              ConditionCreateImageFamily._allTransitiveDependencies,
          xFiles: xFiles,
        );

  ConditionCreateImageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.xFiles,
  }) : super.internal();

  final List<XFile> xFiles;

  @override
  Override overrideWith(
    FutureOr<void> Function(ConditionCreateImageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConditionCreateImageProvider._internal(
        (ref) => create(ref as ConditionCreateImageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        xFiles: xFiles,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ConditionCreateImageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConditionCreateImageProvider && other.xFiles == xFiles;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, xFiles.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ConditionCreateImageRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `xFiles` of this provider.
  List<XFile> get xFiles;
}

class _ConditionCreateImageProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with ConditionCreateImageRef {
  _ConditionCreateImageProviderElement(super.provider);

  @override
  List<XFile> get xFiles => (origin as ConditionCreateImageProvider).xFiles;
}

String _$conditionAudioStorageReferenceHash() =>
    r'b92a571a34e6c51957d8cfa0c2166ee0fd95ebb2';

/// See also [conditionAudioStorageReference].
@ProviderFor(conditionAudioStorageReference)
const conditionAudioStorageReferenceProvider =
    ConditionAudioStorageReferenceFamily();

/// See also [conditionAudioStorageReference].
class ConditionAudioStorageReferenceFamily
    extends Family<AsyncValue<Reference>> {
  /// See also [conditionAudioStorageReference].
  const ConditionAudioStorageReferenceFamily();

  /// See also [conditionAudioStorageReference].
  ConditionAudioStorageReferenceProvider call({
    required String uid,
    required String fileName,
  }) {
    return ConditionAudioStorageReferenceProvider(
      uid: uid,
      fileName: fileName,
    );
  }

  @override
  ConditionAudioStorageReferenceProvider getProviderOverride(
    covariant ConditionAudioStorageReferenceProvider provider,
  ) {
    return call(
      uid: provider.uid,
      fileName: provider.fileName,
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
  String? get name => r'conditionAudioStorageReferenceProvider';
}

/// See also [conditionAudioStorageReference].
class ConditionAudioStorageReferenceProvider
    extends AutoDisposeFutureProvider<Reference> {
  /// See also [conditionAudioStorageReference].
  ConditionAudioStorageReferenceProvider({
    required String uid,
    required String fileName,
  }) : this._internal(
          (ref) => conditionAudioStorageReference(
            ref as ConditionAudioStorageReferenceRef,
            uid: uid,
            fileName: fileName,
          ),
          from: conditionAudioStorageReferenceProvider,
          name: r'conditionAudioStorageReferenceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$conditionAudioStorageReferenceHash,
          dependencies: ConditionAudioStorageReferenceFamily._dependencies,
          allTransitiveDependencies:
              ConditionAudioStorageReferenceFamily._allTransitiveDependencies,
          uid: uid,
          fileName: fileName,
        );

  ConditionAudioStorageReferenceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
    required this.fileName,
  }) : super.internal();

  final String uid;
  final String fileName;

  @override
  Override overrideWith(
    FutureOr<Reference> Function(ConditionAudioStorageReferenceRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConditionAudioStorageReferenceProvider._internal(
        (ref) => create(ref as ConditionAudioStorageReferenceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uid: uid,
        fileName: fileName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Reference> createElement() {
    return _ConditionAudioStorageReferenceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConditionAudioStorageReferenceProvider &&
        other.uid == uid &&
        other.fileName == fileName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);
    hash = _SystemHash.combine(hash, fileName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ConditionAudioStorageReferenceRef
    on AutoDisposeFutureProviderRef<Reference> {
  /// The parameter `uid` of this provider.
  String get uid;

  /// The parameter `fileName` of this provider.
  String get fileName;
}

class _ConditionAudioStorageReferenceProviderElement
    extends AutoDisposeFutureProviderElement<Reference>
    with ConditionAudioStorageReferenceRef {
  _ConditionAudioStorageReferenceProviderElement(super.provider);

  @override
  String get uid => (origin as ConditionAudioStorageReferenceProvider).uid;
  @override
  String get fileName =>
      (origin as ConditionAudioStorageReferenceProvider).fileName;
}

String _$conditionCreateAudioHash() =>
    r'a4ec503ffb4437c2efb9488aa365aedcf9e3010f';

/// See also [conditionCreateAudio].
@ProviderFor(conditionCreateAudio)
const conditionCreateAudioProvider = ConditionCreateAudioFamily();

/// See also [conditionCreateAudio].
class ConditionCreateAudioFamily extends Family<AsyncValue<void>> {
  /// See also [conditionCreateAudio].
  const ConditionCreateAudioFamily();

  /// See also [conditionCreateAudio].
  ConditionCreateAudioProvider call({
    required XFile xFile,
  }) {
    return ConditionCreateAudioProvider(
      xFile: xFile,
    );
  }

  @override
  ConditionCreateAudioProvider getProviderOverride(
    covariant ConditionCreateAudioProvider provider,
  ) {
    return call(
      xFile: provider.xFile,
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
  String? get name => r'conditionCreateAudioProvider';
}

/// See also [conditionCreateAudio].
class ConditionCreateAudioProvider extends AutoDisposeFutureProvider<void> {
  /// See also [conditionCreateAudio].
  ConditionCreateAudioProvider({
    required XFile xFile,
  }) : this._internal(
          (ref) => conditionCreateAudio(
            ref as ConditionCreateAudioRef,
            xFile: xFile,
          ),
          from: conditionCreateAudioProvider,
          name: r'conditionCreateAudioProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$conditionCreateAudioHash,
          dependencies: ConditionCreateAudioFamily._dependencies,
          allTransitiveDependencies:
              ConditionCreateAudioFamily._allTransitiveDependencies,
          xFile: xFile,
        );

  ConditionCreateAudioProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.xFile,
  }) : super.internal();

  final XFile xFile;

  @override
  Override overrideWith(
    FutureOr<void> Function(ConditionCreateAudioRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConditionCreateAudioProvider._internal(
        (ref) => create(ref as ConditionCreateAudioRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        xFile: xFile,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ConditionCreateAudioProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConditionCreateAudioProvider && other.xFile == xFile;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, xFile.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ConditionCreateAudioRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `xFile` of this provider.
  XFile get xFile;
}

class _ConditionCreateAudioProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with ConditionCreateAudioRef {
  _ConditionCreateAudioProviderElement(super.provider);

  @override
  XFile get xFile => (origin as ConditionCreateAudioProvider).xFile;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'condition_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$conditionCollectionReferenceHash() =>
    r'2d68de0e2dfc48f7460c928f7194d0d27c2dec61';

/// See also [conditionCollectionReference].
@ProviderFor(conditionCollectionReference)
final conditionCollectionReferenceProvider =
    Provider<CollectionReference<Condition>>.internal(
      conditionCollectionReference,
      name: r'conditionCollectionReferenceProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$conditionCollectionReferenceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConditionCollectionReferenceRef =
    ProviderRef<CollectionReference<Condition>>;
String _$conditionQueryHash() => r'04fd14e241ad1a678be5bf33dc2483c8b2f8bf26';

/// See also [conditionQuery].
@ProviderFor(conditionQuery)
final conditionQueryProvider =
    AutoDisposeFutureProvider<Query<Condition>>.internal(
      conditionQuery,
      name: r'conditionQueryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$conditionQueryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConditionQueryRef = AutoDisposeFutureProviderRef<Query<Condition>>;
String _$conditionDeleteHash() => r'e0cac1cd1b378612fc36f6d6aa5a42a536c242a0';

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
  ConditionDeleteProvider call({required String documentId}) {
    return ConditionDeleteProvider(documentId: documentId);
  }

  @override
  ConditionDeleteProvider getProviderOverride(
    covariant ConditionDeleteProvider provider,
  ) {
    return call(documentId: provider.documentId);
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
  ConditionDeleteProvider({required String documentId})
    : this._internal(
        (ref) =>
            conditionDelete(ref as ConditionDeleteRef, documentId: documentId),
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
    extends AutoDisposeFutureProviderElement<void>
    with ConditionDeleteRef {
  _ConditionDeleteProviderElement(super.provider);

  @override
  String get documentId => (origin as ConditionDeleteProvider).documentId;
}

String _$conditionCreateTextHash() =>
    r'592ef4a2a250d67bd9dbec7f13825b837d1bcb2f';

/// See also [conditionCreateText].
@ProviderFor(conditionCreateText)
const conditionCreateTextProvider = ConditionCreateTextFamily();

/// See also [conditionCreateText].
class ConditionCreateTextFamily extends Family<AsyncValue<void>> {
  /// See also [conditionCreateText].
  const ConditionCreateTextFamily();

  /// See also [conditionCreateText].
  ConditionCreateTextProvider call({required String text}) {
    return ConditionCreateTextProvider(text: text);
  }

  @override
  ConditionCreateTextProvider getProviderOverride(
    covariant ConditionCreateTextProvider provider,
  ) {
    return call(text: provider.text);
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
  ConditionCreateTextProvider({required String text})
    : this._internal(
        (ref) => conditionCreateText(ref as ConditionCreateTextRef, text: text),
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
    extends AutoDisposeFutureProviderElement<void>
    with ConditionCreateTextRef {
  _ConditionCreateTextProviderElement(super.provider);

  @override
  String get text => (origin as ConditionCreateTextProvider).text;
}

String _$conditionCreateImageHash() =>
    r'd37a26fd803674353a64f648b15cf58c79f1df25';

/// See also [conditionCreateImage].
@ProviderFor(conditionCreateImage)
const conditionCreateImageProvider = ConditionCreateImageFamily();

/// See also [conditionCreateImage].
class ConditionCreateImageFamily extends Family<AsyncValue<void>> {
  /// See also [conditionCreateImage].
  const ConditionCreateImageFamily();

  /// See also [conditionCreateImage].
  ConditionCreateImageProvider call({required List<XFile> xFiles}) {
    return ConditionCreateImageProvider(xFiles: xFiles);
  }

  @override
  ConditionCreateImageProvider getProviderOverride(
    covariant ConditionCreateImageProvider provider,
  ) {
    return call(xFiles: provider.xFiles);
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
  ConditionCreateImageProvider({required List<XFile> xFiles})
    : this._internal(
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
    r'341ad8426a80b549d7a043df2373788e86fa880b';

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
    return ConditionAudioStorageReferenceProvider(uid: uid, fileName: fileName);
  }

  @override
  ConditionAudioStorageReferenceProvider getProviderOverride(
    covariant ConditionAudioStorageReferenceProvider provider,
  ) {
    return call(uid: provider.uid, fileName: provider.fileName);
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
    r'77f40f5ec34e0bbab2bfd42de5bcadd9e35d6a2c';

/// See also [conditionCreateAudio].
@ProviderFor(conditionCreateAudio)
const conditionCreateAudioProvider = ConditionCreateAudioFamily();

/// See also [conditionCreateAudio].
class ConditionCreateAudioFamily extends Family<AsyncValue<void>> {
  /// See also [conditionCreateAudio].
  const ConditionCreateAudioFamily();

  /// See also [conditionCreateAudio].
  ConditionCreateAudioProvider call({required XFile xFile}) {
    return ConditionCreateAudioProvider(xFile: xFile);
  }

  @override
  ConditionCreateAudioProvider getProviderOverride(
    covariant ConditionCreateAudioProvider provider,
  ) {
    return call(xFile: provider.xFile);
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
  ConditionCreateAudioProvider({required XFile xFile})
    : this._internal(
        (ref) =>
            conditionCreateAudio(ref as ConditionCreateAudioRef, xFile: xFile),
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

String _$conditionFormHeightControllerHash() =>
    r'60f5581ed7dda85770da30c71307d4a99ff5b4d3';

/// [ConditionForm]の高さを計算する
///
/// Copied from [ConditionFormHeightController].
@ProviderFor(ConditionFormHeightController)
final conditionFormHeightControllerProvider =
    AutoDisposeNotifierProvider<ConditionFormHeightController, double>.internal(
      ConditionFormHeightController.new,
      name: r'conditionFormHeightControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$conditionFormHeightControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ConditionFormHeightController = AutoDisposeNotifier<double>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

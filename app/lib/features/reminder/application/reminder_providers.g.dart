// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'reminder_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$flutterLocalNotificationsPluginHash() =>
    r'2db49bbfb81bcbc2aafa571e10dd243629d78385';

/// See also [flutterLocalNotificationsPlugin].
@ProviderFor(flutterLocalNotificationsPlugin)
final flutterLocalNotificationsPluginProvider =
    Provider<FlutterLocalNotificationsPlugin>.internal(
  flutterLocalNotificationsPlugin,
  name: r'flutterLocalNotificationsPluginProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flutterLocalNotificationsPluginHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FlutterLocalNotificationsPluginRef
    = ProviderRef<FlutterLocalNotificationsPlugin>;
String _$flutterLocalNotificationPluginInitializeHash() =>
    r'cbce7d0e20d7fbba27ce4ee1b7737a549c99c802';

/// See also [flutterLocalNotificationPluginInitialize].
@ProviderFor(flutterLocalNotificationPluginInitialize)
final flutterLocalNotificationPluginInitializeProvider =
    AutoDisposeFutureProvider<void>.internal(
  flutterLocalNotificationPluginInitialize,
  name: r'flutterLocalNotificationPluginInitializeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flutterLocalNotificationPluginInitializeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FlutterLocalNotificationPluginInitializeRef
    = AutoDisposeFutureProviderRef<void>;
String _$reminderTimeHash() => r'5af5e8c62cd95e2255eb04d7869b0cdae5b9ea51';

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

/// 通知の時間を取得
///
/// Copied from [reminderTime].
@ProviderFor(reminderTime)
const reminderTimeProvider = ReminderTimeFamily();

/// 通知の時間を取得
///
/// Copied from [reminderTime].
class ReminderTimeFamily extends Family<AsyncValue<TimeOfDay>> {
  /// 通知の時間を取得
  ///
  /// Copied from [reminderTime].
  const ReminderTimeFamily();

  /// 通知の時間を取得
  ///
  /// Copied from [reminderTime].
  ReminderTimeProvider call(
    ReminderType type,
  ) {
    return ReminderTimeProvider(
      type,
    );
  }

  @override
  ReminderTimeProvider getProviderOverride(
    covariant ReminderTimeProvider provider,
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
  String? get name => r'reminderTimeProvider';
}

/// 通知の時間を取得
///
/// Copied from [reminderTime].
class ReminderTimeProvider extends AutoDisposeFutureProvider<TimeOfDay> {
  /// 通知の時間を取得
  ///
  /// Copied from [reminderTime].
  ReminderTimeProvider(
    ReminderType type,
  ) : this._internal(
          (ref) => reminderTime(
            ref as ReminderTimeRef,
            type,
          ),
          from: reminderTimeProvider,
          name: r'reminderTimeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$reminderTimeHash,
          dependencies: ReminderTimeFamily._dependencies,
          allTransitiveDependencies:
              ReminderTimeFamily._allTransitiveDependencies,
          type: type,
        );

  ReminderTimeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final ReminderType type;

  @override
  Override overrideWith(
    FutureOr<TimeOfDay> Function(ReminderTimeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ReminderTimeProvider._internal(
        (ref) => create(ref as ReminderTimeRef),
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
  AutoDisposeFutureProviderElement<TimeOfDay> createElement() {
    return _ReminderTimeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReminderTimeProvider && other.type == type;
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
mixin ReminderTimeRef on AutoDisposeFutureProviderRef<TimeOfDay> {
  /// The parameter `type` of this provider.
  ReminderType get type;
}

class _ReminderTimeProviderElement
    extends AutoDisposeFutureProviderElement<TimeOfDay> with ReminderTimeRef {
  _ReminderTimeProviderElement(super.provider);

  @override
  ReminderType get type => (origin as ReminderTimeProvider).type;
}

String _$reminderStatusHash() => r'927f1f06883f5f088cf4e1ea4957ae388de25c2c';

/// 通知の有効状態を取得
///
/// Copied from [reminderStatus].
@ProviderFor(reminderStatus)
const reminderStatusProvider = ReminderStatusFamily();

/// 通知の有効状態を取得
///
/// Copied from [reminderStatus].
class ReminderStatusFamily extends Family<AsyncValue<bool>> {
  /// 通知の有効状態を取得
  ///
  /// Copied from [reminderStatus].
  const ReminderStatusFamily();

  /// 通知の有効状態を取得
  ///
  /// Copied from [reminderStatus].
  ReminderStatusProvider call(
    ReminderType type,
  ) {
    return ReminderStatusProvider(
      type,
    );
  }

  @override
  ReminderStatusProvider getProviderOverride(
    covariant ReminderStatusProvider provider,
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
  String? get name => r'reminderStatusProvider';
}

/// 通知の有効状態を取得
///
/// Copied from [reminderStatus].
class ReminderStatusProvider extends AutoDisposeFutureProvider<bool> {
  /// 通知の有効状態を取得
  ///
  /// Copied from [reminderStatus].
  ReminderStatusProvider(
    ReminderType type,
  ) : this._internal(
          (ref) => reminderStatus(
            ref as ReminderStatusRef,
            type,
          ),
          from: reminderStatusProvider,
          name: r'reminderStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$reminderStatusHash,
          dependencies: ReminderStatusFamily._dependencies,
          allTransitiveDependencies:
              ReminderStatusFamily._allTransitiveDependencies,
          type: type,
        );

  ReminderStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final ReminderType type;

  @override
  Override overrideWith(
    FutureOr<bool> Function(ReminderStatusRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ReminderStatusProvider._internal(
        (ref) => create(ref as ReminderStatusRef),
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
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _ReminderStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReminderStatusProvider && other.type == type;
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
mixin ReminderStatusRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `type` of this provider.
  ReminderType get type;
}

class _ReminderStatusProviderElement
    extends AutoDisposeFutureProviderElement<bool> with ReminderStatusRef {
  _ReminderStatusProviderElement(super.provider);

  @override
  ReminderType get type => (origin as ReminderStatusProvider).type;
}

String _$reminderSaveHash() => r'f3e90cd38f8859ea15e87dc4aac155096976d14c';

/// リマインダーを保存
///
/// Copied from [reminderSave].
@ProviderFor(reminderSave)
const reminderSaveProvider = ReminderSaveFamily();

/// リマインダーを保存
///
/// Copied from [reminderSave].
class ReminderSaveFamily extends Family<AsyncValue<void>> {
  /// リマインダーを保存
  ///
  /// Copied from [reminderSave].
  const ReminderSaveFamily();

  /// リマインダーを保存
  ///
  /// Copied from [reminderSave].
  ReminderSaveProvider call({
    required ReminderType type,
    required bool enable,
    required TimeOfDay time,
  }) {
    return ReminderSaveProvider(
      type: type,
      enable: enable,
      time: time,
    );
  }

  @override
  ReminderSaveProvider getProviderOverride(
    covariant ReminderSaveProvider provider,
  ) {
    return call(
      type: provider.type,
      enable: provider.enable,
      time: provider.time,
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
  String? get name => r'reminderSaveProvider';
}

/// リマインダーを保存
///
/// Copied from [reminderSave].
class ReminderSaveProvider extends AutoDisposeFutureProvider<void> {
  /// リマインダーを保存
  ///
  /// Copied from [reminderSave].
  ReminderSaveProvider({
    required ReminderType type,
    required bool enable,
    required TimeOfDay time,
  }) : this._internal(
          (ref) => reminderSave(
            ref as ReminderSaveRef,
            type: type,
            enable: enable,
            time: time,
          ),
          from: reminderSaveProvider,
          name: r'reminderSaveProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$reminderSaveHash,
          dependencies: ReminderSaveFamily._dependencies,
          allTransitiveDependencies:
              ReminderSaveFamily._allTransitiveDependencies,
          type: type,
          enable: enable,
          time: time,
        );

  ReminderSaveProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
    required this.enable,
    required this.time,
  }) : super.internal();

  final ReminderType type;
  final bool enable;
  final TimeOfDay time;

  @override
  Override overrideWith(
    FutureOr<void> Function(ReminderSaveRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ReminderSaveProvider._internal(
        (ref) => create(ref as ReminderSaveRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
        enable: enable,
        time: time,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ReminderSaveProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReminderSaveProvider &&
        other.type == type &&
        other.enable == enable &&
        other.time == time;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, enable.hashCode);
    hash = _SystemHash.combine(hash, time.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ReminderSaveRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `type` of this provider.
  ReminderType get type;

  /// The parameter `enable` of this provider.
  bool get enable;

  /// The parameter `time` of this provider.
  TimeOfDay get time;
}

class _ReminderSaveProviderElement
    extends AutoDisposeFutureProviderElement<void> with ReminderSaveRef {
  _ReminderSaveProviderElement(super.provider);

  @override
  ReminderType get type => (origin as ReminderSaveProvider).type;
  @override
  bool get enable => (origin as ReminderSaveProvider).enable;
  @override
  TimeOfDay get time => (origin as ReminderSaveProvider).time;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

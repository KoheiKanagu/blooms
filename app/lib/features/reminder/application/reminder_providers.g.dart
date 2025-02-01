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
    r'62d9d1ef220f863aeb6c85cade1624ef89fb484c';

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
String _$reminderTimeHash() => r'81a1af29f1e9a032c37be1f6da97e5040e9809e3';

/// 通知の時間を取得
///
/// Copied from [reminderTime].
@ProviderFor(reminderTime)
final reminderTimeProvider = AutoDisposeFutureProvider<TimeOfDay>.internal(
  reminderTime,
  name: r'reminderTimeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$reminderTimeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReminderTimeRef = AutoDisposeFutureProviderRef<TimeOfDay>;
String _$reminderStatusHash() => r'78225de252ad9ab749844753deb295dc50a376aa';

/// 通知の有効状態を取得
///
/// Copied from [reminderStatus].
@ProviderFor(reminderStatus)
final reminderStatusProvider = AutoDisposeFutureProvider<bool>.internal(
  reminderStatus,
  name: r'reminderStatusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reminderStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReminderStatusRef = AutoDisposeFutureProviderRef<bool>;
String _$reminderSaveHash() => r'c771bfd9b7b0ae82156d5184ddc69e63e16279a1';

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
    required bool enable,
    required TimeOfDay time,
  }) {
    return ReminderSaveProvider(
      enable: enable,
      time: time,
    );
  }

  @override
  ReminderSaveProvider getProviderOverride(
    covariant ReminderSaveProvider provider,
  ) {
    return call(
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
    required bool enable,
    required TimeOfDay time,
  }) : this._internal(
          (ref) => reminderSave(
            ref as ReminderSaveRef,
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
    required this.enable,
    required this.time,
  }) : super.internal();

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
        other.enable == enable &&
        other.time == time;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, enable.hashCode);
    hash = _SystemHash.combine(hash, time.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ReminderSaveRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `enable` of this provider.
  bool get enable;

  /// The parameter `time` of this provider.
  TimeOfDay get time;
}

class _ReminderSaveProviderElement
    extends AutoDisposeFutureProviderElement<void> with ReminderSaveRef {
  _ReminderSaveProviderElement(super.provider);

  @override
  bool get enable => (origin as ReminderSaveProvider).enable;
  @override
  TimeOfDay get time => (origin as ReminderSaveProvider).time;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

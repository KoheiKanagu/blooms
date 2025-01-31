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
String _$reminderEnableHash() => r'2e2dad5eed56ad84b73019d8900f8f95639ce9e8';

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

/// 通知を設定
///
/// Copied from [reminderEnable].
@ProviderFor(reminderEnable)
const reminderEnableProvider = ReminderEnableFamily();

/// 通知を設定
///
/// Copied from [reminderEnable].
class ReminderEnableFamily extends Family<AsyncValue<void>> {
  /// 通知を設定
  ///
  /// Copied from [reminderEnable].
  const ReminderEnableFamily();

  /// 通知を設定
  ///
  /// Copied from [reminderEnable].
  ReminderEnableProvider call({
    required TimeOfDay time,
  }) {
    return ReminderEnableProvider(
      time: time,
    );
  }

  @override
  ReminderEnableProvider getProviderOverride(
    covariant ReminderEnableProvider provider,
  ) {
    return call(
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
  String? get name => r'reminderEnableProvider';
}

/// 通知を設定
///
/// Copied from [reminderEnable].
class ReminderEnableProvider extends AutoDisposeFutureProvider<void> {
  /// 通知を設定
  ///
  /// Copied from [reminderEnable].
  ReminderEnableProvider({
    required TimeOfDay time,
  }) : this._internal(
          (ref) => reminderEnable(
            ref as ReminderEnableRef,
            time: time,
          ),
          from: reminderEnableProvider,
          name: r'reminderEnableProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$reminderEnableHash,
          dependencies: ReminderEnableFamily._dependencies,
          allTransitiveDependencies:
              ReminderEnableFamily._allTransitiveDependencies,
          time: time,
        );

  ReminderEnableProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.time,
  }) : super.internal();

  final TimeOfDay time;

  @override
  Override overrideWith(
    FutureOr<void> Function(ReminderEnableRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ReminderEnableProvider._internal(
        (ref) => create(ref as ReminderEnableRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        time: time,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ReminderEnableProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReminderEnableProvider && other.time == time;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, time.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ReminderEnableRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `time` of this provider.
  TimeOfDay get time;
}

class _ReminderEnableProviderElement
    extends AutoDisposeFutureProviderElement<void> with ReminderEnableRef {
  _ReminderEnableProviderElement(super.provider);

  @override
  TimeOfDay get time => (origin as ReminderEnableProvider).time;
}

String _$reminderDisableHash() => r'17179c014b607c63403a1dd2c20f2245bc562f5e';

/// 通知をキャンセル
///
/// Copied from [reminderDisable].
@ProviderFor(reminderDisable)
final reminderDisableProvider = AutoDisposeFutureProvider<void>.internal(
  reminderDisable,
  name: r'reminderDisableProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reminderDisableHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReminderDisableRef = AutoDisposeFutureProviderRef<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

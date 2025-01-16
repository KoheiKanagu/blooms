// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'firebase_user_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseUserHash() => r'710e1fe7cb0ec52f6295486471c98075311e1274';

/// [fb_auth.User]を取得する
///
/// 機密情報が含まれるため、[kAppEnvProd]の場合はログを抑制している
/// Providerの名称を変える場合は、[talkerRiverpodObserver] も変更すること
///
/// Copied from [firebaseUser].
@ProviderFor(firebaseUser)
final firebaseUserProvider = AutoDisposeStreamProvider<fb_auth.User?>.internal(
  firebaseUser,
  name: r'firebaseUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$firebaseUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirebaseUserRef = AutoDisposeStreamProviderRef<fb_auth.User?>;
String _$firebaseUserUidHash() => r'ea65d2d85049f0f7fbcc90abede0fbd6cffbb3e9';

/// UIDを取得する
///
/// サインインしていない場合はnullを返す
///
/// Copied from [firebaseUserUid].
@ProviderFor(firebaseUserUid)
final firebaseUserUidProvider = AutoDisposeFutureProvider<String?>.internal(
  firebaseUserUid,
  name: r'firebaseUserUidProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseUserUidHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirebaseUserUidRef = AutoDisposeFutureProviderRef<String?>;
String _$firebaseUserSignInHash() =>
    r'fb04fb8387e5886bb84db4a13fea2b1fab4ddb43';

/// サインインをした後、Userドキュメントが取得できるまで待つ
///
/// Copied from [firebaseUserSignIn].
@ProviderFor(firebaseUserSignIn)
final firebaseUserSignInProvider = AutoDisposeFutureProvider<void>.internal(
  firebaseUserSignIn,
  name: r'firebaseUserSignInProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseUserSignInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirebaseUserSignInRef = AutoDisposeFutureProviderRef<void>;
String _$firebaseUserDeleteHash() =>
    r'989ce9b84a99e60d4d938adf3296240adf1967b4';

/// See also [firebaseUserDelete].
@ProviderFor(firebaseUserDelete)
final firebaseUserDeleteProvider = AutoDisposeFutureProvider<void>.internal(
  firebaseUserDelete,
  name: r'firebaseUserDeleteProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseUserDeleteHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirebaseUserDeleteRef = AutoDisposeFutureProviderRef<void>;
String _$firebaseUserSignOutHash() =>
    r'ec399b9314497701ab2894fe231d9d19d1568cef';

/// See also [firebaseUserSignOut].
@ProviderFor(firebaseUserSignOut)
final firebaseUserSignOutProvider = AutoDisposeFutureProvider<void>.internal(
  firebaseUserSignOut,
  name: r'firebaseUserSignOutProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseUserSignOutHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirebaseUserSignOutRef = AutoDisposeFutureProviderRef<void>;
String _$firebaseUserSignOutWhenFirstRunHash() =>
    r'1d7b6a036890f10d371fb65d48d47e20a79fb5c5';

/// アプリが初回起動かチェックして、初回起動の場合はサインアウトを実行する
///
/// Firebase Authの認証情報はiCloudでバックアップされるため、
/// アプリを再インストールしたり、別の端末であっても認証情報が復元されてしまう可能性がある
///
/// Copied from [firebaseUserSignOutWhenFirstRun].
@ProviderFor(firebaseUserSignOutWhenFirstRun)
final firebaseUserSignOutWhenFirstRunProvider =
    AutoDisposeFutureProvider<void>.internal(
  firebaseUserSignOutWhenFirstRun,
  name: r'firebaseUserSignOutWhenFirstRunProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseUserSignOutWhenFirstRunHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirebaseUserSignOutWhenFirstRunRef = AutoDisposeFutureProviderRef<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

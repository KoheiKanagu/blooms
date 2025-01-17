// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authSignInHash() => r'16fc684fd1130f3926f75f932f00e5fa291dc7d4';

/// サインインをした後、Userドキュメントが取得できるまで待つ
///
/// Copied from [authSignIn].
@ProviderFor(authSignIn)
final authSignInProvider = AutoDisposeFutureProvider<void>.internal(
  authSignIn,
  name: r'authSignInProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authSignInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthSignInRef = AutoDisposeFutureProviderRef<void>;
String _$authSignOutHash() => r'4f59d19efb594a20ff4ab8db8f06b38721f07d38';

/// See also [authSignOut].
@ProviderFor(authSignOut)
final authSignOutProvider = AutoDisposeFutureProvider<void>.internal(
  authSignOut,
  name: r'authSignOutProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authSignOutHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthSignOutRef = AutoDisposeFutureProviderRef<void>;
String _$authSignOutWhenFirstRunHash() =>
    r'48318489a0d9a739e50839657a124040b5edbbfc';

/// アプリが初回起動かチェックして、初回起動の場合はサインアウトを実行する
///
/// Firebase Authの認証情報はiCloudでバックアップされるため、
/// アプリを再インストールしたり、別の端末であっても認証情報が復元されてしまう可能性がある
///
/// Copied from [authSignOutWhenFirstRun].
@ProviderFor(authSignOutWhenFirstRun)
final authSignOutWhenFirstRunProvider =
    AutoDisposeFutureProvider<void>.internal(
  authSignOutWhenFirstRun,
  name: r'authSignOutWhenFirstRunProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authSignOutWhenFirstRunHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthSignOutWhenFirstRunRef = AutoDisposeFutureProviderRef<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

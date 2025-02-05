import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package_info_providers.g.dart';

@Riverpod(keepAlive: true)
Future<PackageInfo> packageInfo(Ref ref) => PackageInfo.fromPlatform();

@riverpod
int packageInfoBuildNumber(Ref ref) =>
    int.tryParse(ref.watch(packageInfoProvider).requireValue.buildNumber) ?? 0;

@riverpod
String packageInfoVersion(Ref ref) =>
    ref.watch(packageInfoProvider).requireValue.version;

@riverpod
String packageInfoAppName(Ref ref) =>
    ref.watch(packageInfoProvider).requireValue.appName;

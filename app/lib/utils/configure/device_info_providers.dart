import 'package:device_info_plus/device_info_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_info_providers.g.dart';

@Riverpod(keepAlive: true)
Future<BaseDeviceInfo> deviceInfo(Ref ref) => DeviceInfoPlugin().deviceInfo;

@riverpod
String deviceInfoSystemName(Ref ref) {
  return switch (ref.watch(deviceInfoProvider).requireValue) {
    IosDeviceInfo(:final systemName) => systemName,
    MacOsDeviceInfo(:final osRelease) => osRelease,
    WebBrowserInfo(:final browserName) => browserName.name,
    _ => 'unknown',
  };
}

@riverpod
String deviceInfoSystemVersion(Ref ref) {
  return switch (ref.watch(deviceInfoProvider).requireValue) {
    IosDeviceInfo(:final systemVersion) => systemVersion,
    MacOsDeviceInfo(
      :final majorVersion,
      :final minorVersion,
      :final patchVersion,
    ) =>
      '$majorVersion.$minorVersion.$patchVersion',
    _ => '',
  };
}

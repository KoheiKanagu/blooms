import 'package:blooms/features/authentication/application/firebase_user_providers.dart';
import 'package:blooms/utils/configure/device_info_providers.dart';
import 'package:blooms/utils/configure/package_info_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'about_provider.g.dart';

@riverpod
Future<Uri> inquiryUri(Ref ref) async {
  final uid = await ref.read(firebaseUserUidProvider.future);
  final version = ref.read(packageInfoVersionProvider);

  final systemName = ref.read(deviceInfoSystemNameProvider);
  final systemVersion = ref.read(deviceInfoSystemVersionProvider);

  final systemInfo = '''
uid: $uid
app name: BLOOMS
app version: $version
system name: $systemName,
system version: $systemVersion,
''';

  return Uri(
    scheme: 'https',
    host: 'docs.google.com',
    path:
        'forms/d/e/1FAIpQLSesrBpQGaPl1siIwauy9fwlVUlFvDdpGrf9yVjqcGFYMcvdHQ/viewform',
    queryParameters: {
      'usp': 'pp_url',
      'entry.637067867': systemInfo,
    },
  );
}

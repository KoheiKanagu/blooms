import 'package:blooms/constants/app_env.dart';
import 'package:blooms/constants/firebase_options_prod.dart' as prod_firebase;
import 'package:blooms/constants/firebase_options_stg.dart' as stg_firebase;
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/routing/application/my_go_router.dart';
import 'package:blooms/theme/my_theme.dart';
import 'package:blooms/utils/my_logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final (locale, _) = (
    await LocaleSettings.useDeviceLocale(),
    await Firebase.initializeApp(
      options: switch (appEnv) {
        AppEnv.stg => stg_firebase.DefaultFirebaseOptions.currentPlatform,
        AppEnv.prod => prod_firebase.DefaultFirebaseOptions.currentPlatform,
      },
    ),
  );
  Intl.defaultLocale = locale.languageCode;

  runApp(
    ProviderScope(
      observers: [
        talkerRiverpodObserver,
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(myGoRouterProvider);

    return MaterialApp.router(
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      routerConfig: router,
      theme: myLightThemeData,
    );
  }
}

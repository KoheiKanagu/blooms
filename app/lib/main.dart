import 'package:blooms/constants/app_env.dart';
import 'package:blooms/constants/firebase_options_prod.dart' as prod_firebase;
import 'package:blooms/constants/firebase_options_stg.dart' as stg_firebase;
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/routing/application/my_go_router.dart';
import 'package:blooms/theme/my_theme.dart';
import 'package:blooms/utils/budoux.dart';
import 'package:blooms/utils/my_logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();

  await initBudouX();

  final (locale, _, locationName) = (
    await LocaleSettings.useDeviceLocale(),
    await Firebase.initializeApp(
      options: switch (appEnv) {
        AppEnv.stg => stg_firebase.DefaultFirebaseOptions.currentPlatform,
        AppEnv.prod => prod_firebase.DefaultFirebaseOptions.currentPlatform,
      },
    ),
    await FlutterTimezone.getLocalTimezone(),
  );
  Intl.defaultLocale = locale.languageCode;
  tz.setLocalLocation(tz.getLocation(locationName));

  runApp(
    ProviderScope(observers: [talkerRiverpodObserver], child: const MyApp()),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(myGoRouterProvider);

    return wrapFixedWidth(
      context: context,
      child: CupertinoApp.router(
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        routerConfig: router,
        theme: MediaQuery.of(context).platformBrightness == Brightness.light
            ? myLightThemeData
            : myDarkThemeData,
      ),
    );
  }

  /// Webだけ固定幅にする
  Widget wrapFixedWidth({
    required Widget child,
    required BuildContext context,
  }) {
    if (!kIsWeb) {
      return child;
    }

    final width = MediaQuery.of(context).size.width;
    return FractionallySizedBox(
      widthFactor: width < 500 ? 1.0 : 500 / width,
      child: child,
    );
  }
}

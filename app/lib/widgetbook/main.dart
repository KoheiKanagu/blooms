import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/theme/my_theme.dart';
import 'package:blooms/utils/budoux.dart';
import 'package:blooms/widgetbook/main.directories.g.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Intl.defaultLocale = AppLocale.ja.languageCode;
  await initBudouX();

  runApp(
    const ProviderScope(
      child: WidgetbookApp(),
    ),
  );
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Widgetbook.cupertino(
      directories: directories,
      addons: [
        CupertinoThemeAddon(
          themes: [
            const WidgetbookTheme(
              name: 'Light',
              data: myLightThemeData,
            ),
            const WidgetbookTheme(
              name: 'Dark',
              data: myDarkThemeData,
            ),
          ],
        ),
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPad,
            Devices.ios.iPhoneSE,
            Devices.ios.iPhone13ProMax,
          ],
        ),
        TextScaleAddon(),
        LocalizationAddon(
          locales: AppLocaleUtils.supportedLocales,
          initialLocale: AppLocale.ja.flutterLocale,
          localizationsDelegates: [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
        ),
      ],
    );
  }
}

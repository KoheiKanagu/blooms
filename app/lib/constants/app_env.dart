/// [appFlavor constant \- services library \- Dart API](https://api.flutter.dev/flutter/services/appFlavor-constant.html)
const _appFlavor = String.fromEnvironment('FLUTTER_APP_FLAVOR');

final appEnv = switch (_appFlavor) {
  'stg' => AppEnv.stg,
  'prod' => AppEnv.prod,
  _ => throw Exception('Invalid AppEnv: $_appFlavor'),
};

final kAppEnvStg = appEnv == AppEnv.stg;
final kAppEnvProd = appEnv == AppEnv.prod;

final kReCaptchaV3SiteKey = switch (appEnv) {
  AppEnv.stg => '6LeLdLIqAAAAAMocNQ2gFaKivHKyulD_rpBCFVJt',
  AppEnv.prod => '6Ld9ZrIqAAAAANziKJDpmNHbbDOKbd6h1N2E6Fee',
};

enum AppEnv {
  stg,
  prod, //
}

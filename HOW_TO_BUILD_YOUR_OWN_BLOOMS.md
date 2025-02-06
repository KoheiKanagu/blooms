# 独自の BLOOMS

## 独自の BLOOMS を構築するには

リポジトリを clone しただけでは BLOOMS は以下の理由から実行できません。
（@KoheiKanagu が構築している環境の事を以下 **"オリジナルの BLOOMS"** と呼称します）

- [Firebase App Check](https://firebase.google.com/docs/app-check?hl=ja)を有効にしているため、オリジナルの BLOOMS の Firebase プロジェクトにはアクセスできません
- iOS 版の場合は、所定のプロビジョニングファイルと証明書が必要です

そのため、実行するためには以下の手順に従って独自の BLOOMS を構築する必要があります。

### 必要なツール

任意の方法でインストールしてください。

- [fvm](https://fvm.app/)
- [flutterfire_cli](https://github.com/invertase/flutterfire_cli)
- [Firebase CLI](https://firebase.google.com/docs/cli?hl=ja)
- [CocoaPods\.org](https://cocoapods.org/) (iOS 版をビルドする場合のみ)
- [Node.js v20](https://nodejs.org/)
- [Google Chrome](https://www.google.com/intl/ja_jp/chrome/) (Web 版をビルドする場合のみ)

### 必要なライセンス（iOS 版をビルドしない場合は対応不要）

iOS 版をビルドする場合は、[Apple Developer Program](https://developer.apple.com/jp/programs/) に登録済みであり、プロビジョニングプロファイルを作成できる権限を持つ Apple Account が必要です。

### 必要なマシン

iOS 版をビルドする場合は、macOS が必要です。
原則として最新の macOS と Xcode が推奨されます。

Web 版のみをビルドする場合は、前述の必要なツールが動作する環境であれば問題ないと思われます。

### Firebase プロジェクトの作成

ステージング環境と本番環境用の 2 つの Firebase プロジェクトを作成してください。
動作検証するだけであれば、ステージング環境用のプロジェクトのみで問題ありませんが、後述する各種スクリプトはステージング環境と本番環境の両方が存在していることが前提となっているため、2 つのプロジェクトを作成することを推奨します。

Cloud Functions など利用するため、[Blaze プラン](https://firebase.google.com/pricing?hl=ja)にアップグレードする必要があります。

### Firestore データベースを作成

手順に従って Firestore データベースを作成してください。

[Cloud Firestore を使ってみる \| Firebase](https://firebase.google.com/docs/firestore/quickstart?hl=ja#create)

- ロケーションは任意のものを選択してください
- Cloud Firestore Security Rules の開始モードはどちらでも構いません

### デフォルトの Cloud Storage バケットを作成

手順に従ってデフォルトの Cloud Storage バケットを作成してください。

[Flutter で Cloud Storage を使ってみる \| Cloud Storage for Firebase](https://firebase.google.com/docs/storage/flutter/start?hl=ja#create-default-bucket)

- ロケーションは任意のものを選択してください
- アクセス頻度は**標準**を選択してください
- Firebase Security Rules はそのままで問題ありません

### Firebase プロジェクトにアプリを登録する

以下のスクリプトを実行すると、Firebase プロジェクトにアプリが登録されます。

実行する前に、`./scripts/flutterfire_configure.sh`を開いて、`BUNDLE_ID`、`PROJECT_NAME_STG`、`PROJECT_NAME_PROD`を変更してください

```sh
cd app
# --account には対象のFirebaseプロジェクトにアクセスできるGoogleアカウントを指定してください
./scripts/flutterfire_configure.sh --account kohei.kanagu@gmail.com
```

### Firebase App Check を有効にする

任意ですが、有効にすることを推奨します。手順に従い、iOS 版を構築する場合は App Attest、Web 版を構築する場合は reCAPTCHA Enterprise を有効にしてください。

[Flutter アプリで App Check を使ってみる \| Firebase ドキュメント](https://firebase.google.com/docs/app-check/flutter/default-providers?hl=ja#project-setup)

reCAPTCHA Enterprise を有効にする場合は、サイトキーを[app/lib/constants/app_env.dart](app/lib/constants/app_env.dart)の`kReCaptchaV3SiteKey`変数に設定してください。

### Xcode（iOS 版をビルドしない場合は対応不要）

`app/ios/Runner.xcworkspace` を Xcode で開き、以下の項目を変更してください。

- Team
- Bundle Identifier
- Keychain Groups

Keychain Groups に設定した値を[app/lib/constants/app_env.dart](app/lib/constants/app_env.dart)の`kKeychainGroup`変数に設定してください。

以下のスクリプトが成功することを確認してください。

```sh
./scripts/build-ios-config-only.sh --flavor stg
```

### .firebaserc の`projects`の修正

[firebase/.firebaserc](firebase/.firebaserc)の`projects`の項目には、Firebase プロジェクトのエイリアスを設定しています。
オリジナルの BLOOMS のプロジェクト名が含まれているため、修正する必要があります。

`projects.stg`にステージング環境用の Firebase プロジェクト名を、`projects.prod`に本番環境用の Firebase プロジェクト名を設定してください。
`projects.default`は任意ですが、ステージング環境用の Firebase プロジェクト名を設定することを推奨します。

### .firebaserc の`targets`の修正（Web 版を Firebase Hosting にデプロイしないのであれば対応不要）

[firebase/.firebaserc](firebase/.firebaserc)の`targets`の項目には、Firebase Hosting のサイトとサイト ID の紐付けが設定されています。

オリジナルの BLOOMS では以下の 3 つのサイトが設定されています。

- `public`: [firebase/hosting/public](firebase/hosting/public)の内容のサイト
- `app`: Flutter で構築された Web アプリケーション版の BLOOMS のサイト
- `widgetbook`: Flutter で構築された Web アプリケーション版の BLOOMS の[Widgetbook](https://www.widgetbook.io/)のサイト

`public`と`widgetbook`は任意です。必要なサイトだけを残し、不要なサイトは削除してください。

サイトの追加方法は公式ドキュメントを参照してください。
[複数のサイトでプロジェクトのリソースを共有する \| Firebase Hosting](https://firebase.google.com/docs/hosting/multisites?hl=ja#add_additional_sites)

## 独自の BLOOMS を実行する

事前に`fvm`を利用して Flutter をインストールしてください。

```sh
cd app
fvm install

# doctorで問題がないことを確認してください
fvm flutter doctor
```

### Firebase のリソースをデプロイ

Firestore、Cloud Functions、Cloud Storage などの Firebase リソースをデプロイしてください。

```sh
cd firebase

# デプロイしたい環境 stg または prod を指定してください
firebase use stg

# Firebase Hosting以外のリソースをデプロイします
firebase deploy --except hosting
```

### Web 版の実行

以下のコマンドを実行して、`chrome`が表示されていることを確認してください。

```sh
fvm flutter devices
```

```sh
Found 4 connected devices:
  iPhone 16 Plus (mobile)         • D3E7EADC-FBE3-4889-BE88-019D4D20F0C0 • ios            • com.apple.CoreSimulator.SimRuntime.iOS-18-1 (simulator)
  macOS (desktop)                 • macos                                • darwin-arm64   • macOS 15.2 24C101 darwin-arm64
  Mac Designed for iPad (desktop) • mac-designed-for-ipad                • darwin         • macOS 15.2 24C101 darwin-arm64
  Chrome (web)                    • chrome                               • web-javascript • Google Chrome 132.0.6834.162
```

もし表示されていない場合は、以下のコマンドを実行して問題を解決してください。

```sh
fvm flutter doctor
```

以下のコマンドを実行すると、Web 版の BLOOMS が起動できます。

```sh
fvm flutter run --flavor stg --device-id chrome
```

App Check を有効にしている場合は、以下のドキュメントを参考にしてデバッグトークンを登録する必要があります。
[Flutter で App Check とデバッグ プロバイダを使用する \| Firebase App Check](https://firebase.google.com/docs/app-check/flutter/debug-provider?hl=ja#web)

### iOS 版の実行

Simulator を起動して任意の iPhone で iOS 18 のランタイムを起動してください。
Simulator の環境構築は以下のドキュメントを参考にしてください。
[Installing and managing Simulator runtimes \| Apple Developer Documentation](https://developer.apple.com/documentation/xcode/installing-additional-simulator-runtimes)

以下のコマンドを実行して、iOS 18 の iPhone Simulator が表示されていることを確認してください。

```sh
fvm flutter devices
```

```sh
Found 4 connected devices:
  iPhone 16 Plus (mobile)         • D3E7EADC-FBE3-4889-BE88-019D4D20F0C0 • ios            • com.apple.CoreSimulator.SimRuntime.iOS-18-1 (simulator)
  macOS (desktop)                 • macos                                • darwin-arm64   • macOS 15.2 24C101 darwin-arm64
  Mac Designed for iPad (desktop) • mac-designed-for-ipad                • darwin         • macOS 15.2 24C101 darwin-arm64
  Chrome (web)                    • chrome                               • web-javascript • Google Chrome 132.0.6834.162
```

もし表示されていない場合は、以下のコマンドを実行して問題を解決してください。

```sh
fvm flutter doctor
```

以下のコマンドを実行すると、iOS 版の BLOOMS が起動できます。

```sh
# 複数のiPhoneが接続されている場合は、--device-idはUDIDを指定してください
fvm flutter run --flavor stg --device-id iphone
```

## 独自の BLOOMS をデプロイする

### Firebase のリソースをデプロイ

以下のコマンドを実行すると、Firebase のリソースがデプロイされます。

```sh
cd firebase

# デプロイしたい環境 stg または prod を指定してください
firebase use stg

# Firebase Hosting以外のリソースをデプロイします
firebase deploy --except hosting
```

### Web 版の BLOOMS をデプロイ

以下のスクリプトを実行すると、Web 版の BLOOMS がビルドされます。
成果物は[firebase/hosting/app](firebase/hosting/app)に出力されます。

```sh
cd app

# flavorはデプロイしたい環境 stg または prod を指定してください
./scripts/flutter_build_web_app.sh --flavor stg
```

ビルドが成功したら、以下のスクリプトを実行して Firebase Hosting にデプロイしてください。

```sh
cd firebase
./scripts/deploy_only_hosting_app.sh
```

デプロイが成功すると、Firebase Hosting の URL が表示されるため、アクセスして動作を確認してください。

#### `public`をデプロイする

以下のようにスクリプトを実行すると、`public`のサイトが Firebase Hosting にデプロイされます。

```sh
cd firebase
./scripts/deploy_only_hosting_public.sh
```

#### `widgetbook`をデプロイする

以下のようにスクリプトを実行すると、Widgetbook がビルドされます。
成果物は[firebase/hosting/widgetbook](firebase/hosting/widgetbook)に出力されます。

```sh
cd app
./scripts/flutter_build_web_widgetbook.sh --flavor stg
```

以下のスクリプトを実行すると、`widgetbook`のサイトが Firebase Hosting にデプロイされます。

```sh
cd firebase
./scripts/deploy_only_hosting_widgetbook.sh
```

### iOS 版の BLOOMS をデプロイ

[Xcode Cloud](https://developer.apple.com/jp/xcode-cloud/)の利用を強く推奨します。

[app/ios/ci_scripts/ci_post_clone.sh](app/ios/ci_scripts/ci_post_clone.sh)を用意しているため、Xcode Cloud ワークフローを設定するだけでビルドが可能です。

#### 手動でビルドする場合

ます、以下のスクリプトを実行してください。

```sh
cd app

# flavorはデプロイしたい環境 stg または prod を指定してください
./scripts/build-ios-config-only.sh --flavor stg
```

`app/ios/Runner.xcworkspace` を Xcode で開いてください。

先ほど指定した`--flavor`に対応するスキームを選択し、Archive を実行してください。
成功すると Organizer が開きますので、App Store Connect にアップロードすることができます。

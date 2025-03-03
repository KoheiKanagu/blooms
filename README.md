[![Firebase Deploy](https://github.com/KoheiKanagu/blooms/actions/workflows/firebase_deploy.yml/badge.svg)](https://github.com/KoheiKanagu/blooms/actions/workflows/firebase_deploy.yml)
![CodeRabbit Pull Request Reviews](https://img.shields.io/coderabbit/prs/github/KoheiKanagu/blooms)

# Body Log Observation and Outlook for Maternal State (BLOOMS)

<img src="app/ios/Runner/Assets.xcassets/AppIcon.appiconset/icon.png" width="256" height="256" alt="BLOOMS App Icon" />

このリポジトリは、[【Zenn 初開催】AI エージェント開発に挑戦！初心者歓迎ハッカソン](https://zenn.dev/hackathons/2024-google-cloud-japan-ai-hackathon)に向けて開発した、AI エージェントを活用した妊婦の体調の記録と分析を行うアプリケーションです。

## 紹介記事

- [BLOOMS \- 見つめてみよう。妊婦のあなたの日々の体調](https://zenn.dev/kingu/articles/a36196c5c66171)

### 関連記事

- [Flutter と Firebase を使ってアプリを作る上でのテクニックあれこれ](https://zenn.dev/kingu/articles/f122c06a9cc360)

## ダウンロード

### iOS 版

<a href="https://apps.apple.com/jp/app/blooms/id6740260241?itscg=30200&itsct=apps_box_badge&mttnsubad=6740260241" style="display: inline-block;">
<img src="https://toolbox.marketingtools.apple.com/api/v2/badges/download-on-the-app-store/black/ja-jp?releaseDate=1738886400" alt="App Storeでダウンロード" style="width: 224px; height: 82px; vertical-align: middle; object-fit: contain;" />
</a>

<img src="assets/qr-code.webp" width="256" height="256" alt="QR Code" />

### Web 版

<https://app.blooms.kingu.dev>

## for Developers

### 環境

ステージング環境(`stg`)と本番環境(`prod`)の 2 種類の環境があります。
環境のことを`flavor`と呼称しています。

### 開発環境

最新の[Visual Studio Code](https://code.visualstudio.com/)を強く推奨します。
[blooms.code-workspace](blooms.code-workspace) より、ワークスペースを開いてください。

### 独自の BLOOMS

独自の BLOOMS を開発する場合は、[HOW_TO_BUILD_YOUR_OWN_BLOOMS.md](HOW_TO_BUILD_YOUR_OWN_BLOOMS.md)を参照してください。

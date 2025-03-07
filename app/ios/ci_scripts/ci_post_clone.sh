#!/bin/sh

# Fail this script if any subcommand fails.
set -e

# The default execution directory of this script is the ci_scripts directory.
cd "$CI_PRIMARY_REPOSITORY_PATH" # change working directory to the root of your cloned repo.
cd app                           # change working directory to the app directory.

# Extract the Flutter version from .fvmrc file
FLUTTER_VERSION=$(cat .fvmrc | grep "flutter" | cut -d '"' -f 4)

# エラーになるのでcurlで対応: https://github.com/flutter/flutter/issues/163198
# # Install Flutter using git.
# git clone https://github.com/flutter/flutter.git --depth 1 -b "$FLUTTER_VERSION" "$HOME"/flutter

# Install Flutter using curl.
ARCHIVE_NAME="flutter_macos_$FLUTTER_VERSION-beta.zip"
curl -sLO "https://storage.googleapis.com/flutter_infra_release/releases/beta/macos/$ARCHIVE_NAME"
unzip -qq "$ARCHIVE_NAME" -d "$HOME"

export PATH="$PATH:$HOME/flutter/bin"

# Print the Flutter version
flutter --version

# Install Flutter artifacts for iOS (--ios), or macOS (--macos) platforms.
flutter precache --ios

# Install Flutter dependencies.
flutter pub get

# Run Flutter Bootstrap script.
"$CI_PRIMARY_REPOSITORY_PATH"/.github/workflows/flutter_bootstrap.sh

# Install CocoaPods using Homebrew.
HOMEBREW_NO_AUTO_UPDATE=1 # disable homebrew's automatic updates.
brew install cocoapods

# Install CocoaPods dependencies.
cd ios && pod install # run `pod install` in the `ios` directory.

# Build with config-only to update Generated.xcconfig
flutter build ios --config-only --flavor prod

exit 0

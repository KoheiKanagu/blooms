#!/bin/bash
set -euxo pipefail

USE_FVM=${USE_FVM:-true}

if [ "$USE_FVM" = true ]; then
  flutter() {
    fvm flutter "$@"
  }
  dart() {
    fvm dart "$@"
  }
fi

while [[ "$#" -gt 0 ]]; do
  case $1 in
  --flavor)
    flavor="$2"
    shift
    ;;
  *)
    echo "Unknown parameter passed: $1"
    exit 1
    ;;
  esac
  shift
done

rm -rf ../firebase/widgetbook

flutter build web \
  --target lib/widgetbook/main.dart \
  --wasm \
  --dart-define FLUTTER_APP_FLAVOR="$flavor" \
  --output ../firebase/hosting/widgetbook/

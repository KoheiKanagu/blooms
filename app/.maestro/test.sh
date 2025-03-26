#!/bin/bash
set -euxo pipefail

APP_PATH="build/ios/iphonesimulator/Runner.app"
rm -rf "$APP_PATH"

fvm flutter build ios --debug --simulator --flavor stg

DEVICE_UDID=$(xcrun simctl list devices booted --json | jq -r '.devices[][0].udid')
xcrun simctl install "$DEVICE_UDID" "$APP_PATH"

maestro test .maestro/test.yml

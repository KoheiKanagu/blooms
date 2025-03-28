#!/bin/bash
set -euxo pipefail

export SIMCTL_CHILD_FIRAAppCheckDebugToken="$APP_CHECK_DEBUG_TOKEN"

TEST_DEVICE_NAME="E2E Test"

# Build the app
APP_PATH="build/ios/iphonesimulator/Runner.app"
rm -rf "$APP_PATH"
fvm flutter build ios --debug --simulator --flavor stg

# Set Environment Variables
DEVICE_UDID=$(xcrun simctl list devices --json | jq -r ".devices[][] | select(.name == \"$TEST_DEVICE_NAME\") | .udid")
xcrun simctl shutdown "$DEVICE_UDID" || true
xcrun simctl boot "$DEVICE_UDID"

# Install the app
xcrun simctl install "$DEVICE_UDID" "$APP_PATH"

# Run Maestro tests
maestro test .maestro/test.yml

# Shutdown the Test Device
xcrun simctl shutdown "$DEVICE_UDID" || true

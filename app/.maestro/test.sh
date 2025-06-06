#!/bin/bash
set -euxo pipefail

# You need to set "APP_CHECK_DEBUG_TOKEN" in the environment variables (e.g., GitHub Actions secrets or local .env file) of the machine where you run the test in advance.
# Example: export APP_CHECK_DEBUG_TOKEN="your_debug_token"
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

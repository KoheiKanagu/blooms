#!/bin/bash
set -euxo pipefail

while [[ "$#" -gt 0 ]]; do
  case $1 in
  --account)
    account="$2"
    shift
    ;;
  *)
    echo "Unknown parameter passed: $1"
    exit 1
    ;;
  esac
  shift
done

# iOSのBundle Identifier
# 独自のBLOOMSを構築する場合は変更する必要があります
BUNDLE_ID="dev.kingu.BLOOMS"

# Firebaseプロジェクト名
# 独自のBLOOMSを構築する場合は変更する必要があります
PROJECT_NAME_STG="blooms-stg"

# Firebaseプロジェクト名
# 独自のBLOOMSを構築する場合は変更する必要があります
PROJECT_NAME_PROD="blooms-prod-43d74"

for buildConfig in Debug-stg Release-stg Profile-stg; do
  flutterfire configure \
    --project "$PROJECT_NAME_STG" \
    --account "$account" \
    --out "lib/constants/firebase_options_stg.dart" \
    --ios-bundle-id $BUNDLE_ID.stg \
    --ios-build-config $buildConfig \
    --ios-out "ios/stg/GoogleService-Info.plist" \
    --yes
done

for buildConfig in Debug-prod Release-prod Profile-prod; do
  flutterfire configure \
    --project "$PROJECT_NAME_PROD" \
    --account "$account" \
    --out "lib/constants/firebase_options_prod.dart" \
    --ios-bundle-id $BUNDLE_ID \
    --ios-build-config $buildConfig \
    --ios-out "ios/prod/GoogleService-Info.plist" \
    --yes
done

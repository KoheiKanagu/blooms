#!/bin/bash
set -euo pipefail

firebase ext:export --force

for file in extensions/*.env; do
  {
    echo ""
    echo "firebaseextensions.v1beta.function/location=asia-northeast1"
    echo "firebaseextensions.v1beta.v2function/location=asia-northeast1"
    echo "LOCATION=asia-northeast1"
  } >>"$file"
done

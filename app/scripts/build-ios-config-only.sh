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

pod repo update

flutter build ios \
  --config-only \
  --flavor "$flavor"

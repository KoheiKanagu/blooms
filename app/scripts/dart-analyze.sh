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

# exit_status will be non-zero if any command fails
exit_status=0

dart analyze --fatal-infos . || exit_status=$?
dart run custom_lint || exit_status=$?

if [ $exit_status -ne 0 ]; then
  echo "One or more commands failed"
  exit $exit_status
fi

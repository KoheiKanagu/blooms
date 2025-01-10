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

# shellcheck disable=SC2046
dart format --set-exit-if-changed $(find lib test -name '*.dart' -not -name '*.gen.dart' -and -not -name '*.freezed.dart' -and -not -name '*.g.dart' -and -not -path 'lib/gen/*')

git diff --exit-code || exit_status=$?

if [ $exit_status -ne 0 ]; then
  echo "One or more commands failed"
  exit $exit_status
fi

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

# shellcheck disable=SC2046
dart format --set-exit-if-changed $(find lib test -name '*.dart' -not -name '*.gen.dart' -and -not -name '*.freezed.dart' -and -not -name '*.g.dart' -and -not -path 'lib/gen/*')

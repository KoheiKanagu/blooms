#!/bin/bash
set -euxo pipefail

npm --prefix functions run clean
npm --prefix functions run build:watch >/dev/null 2>&1 &

firebase emulators:start \
    --only functions,firestore,storage \
    --inspect-functions

trap "kill 0" SIGINT

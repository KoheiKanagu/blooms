#!/bin/bash
set -euxo pipefail

npm --prefix functions run clean
npm --prefix functions run build

firebase emulators:exec \
    --only functions,firestore,storage \
    "npm --prefix functions run test"

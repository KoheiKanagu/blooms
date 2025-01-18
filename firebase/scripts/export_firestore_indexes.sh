#!/bin/bash
set -euxo pipefail

firebase firestore:indexes >firestore/firestore.indexes.json

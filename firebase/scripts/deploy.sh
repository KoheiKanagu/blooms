#!/bin/bash
set -euxo pipefail

firebase deploy --force --except extensions,hosting

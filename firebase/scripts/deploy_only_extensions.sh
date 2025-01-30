#!/bin/bash
set -euxo pipefail

firebase deploy --force --only extensions

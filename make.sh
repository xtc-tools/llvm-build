#!/usr/bin/env bash
set -euo pipefail

dir="$(dirname "$0")"

"$dir"/cmake.sh
"$dir"/ninja.sh install


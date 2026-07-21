#!/usr/bin/env bash
set -euo pipefail

dir="$(dirname "$0")"

"$dir"/run.sh bash -c "ninja -C build $*"

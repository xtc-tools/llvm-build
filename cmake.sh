#!/usr/bin/env bash
set -euo pipefail

dir="$(dirname "$0")"

"$dir"/run.sh bash -c "mkdir -p build && /dockerfiles/cmake.sh -G Ninja -B build llvm -DCMAKE_INSTALL_PREFIX=install $*"

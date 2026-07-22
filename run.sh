#!/usr/bin/env bash
set -euo pipefail

HOST_BUILD="$PWD/llvm-project"
DOCKER_BUILD=/home/guest/llvm-project 
image=ghcr.io/xtc-tools/llvm-ccache:0.2.0

[ -d "$HOST_BUILD" ] || { echo "ERROR: llvm project must be clonned into ./llvm-project before running" >&2; exit 1; }

docker=docker
"$docker" ps >/dev/null 2>&1 || docker="sudo $docker"

set -x
exec $docker run --rm -it -v"$HOST_BUILD:$DOCKER_BUILD" -v"/ccache" -w"$DOCKER_BUILD" --env DOCKER_UID=$(id -u) --env DOCKER_GID=$(id -g) "$image" "$@"

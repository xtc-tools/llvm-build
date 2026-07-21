#!/usr/bin/env bash
set -euo pipefail

HOST_BUILD="$PWD/llvm-project"
DOCKER_BUILD=/home/guest/llvm-project 

[ -d "$HOST_BUILD" ] || { echo "ERROR: llvm project must be clonned into ./llvm-project before running" >&2; exit 1; }
set -x
exec sudo docker run --rm -it -v"$HOST_BUILD:$DOCKER_BUILD" -v"/ccache" -w"$DOCKER_BUILD" --env DOCKER_UID=$(id -u) --env DOCKER_GID=$(id -g) llvm-ccache "$@"

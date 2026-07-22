#!/usr/bin/env bash

dir="$(dirname "$0")"

cd "$dir"
image=ghcr.io/xtc-tools/llvm-ccache:0.2.0
exec sudo docker build --progress=plain -t "$image" docker/

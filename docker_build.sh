#!/usr/bin/env bash

dir="$(dirname "$0")"

cd "$dir"
exec docker build --progress=plain -t llvm docker/

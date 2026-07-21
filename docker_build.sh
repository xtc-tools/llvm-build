#!/usr/bin/env bash

dir="$(dirname "$0")"

cd "$dir"
exec sudo docker build --progress=plain -t llvm docker/

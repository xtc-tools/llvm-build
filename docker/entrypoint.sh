#!/usr/bin/env bash

echo "Executing $0 $*"
echo "Env:"
env

set -x
uid="${DOCKER_UID:-1000}"
gid="${DOCKER_GID:-1000}"

[ $# -gt 0 ] || set -- bash
exec gosu "$uid:$gid" "$@"


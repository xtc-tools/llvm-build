#!/usr/bin/env bash

echo "Executing $0 $*"

uid="${DOCKER_UID:-1000}"
gid="${DOCKER_GID:-1000}"

chown -R "$uid:$gid" "$CCACHE_DIR"

[ $# -gt 0 ] || set -- bash

set -x
exec gosu "$uid:$gid" env USER=guest HOME=/home/guest "$@"


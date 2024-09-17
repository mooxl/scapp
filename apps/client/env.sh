#!/bin/bash
set -e
./import-meta-env-alpine -x .import-meta-env || exit 1
exec "$@"
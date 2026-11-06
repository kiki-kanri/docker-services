#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "${SCRIPT_DIR}/../.."

echo 'Warning: Run GC only while the registry is read-only and no image pushes are running.' >&2
docker compose exec -T registry registry garbage-collect "$@" /etc/docker/registry/config.yml || true

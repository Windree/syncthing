#!/usr/bin/env bash
source "$(dirname "${BASH_SOURCE[0]}")/.env"
set -Eeuo pipefail

function main() {
    local directory="$(readlink -f "$(dirname "${BASH_SOURCE[0]}")")"
    echo -n "$(date): "
    if docker compose exec app /bin/sh -c "[ -e \"$SYNCTHING_WATCHDOG_FOLDER\" ]" 2>&1 >/dev/null; then
        echo "OK"
    else
        echo "ERROR"
        docker compose -f "$directory/docker-compose.yml" restart
    fi
}

main

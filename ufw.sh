#!/usr/bin/env bash
source "$(dirname "${BASH_SOURCE[0]}")/.env"
set -Eeuo pipefail
for remote in "10.0.0.0/8" "172.16.0.0/12" "192.168.0.0/16" "fe80::/64"; do
    ufw allow from "$remote" to any port "$SYNCTHING_WEB_PORT" proto tcp
done

ufw allow proto tcp to any port $SYNCTHING_DATA_PORT
ufw allow proto udp to any port $SYNCTHING_BROADCAST_PORT

ufw reload

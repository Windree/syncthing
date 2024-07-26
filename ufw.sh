#!/usr/bin/env sh
set -euo pipefail

for network in 10.0.0.0/8 172.16.0.0/12 192.168.0.0/16 fe80::/64; do
    ufw allow proto tcp to "$network" port 8384
done

ufw allow proto tcp to any port 22000
ufw allow proto udp to any port 22000
ufw allow proto udp to any port 21027

ufw reload

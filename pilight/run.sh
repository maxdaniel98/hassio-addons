#!/usr/bin/env bash

# Extract config data
CONFIG_PATH=/data/options.json
DEVICE=$(jq -r '.device // empty' "$CONFIG_PATH")
DEVICE=${GPIO_PLATFORM:-none} # default to none

# Update pilight config
sed -i 's/\("comport"\): \?".*"\(.*\)/\1: "'"$DEVICE"'"\2/' /etc/pilight/config.json
#cat CONFIG_PATH > /etc/pilight/config.json

# Run pilight in foreground
exec pilight-daemon -D

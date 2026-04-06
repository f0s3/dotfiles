#!/usr/bin/env bash
# waybar-ram.sh — only outputs RAM usage when above 50%

TOTAL=$(grep MemTotal /proc/meminfo | awk '{print $2}')
AVAIL=$(grep MemAvailable /proc/meminfo | awk '{print $2}')
USED_KB=$(( TOTAL - AVAIL ))
PCT=$(( USED_KB * 100 / TOTAL ))
USED_GB=$(awk "BEGIN {printf \"%.1f\", $USED_KB / 1024 / 1024}")

if (( PCT > 50 )); then
    echo "{\"text\": \" ${USED_GB}G\", \"class\": \"visible\"}"
else
    echo '{"text": "", "class": "hidden"}'
fi

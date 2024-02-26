#!/usr/bin/env sh

killall -q openrgb

while pgrep -u $UID -x openrgb >/dev/null; do sleep 1; done

openrgb --startminimized -p $1


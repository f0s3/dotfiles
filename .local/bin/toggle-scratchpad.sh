#!/usr/bin/env bash
# toggle-scratchpad.sh
# Ensures scratchkitty exists, then toggles the special workspace.

HYPRCTL=/usr/bin/hyprctl

EXISTS=$($HYPRCTL clients -j 2>/dev/null | python3 -c "
import sys, json
for c in json.load(sys.stdin):
    if c.get('class') == 'scratchkitty':
        print('yes')
        break
else:
    print('no')
" 2>/dev/null)

if [[ "$EXISTS" == "no" ]]; then
    $HYPRCTL dispatch exec "[workspace special:magic silent] kitty --class scratchkitty"
    sleep 0.5
fi

$HYPRCTL dispatch togglespecialworkspace magic

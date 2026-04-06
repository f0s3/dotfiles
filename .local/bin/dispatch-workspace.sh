#!/usr/bin/env bash
# dispatch-workspace.sh
# Context-aware SUPER+N handler:
#   - If a Kitty window is focused → switch Kitty tab N
#   - Otherwise → switch Hyprland workspace N

N="$1"

# Get the class of the currently focused window
FOCUSED_CLASS=$(hyprctl activewindow -j 2>/dev/null | grep -o '"class": *"[^"]*"' | head -1 | sed 's/"class": *"\(.*\)"/\1/')

if [[ "$FOCUSED_CLASS" == "kitty" ]]; then
    # Route to Kitty tab via remote control
    # KITTY_LISTEN_ON is set automatically by Kitty when allow_remote_control=yes
    if ! kitten @ --to "$KITTY_LISTEN_ON" goto-tab "$N" 2>/dev/null; then
        # Fallback: Kitty socket unavailable, switch workspace instead
        hyprctl dispatch workspace "$N"
    fi
else
    hyprctl dispatch workspace "$N"
fi

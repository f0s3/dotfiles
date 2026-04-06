#!/usr/bin/env bash
# powermenu.sh — wofi-based power menu

chosen=$(echo -e "Reboot\nLock\nReboot to Windows" | wofi --dmenu --prompt "Power Menu" --width 300 --height 160 --cache-file /dev/null)

case "$chosen" in
    "Reboot") systemctl reboot ;;
    "Lock") hyprlock ;;
    "Reboot to Windows") ~/.local/bin/btw ;;
esac

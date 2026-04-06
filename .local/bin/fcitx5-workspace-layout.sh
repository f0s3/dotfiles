#!/usr/bin/env bash
# fcitx5-workspace-layout.sh
# Manages per-workspace keyboard layout (EN/UA) by subscribing to
# Hyprland socket events. Also handles toggle (SUPER+SPACE) and
# forces EN when scratchpad or Wofi opens.
#
# Usage:
#   fcitx5-workspace-layout.sh          — run as daemon (called by hyprland exec-once)
#   fcitx5-workspace-layout.sh toggle   — toggle layout on current workspace

set -euo pipefail

# Layout identifiers for fcitx5-remote
LAYOUT_EN="keyboard-us"
LAYOUT_UA="keyboard-ua"

# Per-workspace layout memory: workspace_layout[N]="EN"|"UA"
declare -A workspace_layout
current_workspace=1
pre_wofi_layout=""

# ── Helpers ──────────────────────────────────────────────────

get_current_workspace() {
    hyprctl activeworkspace -j 2>/dev/null | grep -o '"id": *[0-9]*' | head -1 | grep -o '[0-9]*'
}

get_layout_for_ws() {
    local ws="$1"
    echo "${workspace_layout[$ws]:-EN}"
}

apply_layout() {
    local layout="$1"
    if [[ "$layout" == "UA" ]]; then
        fcitx5-remote -s "$LAYOUT_UA" 2>/dev/null || true
    else
        fcitx5-remote -s "$LAYOUT_EN" 2>/dev/null || true
    fi
}

save_layout() {
    local ws="$1"
    local layout="$2"
    workspace_layout[$ws]="$layout"
}

get_active_layout() {
    local name
    name=$(fcitx5-remote -n 2>/dev/null || echo "$LAYOUT_EN")
    if [[ "$name" == *"ua"* ]]; then
        echo "UA"
    else
        echo "EN"
    fi
}

# ── Toggle mode (called by SUPER+SPACE keybind) ───────────────

if [[ "${1:-}" == "toggle" ]]; then
    # Read actual current layout from fcitx5-remote directly
    # (can't use in-memory array — this is a separate process)
    current_name=$(fcitx5-remote -n 2>/dev/null || echo "keyboard-us")
    if [[ "$current_name" == *"ua"* ]]; then
        fcitx5-remote -s "keyboard-us" 2>/dev/null || true
    else
        fcitx5-remote -s "keyboard-ua" 2>/dev/null || true
    fi
    exit 0
fi

# ── Daemon mode ───────────────────────────────────────────────

SOCKET_DIR="/tmp/hypr/${HYPRLAND_INSTANCE_SIGNATURE}"
SOCKET2="${SOCKET_DIR}/.socket2.sock"

# Wait for Hyprland socket t
="$ws"
            layout=$(get_layout_for_ws "$ws")
            apply_layout "$layout"
            ;;

        activewindow)
            # activewindow>>class,title
            win_class="${data%%,*}"
            # Force EN when scratchpad terminal gains focus
            if [[ "$win_class" == "scratchkitty" ]]; then
                apply_layout "EN"
            fi
            # Force EN when Wofi opens, save current layout for restore
            if [[ "$win_class" == "wofi" ]]; then
                ws=$(get_current_workspace)
                pre_wofi_layout=$(get_layout_for_ws "$ws")
                apply_layout "EN"
            fi
            ;;

        closewindow)
            # Restore layout after Wofi closes
            # closewindow>>windowaddress — we check by tracking wofi state
            if [[ -n "$pre_wofi_layout" ]]; then
                ws=$(get_current_workspace)
                apply_layout "$pre_wofi_layout"
                save_layout "$ws" "$pre_wofi_layout"
                pre_wofi_layout=""
            fi
            ;;
    esac
done

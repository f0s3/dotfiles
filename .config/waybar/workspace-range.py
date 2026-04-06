#!/usr/bin/env python3
# workspace-range.py
# Outputs a waybar-compatible JSON for workspaces,
# showing only the range between the lowest and highest occupied workspace.
# Max 7 workspaces shown.

import json
import subprocess
import sys


def get_state():
    clients = json.loads(subprocess.check_output(["hyprctl", "clients", "-j"]))
    active_ws = json.loads(subprocess.check_output(["hyprctl", "activeworkspace", "-j"]))

    occupied = set()
    for c in clients:
        ws_id = c.get("workspace", {}).get("id", 0)
        if ws_id > 0:
            occupied.add(ws_id)

    active_id = active_ws.get("id", 1)
    occupied.add(active_id)  # always include active

    if not occupied:
        return [active_id]

    lo = min(occupied)
    hi = max(occupied)

    # Clamp to max 7 range
    if hi - lo + 1 > 7:
        hi = lo + 6

    return list(range(lo, hi + 1)), active_id, occupied

workspaces, active_id, occupied = get_state()

output = []
for ws_id in workspaces:
    output.append({
        "id": ws_id,
        "active": ws_id == active_id,
        "occupied": ws_id in occupied
    })

print(json.dumps(output))

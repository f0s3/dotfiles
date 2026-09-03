#!/bin/bash

# omarchy:summary=Recover external displays after login so the SDDM->Hyprland handoff does not leave them black

# The SDDM greeter drives the monitor until the password is entered, then hands
# it to the Hyprland session. That transition can leave an external panel black
# (DPMS-off or stuck at 0x0) until it is physically unplugged and re-plugged.
# Wake with DPMS first, and once the session has settled run a reload, which
# makes Hyprland re-initialize every monitor from its EDID--the same "soft"
# recovery as a replug.

wake() {
  hyprctl dispatch 'hl.dsp.dpms({ action = "on" })' >/dev/null 2>&1 || true
}

# Wake immediately, then keep waking across the handoff window.
for i in 1 2 3; do
  wake
  sleep 2
done

# Let the session settle, then re-initialize monitors so a black panel that DPMS
# alone cannot wake gets its mode re-applied (as if it had been re-plugged).
sleep 4
wake
hyprctl reload >/dev/null 2>&1 || true
sleep 2
wake

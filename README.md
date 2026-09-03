# dotfiles

Personal config kept in git, applied to a fresh Omarchy install with one command.

Tracking **only the files I have modified** (not full Omarchy defaults), so
reapplying never overrides untouched stock config.

## What's tracked

- `~/.config/hypr/bindings.lua` — lid-close DPMS-override bindings
- `~/.config/hypr/hyprland.lua` — Hyprland entry (unchanged defaults + overrides)
- `~/.config/omarchy/hooks/post-boot.d/wake-displays.sh` — wakes external
  display after the SDDM→Hyprland login handoff
- `/etc/systemd/logind.conf.d/30-lid-switch.conf` — disables lid-close
  suspend/hibernate/poweroff entirely

## Fresh install

```bash
# 1. On the working machine, create the remote / push this repo there (or copy it over).
# 2. On the new machine, clone into ~/dotfiles and run:
sudo pacman -S --noconfirm stow   # if not already installed
~/dotfiles/install.sh
```

## Changes are in sync

Edit the **live** files, then copy them back into the repo:

```bash
cp ~/.config/hypr/bindings.lua        ~/dotfiles/stow/config/.config/hypr/bindings.lua
cp ~/.config/hypr/hyprland.lua        ~/dotfiles/stow/config/.config/hypr/hyprland.lua
cp ~/.config/omarchy/hooks/post-boot.d/wake-displays.sh ~/dotfiles/stow/config/.config/omarchy/hooks/post-boot.d/wake-displays.sh
cp /etc/systemd/logind.conf.d/30-lid-switch.conf ~/dotfiles/stow/etc/systemd/logind.conf.d/30-lid-switch.conf
cd ~/dotfiles && git add -A && git commit -m "sync"
```

## Uninstall / revert

```bash
~/dotfiles/install.sh --uninstall
```

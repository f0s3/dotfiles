# dotfiles

Personal config for my **Omarchy** laptop. Omarchy is an Arch-based Linux distro
with the **Hyprland** Wayland compositor. I run it on an under-desk setup: the
laptop lid can be shut and the machine keeps running, driving an external
monitor.

This repo is the single source of truth for the handful of files I've
customized. Everything is linked into place with **GNU Stow** and versioned in
git, so a clean reinstall is one command.

## What I use / why

- **Omarchy** (Arch + Hyprland) — the OS and desktop shell.
- **GNU Stow** — creates symlinks so configs live here in git but appear in the
  normal config locations.
- **systemd-logind** — the service that normally suspends on lid close.

## What this repo does

My machine differs from stock Omarchy in exactly one area: **laptop lid
behavior**. Closing the lid should NOT suspend — it should just blank the
built-in screen while everything (and any external monitor) keeps running as if
the lid were open.

Files tracked:

| File | Purpose |
|------|---------|
| `~/.config/hypr/bindings.lua` | Lid-close/`open` → blank/restore internal display via DPMS |
| `~/.config/hypr/hyprland.lua` | Hyprland entry point (loads the bindings above) |
| `~/.config/omarchy/hooks/post-boot.d/wake-displays.sh` | Wakes the external monitor after the SDDM→Hyprland login handoff (prevents a black screen needing unplug/replug) |
| `/etc/systemd/logind.conf.d/30-lid-switch.conf` | Tells logind to ignore the lid switch entirely (no suspend/hibernate/poweroff) |

Stock config (the vast majority) is **not** tracked, so a clean install never
has Omarchy defaults overwritten.

## Install on a clean machine

```bash
# Clone the repo (adjust the remote to your own host):
git clone <your-remote> ~/dotfiles

# One-time: install stow if missing
sudo pacman -S stow

# Link everything into place
~/dotfiles/install.sh
```

`install.sh` symlinks the user configs into `~`, symlinks the `/etc` logind
drop-in (asks for sudo), and restarts logind.

## Making changes

Live files are symlinks back into this repo, so editing them is editing the
repo — commit your changes anywhere inside `~/dotfiles`:

```bash
cd ~/dotfiles
git add -A
git commit -m "tweak lid behavior"
```

## Uninstall / revert

Removes the symlinks (keeps the files here in git):

```bash
~/dotfiles/install.sh --uninstall
```

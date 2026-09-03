# dotfiles

Personal config for my **Omarchy** laptop. Omarchy is an Arch-based Linux distro
with the **Hyprland** Wayland compositor. I run it on an under-desk setup: the
laptop lid can be shut and the machine keeps running, driving an external
monitor.

This repo is the single source of truth for the handful of files I've
customized, linked into place with symlinks and versioned in git, so a clean
reinstall is one command.

## What I use / why

- **Omarchy** (Arch + Hyprland) — the OS and desktop shell.
- **Symlinks** — each config lives here in git but appears in its normal config
  location. Installing only creates symlinks; nothing is copied.
- **systemd-logind** — the service that normally suspends on lid close.

## What this repo does

My machine differs from stock Omarchy in exactly one area: **laptop lid
behavior**. Closing the lid should NOT suspend — it should just blank the
built-in screen while everything (and any external monitor) keeps running as if
the lid were open.

Files tracked:

| File | Purpose |
|------|---------|
| `~/.config/hypr/bindings.lua` | Lid-close/open → blank/restore internal display |
| `~/.config/hypr/hyprland.lua` | Hyprland entry point (loads the bindings above) |
| `~/.config/omarchy/hooks/post-boot.d/wake-displays.sh` | Wakes the external monitor after the SDDM→Hyprland login handoff |
| `/etc/systemd/logind.conf.d/30-lid-switch.conf` | Tells logind to ignore the lid switch entirely |

Stock config (the vast majority) is **not** tracked, so a clean install never
has Omarchy defaults overwritten.

## Install on a clean machine

```bash
git clone <your-remote> ~/dotfiles
~/dotfiles/install.sh
```

That's it — no other dependencies (only `sudo` for the `/etc` file).

## What install.sh does, exactly

For each tracked file it checks the real, live state and links it only when
needed:

- already a symlink pointing at the repo → leave it
- missing → create the symlink
- a real file with the **same** content as the repo → convert to a symlink
  (content is first backed up to `file~`, then kept in git anyway)
- a real file with **different** content → **warn and leave it untouched**

The `/etc` logind file is handled the same way, and systemd-logind is reloaded
**only when that file was actually changed** — never on a no-op run.

## Is it safe to run repeatedly?

**Yes.** The script is fully idempotent. Running it again when everything is
already in place changes nothing: no files are rewritten and systemd-logind is
not restarted. It never silently overwrites a file whose content differs from
the repo — it warns and skips instead.

Preview without changing anything:

```bash
~/dotfiles/install.sh --check
```

Example output on an already-configured machine:

```
  [ok]    .config/hypr/bindings.lua (already linked)
  ...
  changed: 0   already-in-place: 4   skipped/warned: 0
  Everything is already in place. Nothing to do.
```

First run on a fresh machine makes the links; later runs just report
`Everything is already in place`.

## Making changes

Live files are symlinks back into this repo, so editing them is editing the
repo — commit your changes anywhere inside `~/dotfiles`:

```bash
cd ~/dotfiles
git add -A
git commit -m "tweak lid behavior"
```

## Uninstall / revert

Removes the symlinks (files stay in git):

```bash
~/dotfiles/install.sh --uninstall
```

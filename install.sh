#!/usr/bin/env bash
# Apply the dotfiles to this machine.
#
# Usage:  ./install.sh
#
# Symlinks each tracked file from this repo into its live location via GNU Stow,
# and for the root-owned /etc drop-in prompts for sudo. Reversible with:
#   ./install.sh --uninstall
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
STOW_DIR="$REPO_DIR/stow"

uninstall=0
[[ ${1:-} == "--uninstall" ]] && uninstall=1

# Tracked user files, relative to $HOME, that we own. Anything already present
# as a regular file is moved aside (suffix ~) so stow can link cleanly; this
# keeps re-runs idempotent and back-ups pre-existing content.
USER_FILES=(
  ".config/hypr/bindings.lua"
  ".config/hypr/hyprland.lua"
  ".config/omarchy/hooks/post-boot.d/wake-displays.sh"
)

backup_existing() {
  local prefix="$1" ; shift
  local f
  for rel in "$@"; do
    local path="$prefix/$rel"
    if [[ -e $path && ! -L $path ]]; then
      echo "Backing up existing $path -> $path~"
      mv "$path" "$path~"
    fi
  done
}

cd "$STOW_DIR"

if (( uninstall )); then
  stow -t "$HOME" -D config
  sudo rm -f /etc/systemd/logind.conf.d/30-lid-switch.conf
  echo "Removed symlinks. Backups (with ~) and repo files remain."
  exit 0
fi

echo "Installing user configs -> ~"
backup_existing "$HOME" "${USER_FILES[@]}"
stow -t "$HOME" config

# Symlink the single /etc/systemd drop-in directly (stow would link the whole
# directory tree, which we do not want). Back up any existing real file first.
echo "Installing system config -> /etc (sudo)"
sudo mkdir -p /etc/systemd/logind.conf.d
sudo bash -c '
  f=/etc/systemd/logind.conf.d/30-lid-switch.conf
  if [[ -e $f && ! -L $f ]]; then
    echo "Backing up existing $f -> $f~"
    mv "$f" "$f~"
  fi
  ln -sf "'"$STOW_DIR"'/etc/systemd/logind.conf.d/30-lid-switch.conf" "$f"
'

# Apply the logind change. On a fresh install this runs before a graphical
# session (or via SSH), so the restart is safe.
sudo systemctl restart systemd-logind

echo "Done. Dotfiles are now linked."

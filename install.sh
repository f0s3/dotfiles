#!/usr/bin/env bash
# Apply the dotfiles to this machine.
#
#   ./install.sh                 link anything that is missing or out of sync
#   ./install.sh --check         report what WOULD happen, change nothing
#   ./install.sh --uninstall     remove the symlinks (configs stay in git)
#
# Fully idempotent and safe to run many times: each tracked file is examined and
# only linked when it is missing, a real file whose contents already match the
# repo (converted to a symlink), or an incorrect symlink. Real files whose
# contents DIFFER from the repo are left untouched with a warning -- nothing is
# ever silently overwritten.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
STOW_DIR="$REPO_DIR/stow"

mode="install"
[[ ${1:-} == "--check" ]] && mode="check"
[[ ${1:-} == "--uninstall" ]] && mode="uninstall"

# Tracked files: live location -> repo source (absolute).
# user files are relative to $HOME; the /etc one is root-owned.
USER_PAIRS=(
  ".config/hypr/bindings.lua:stow/config/.config/hypr/bindings.lua"
  ".config/hypr/hyprland.lua:stow/config/.config/hypr/hyprland.lua"
  ".config/omarchy/hooks/post-boot.d/wake-displays.sh:stow/config/.config/omarchy/hooks/post-boot.d/wake-displays.sh"
)
ETC_SRC="$STOW_DIR/etc/systemd/logind.conf.d/30-lid-switch.conf"
ETC_DST="/etc/systemd/logind.conf.d/30-lid-switch.conf"

if [[ $mode == "uninstall" ]]; then
  echo "== dotfiles: uninstall =="
  for pair in "${USER_PAIRS[@]}"; do
    live="$HOME/${pair%%:*}"
    src="$REPO_DIR/${pair#*:}"
    if [[ -L $live ]] && [[ "$(readlink -f "$live")" == "$(readlink -f "$src")" ]]; then
      echo "  [removed] ${live#"$HOME"/}"
      rm "$live"
    else
      echo "  [keep]   ${live#"$HOME"/} (not a repo symlink; left alone)"
    fi
  done
  if [[ -L $ETC_DST ]] && [[ "$(readlink -f "$ETC_DST")" == "$(readlink -f "$ETC_SRC")" ]]; then
    echo "  [removed] $ETC_DST"
    sudo rm "$ETC_DST"
  else
    echo "  [keep]   $ETC_DST (not a repo symlink; left alone)"
  fi
  echo
  echo "Removed repo symlinks. Files are still in git; the ~ backups remain."
  exit 0
fi

changed=0
unchanged=0
skipped=0

link_if_needed() {
  local live="$1" src="$2"
  local rel="${live#"$HOME"/}"

  # Already a symlink pointing at the repo source: perfect, nothing to do.
  if [[ -L $live ]] && [[ "$(readlink -f "$live")" == "$(readlink -f "$src")" ]]; then
    echo "  [ok]    $rel (already linked)"
    unchanged=$((unchanged + 1))
    return 0
  fi

  # Missing: safe to create the symlink (creating parent dirs as needed).
  if [[ ! -e $live ]]; then
    [[ $mode == "check" ]] && { echo "  [todo]  $rel (would link)"; return 0; }
    echo "  [link]  $rel"
    mkdir -p "$(dirname "$live")"
    ln -s "$src" "$live"
    changed=$((changed + 1))
    return 0
  fi

  # Real file with identical content: safe to convert to a symlink (no data
  # loss -- the content is already in the repo). Back it up first anyway.
  if cmp -s "$live" "$src"; then
    if [[ $mode == "check" ]]; then
      echo "  [todo]  $rel (real file, identical content -> would link)"
      return 0
    fi
    echo "  [link]  $rel (identical content, backed up to ~)"
    mv "$live" "$live~"
    mkdir -p "$(dirname "$live")"
    ln -s "$src" "$live"
    changed=$((changed + 1))
    return 0
  fi

  # Real file whose content differs from the repo: never overwrite, just warn.
  echo "  [warn]  $rel is a real file with DIFFERENT content than the repo."
  echo "          Left untouched. Diff and resolve manually (repo vs $src)."
  skipped=$((skipped + 1))
  return 1
}

echo "== dotfiles: $mode =="

# --- User configs ---
echo "* User configs (-> ~)"
for pair in "${USER_PAIRS[@]}"; do
  live="$HOME/${pair%%:*}"
  src="$REPO_DIR/${pair#*:}"
  link_if_needed "$live" "$src" || true
done

# --- /etc drop-in ---
echo "* System config -> /etc (sudo)"
logind_changed=0
if [[ $mode == "check" ]]; then
  link_if_needed "$ETC_DST" "$ETC_SRC" || true
elif [[ -L $ETC_DST ]] && [[ "$(readlink -f "$ETC_DST")" == "$(readlink -f "$ETC_SRC")" ]]; then
  echo "  [ok]    /etc/systemd/logind.conf.d/30-lid-switch.conf (already linked)"
  unchanged=$((unchanged + 1))
elif [[ ! -e $ETC_DST ]]; then
  echo "  [link]  /etc/systemd/logind.conf.d/30-lid-switch.conf"
  sudo mkdir -p /etc/systemd/logind.conf.d
  sudo ln -s "$ETC_SRC" "$ETC_DST"
  changed=$((changed + 1))
  logind_changed=1
elif cmp -s "$ETC_DST" "$ETC_SRC"; then
  echo "  [link]  /etc/systemd/logind.conf.d/30-lid-switch.conf (identical content, backed up)"
  sudo mv "$ETC_DST" "$ETC_DST~"
  sudo ln -s "$ETC_SRC" "$ETC_DST"
  changed=$((changed + 1))
  logind_changed=1
else
  echo "  [warn]  $ETC_DST is a real file with DIFFERENT content than the repo."
  echo "          Left untouched. Diff and resolve manually."
  skipped=$((skipped + 1))
fi

# --- Apply logind restart only when we actually changed the drop-in ---
if [[ $mode == "install" && $logind_changed -eq 1 ]]; then
  echo "* Reloading systemd-logind to apply the lid-switch config"
  sudo systemctl restart systemd-logind
fi

# --- Summary ---
echo
echo "== Summary =="
echo "  changed: $changed   already-in-place: $unchanged   skipped/warned: $skipped"
if (( changed == 0 && skipped == 0 )); then
  echo "  Everything is already in place. Nothing to do."
elif [[ $mode == "check" ]]; then
  echo "  (dry run -- nothing was modified)"
fi

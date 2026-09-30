#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"
BACKUP_ROOT="$HOME/.config/himalaya-rice-backups/$(date +'%Y%m%d-%H%M%S')"

mkdir -p "$CONFIG_DIR" "$BACKUP_ROOT"

# This repository is laid out so each top-level directory under config/ maps
# directly into ~/.config. Existing managed directories are moved aside first.
for src in "$REPO_DIR"/config/*; do
  name="$(basename "$src")"
  dst="$CONFIG_DIR/$name"

  if [[ -e "$dst" || -L "$dst" ]]; then
    echo "Backing up $dst"
    mv "$dst" "$BACKUP_ROOT/$name"
  fi

  ln -s "$src" "$dst"
  echo "Linked $name"
done

"$REPO_DIR/scripts/apply-theme"

cat <<MSG

Himalaya Rice is installed.

Backup: $BACKUP_ROOT
Theme:  $HOME/.config/myrice/theme.toml

Reload Hyprland after entering the session:
  hyprctl reload
  hyprctl configerrors
MSG

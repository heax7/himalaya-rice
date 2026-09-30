#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for src in "$REPO_DIR"/config/*; do
  name="$(basename "$src")"
  dst="$HOME/.config/$name"
  if [[ -L "$dst" ]] && [[ "$(readlink -f "$dst")" == "$(readlink -f "$src")" ]]; then
    rm "$dst"
    echo "Removed $dst"
  fi
done

echo "Himalaya Rice symlinks removed. Restore a backup from ~/.config/himalaya-rice-backups if needed."

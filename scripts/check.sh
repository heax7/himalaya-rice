#!/usr/bin/env bash
set -euo pipefail

fail=0

for cmd in hyprctl waybar rofi kitty hyprlock hypridle dunst swaybg wl-copy wl-paste cliphist grim slurp brightnessctl playerctl; do
  if command -v "$cmd" >/dev/null 2>&1; then
    printf '✓ %-24s found\n' "$cmd"
  else
    printf '✗ %-24s missing\n' "$cmd"
    fail=1
  fi
done

if command -v python3 >/dev/null 2>&1; then
  printf '✓ %-24s found\n' python3
else
  printf '✗ %-24s missing\n' python3
  fail=1
fi

exit "$fail"

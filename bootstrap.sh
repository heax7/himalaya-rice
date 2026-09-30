#!/usr/bin/env bash
set -euo pipefail

# Print, rather than execute, the package install command. This keeps bootstrap
# safe to inspect before sudo is involved.
cat <<'MSG'
Arch baseline:

sudo pacman -S --needed \
  hyprland waybar rofi kitty hyprlock hypridle dunst \
  swaybg wl-clipboard cliphist grim slurp brightnessctl playerctl \
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk \
  ttf-jetbrains-mono-nerd

After installing packages:
  ./install.sh
MSG

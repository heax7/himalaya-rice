# Himalaya Rice

A publishable, minimal Hyprland rice inspired by **Omarchy's modular user-overrides** and **HyDE's translucent, theme-driven feel** — but intentionally smaller, cleaner, and built around a single Himalayan-inspired visual identity.

> **Status:** first release / starter-quality publishable rice. The files target current Hyprland's Lua configuration model (0.55+). Hardware-specific monitor modes, GPU quirks, and your preferred app classes may require small edits.

## Design language

- Deep Himalayan-night background
- Glacier turquoise as the primary accent
- High-altitude sky blue as the secondary accent
- Saffron sunrise for highlights
- Rhododendron red for destructive/critical states
- Subtle translucency, not a full glassmorphism overload
- Rounded windows with restrained borders
- Minimal Waybar: workspaces / clock / system status
- One built-in wallpaper for now

## Architecture

```text
~/.config/
├── hypr/
│   ├── hyprland.lua        # entry point
│   ├── theme.lua           # generated from myrice/theme.toml
│   ├── appearance.lua      # gaps, blur, opacity, borders
│   ├── animations.lua      # curves + animation tree
│   ├── bindings.lua        # keyboard/mouse bindings
│   ├── environment.lua     # Wayland/session environment
│   ├── input.lua           # keyboard/mouse/touchpad
│   ├── monitors.lua        # monitor defaults + fallback
│   ├── rules.lua           # window rules
│   ├── autostart.lua       # desktop services
│   ├── hyprlock.conf       # lock screen
│   ├── hypridle.conf       # idle / lock / suspend
│   └── scripts/             # desktop helper scripts
│
├── waybar/
│   ├── config.jsonc
│   ├── style.css
│   └── theme.css             # generated
│
├── rofi/
│   ├── config.rasi
│   └── themes/himalaya.rasi  # generated
│
├── kitty/
│   ├── kitty.conf
│   └── theme.conf            # generated
│
├── dunst/
│   └── dunstrc
│
└── myrice/
    └── theme.toml            # source of truth for theme values
```

The central idea is **source → generated theme → applications**. Edit `config/myrice/theme.toml`, then run `scripts/apply-theme`.

## Inspired by

This repository intentionally borrows architectural ideas, not code wholesale:

- Omarchy: keep personal configuration in `~/.config`, split Hyprland configuration into small modules, and load user overrides after defaults. See the Omarchy dotfiles guide: https://omarchy.org/manual/dotfiles/
- HyDE: keep the UI strongly theme-driven and use generated theme layers for Waybar/Rofi/other applications. See the HyDE Waybar guide: https://hydeproject.pages.dev/en/configuring/waybar/
- Hyprland 0.55+: Lua is the current primary configuration model; hyprlang is deprecated. See: https://wiki.hypr.land/Configuring/Start/

## Install

### 1. Get the repository

```bash
git clone https://github.com/heax7/himalaya-rice.git
cd himalaya-rice
```

### 2. Install dependencies on Arch

The recommended baseline uses packages from Arch's repositories:

```bash
sudo pacman -S --needed \
  hyprland waybar rofi kitty hyprlock hypridle dunst \
  swaybg wl-clipboard cliphist grim slurp brightnessctl playerctl \
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk \
  ttf-jetbrains-mono-nerd
```

The current Arch package set includes Hyprland 0.56.x, Waybar 0.15.x, Kitty 0.48.x, Hyprlock 0.9.x, swaybg 1.2.x, wl-clipboard 2.3.x, cliphist 0.7.x, and JetBrains Mono Nerd Font 3.5.x at the time this rice was authored.

### 3. Install the dotfiles

```bash
./install.sh
```

The installer makes timestamped backups before replacing existing managed config directories.

### 4. Apply the theme

```bash
./scripts/apply-theme
```

### 5. Start/reload Hyprland

Use your normal login/session method. Once inside Hyprland:

```bash
hyprctl reload
hyprctl configerrors
```

## Keybinds

| Bind | Action |
|---|---|
| `SUPER + Enter` | Terminal |
| `SUPER + Space` | App launcher |
| `SUPER + Q` | Close active window |
| `SUPER + F` | File manager |
| `SUPER + B` | Browser |
| `SUPER + E` | Toggle floating |
| `SUPER + H/J/K/L` | Focus left/down/up/right |
| `SUPER + SHIFT + H/J/K/L` | Move window |
| `SUPER + 1..9` | Workspace 1..9 |
| `SUPER + SHIFT + 1..9` | Move window to workspace |
| `SUPER + M` | Fullscreen |
| `SUPER + SHIFT + Space` | Toggle scratch terminal workspace |
| `SUPER + W` | Re-apply single wallpaper |
| `SUPER + Shift + R` | Reload Hyprland |
| `SUPER + C` | Clipboard history |
| `SUPER + Esc` | Power menu |
| `Print` | Screenshot region to clipboard |
| `Shift + Print` | Full screenshot to clipboard |
| `XF86AudioRaiseVolume` / `LowerVolume` | Volume |
| `XF86MonBrightnessUp` / `Down` | Brightness |

## Customization

### Theme

Edit:

```text
config/myrice/theme.toml
```

Then:

```bash
./scripts/apply-theme
hyprctl reload
```

This regenerates:

```text
config/hypr/theme.lua
config/waybar/theme.css
config/rofi/themes/himalaya.rasi
config/kitty/theme.conf
```

### Monitor

Edit:

```text
config/hypr/monitors.lua
```

The shipped configuration uses a safe preferred-mode fallback rather than inventing a monitor name. For a fixed layout, run:

```bash
hyprctl monitors all
```

and add explicit `hl.monitor({...})` rules.

### Appearance

Edit:

```text
config/hypr/appearance.lua
config/hypr/animations.lua
```

### Waybar

Behavior/layout:

```text
config/waybar/config.jsonc
```

Appearance:

```text
config/waybar/style.css
```

### Rofi

```text
config/rofi/config.rasi
```

### Terminal

```text
config/kitty/kitty.conf
```

### Lock / idle

```text
config/hypr/hyprlock.conf
config/hypr/hypridle.conf
```

## Philosophy

This rice avoids the two common dotfile problems:

1. **One giant config** where every subsystem is tangled together.
2. **A generated-file maze** where the user cannot tell which file is the source of truth.

Himalaya Rice keeps a small hand-written configuration surface and a single theme source, with generated theme files clearly marked.

## Safety / reversibility

The installer backs up pre-existing managed directories. It does **not** touch `/usr/share/omarchy`, `/etc`, systemd units, or your package manager configuration.

## License

MIT. See `LICENSE`.

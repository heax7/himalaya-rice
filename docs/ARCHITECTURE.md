# Architecture

## 1. Hyprland entry point

`config/hypr/hyprland.lua` is intentionally tiny. It is the equivalent of a program's `main()` and only loads modules.

## 2. Behavior modules

- `environment.lua`: session variables
- `input.lua`: input device behavior
- `monitors.lua`: display topology
- `bindings.lua`: shortcuts
- `rules.lua`: window behavior
- `appearance.lua`: decoration / gaps / transparency
- `animations.lua`: curves / motion
- `autostart.lua`: services

This mirrors Omarchy's small-file, user-override philosophy without depending on Omarchy itself.

## 3. Theme source

`config/myrice/theme.toml` is the human-editable source of truth. `scripts/apply-theme` uses Python's standard-library TOML parser to generate only the files that need application-specific syntax:

- Hyprland Lua
- Waybar CSS
- Rofi Rasi
- Kitty config

The generated files are ignored by Git so the source remains clean.

## 4. Why not copy HyDE wholesale?

HyDE's strength is its extensive theme-generation ecosystem. Its downside for a personal publishable rice is the amount of indirection that a beginner must understand. Himalaya Rice keeps one theme file and only a few generated outputs.

## 5. Why not depend on Omarchy?

Omarchy has a very good defaults → personal overrides architecture, but this rice is intended to be standalone. You do not need `/usr/share/omarchy`, Omarchy's package, or its shell to use the repository.

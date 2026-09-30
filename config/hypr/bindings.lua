-- Himalayan Rice keymap. External commands are intentionally launched through
-- Hyprland dispatchers so Lua callbacks stay non-blocking.

local mod = "SUPER"

local function cmd(command)
    return hl.dsp.exec_cmd(command)
end

-- Applications
hl.bind(mod .. " + RETURN", cmd("kitty"))
hl.bind(mod .. " + SPACE", cmd("rofi -show drun"))
hl.bind(mod .. " + F", cmd("xdg-open ."))
hl.bind(mod .. " + B", cmd("xdg-open https://www.google.com"))
hl.bind(mod .. " + C", cmd("~/.config/hypr/scripts/clipboard"))
hl.bind(mod .. " + ESCAPE", cmd("~/.config/hypr/scripts/power-menu"))
hl.bind(mod .. " + W", cmd("~/.config/hypr/scripts/wallpaper"))
hl.bind(mod .. " + SHIFT + R", cmd("hyprctl reload"))

-- Window controls
hl.bind(mod .. " + Q", cmd("hyprctl dispatch killactive"))
hl.bind(mod .. " + E", cmd("hyprctl dispatch togglefloating"))
hl.bind(mod .. " + M", cmd("hyprctl dispatch fullscreen"))
hl.bind(mod .. " + P", cmd("hyprctl dispatch pseudo"))

-- Directional focus
hl.bind(mod .. " + H", cmd("hyprctl dispatch movefocus l"))
hl.bind(mod .. " + J", cmd("hyprctl dispatch movefocus d"))
hl.bind(mod .. " + K", cmd("hyprctl dispatch movefocus u"))
hl.bind(mod .. " + L", cmd("hyprctl dispatch movefocus r"))

-- Directional move
hl.bind(mod .. " + SHIFT + H", cmd("hyprctl dispatch movewindow l"))
hl.bind(mod .. " + SHIFT + J", cmd("hyprctl dispatch movewindow d"))
hl.bind(mod .. " + SHIFT + K", cmd("hyprctl dispatch movewindow u"))
hl.bind(mod .. " + SHIFT + L", cmd("hyprctl dispatch movewindow r"))

-- Workspaces 1–9
for i = 1, 9 do
    hl.bind(mod .. " + " .. i, cmd("hyprctl dispatch workspace " .. i))
    hl.bind(mod .. " + SHIFT + " .. i, cmd("hyprctl dispatch movetoworkspace " .. i))
end

-- Scratchpad-like special workspace.
hl.bind(mod .. " + SHIFT + SPACE", cmd("hyprctl dispatch togglespecialworkspace scratch"))

-- Screenshots
hl.bind("PRINT", cmd("~/.config/hypr/scripts/screenshot-region"))
hl.bind("SHIFT + PRINT", cmd("~/.config/hypr/scripts/screenshot-full"))

-- Audio
hl.bind("XF86AudioRaiseVolume", cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

-- Brightness
hl.bind("XF86MonBrightnessUp", cmd("brightnessctl set 5%+"))
hl.bind("XF86MonBrightnessDown", cmd("brightnessctl set 5%-"))

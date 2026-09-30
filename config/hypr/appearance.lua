-- Visual base: calm, rounded, translucent, but not excessive.
local t = _G.himalaya_theme
local a = t.appearance
local b = t.blur

hl.config({
    general = {
        gaps_in = a.gaps_in,
        gaps_out = a.gaps_out,
        border_size = a.border_size,
        layout = "dwindle",
        resize_on_border = true,
        allow_tearing = false,
        col.active_border = t.colors.primary,
        col.inactive_border = t.colors.overlay,
    },

    decoration = {
        rounding = a.rounding,
        active_opacity = a.active_opacity,
        inactive_opacity = a.inactive_opacity,
        fullscreen_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 18,
            render_power = 3,
            color = t.colors.shadow,
        },

        blur = {
            enabled = b.enabled,
            size = b.size,
            passes = b.passes,
            xray = false,
        },
    },

    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        animate_manual_resizes = true,
        animate_mouse_windowdragging = true,
    },

    dwindle = {
        pseudotile = true,
        preserve_split = true,
    },

    cursor = {
        hide_on_key_press = false,
        hide_on_touch = true,
    },
})

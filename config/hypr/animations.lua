-- Subtle motion inspired by modern Wayland rices.
local t = _G.himalaya_theme

hl.curve("himalayaEase", {
    type = "bezier",
    points = {
        { 0.16, 1.0 },
        { 0.3, 1.0 },
    },
})

hl.animation({
    leaf = "windows",
    enabled = t.animations.enabled,
    speed = t.animations.speed,
    bezier = "himalayaEase",
    style = "popin 90%",
})

hl.animation({
    leaf = "windowsIn",
    enabled = t.animations.enabled,
    speed = t.animations.speed,
    bezier = "himalayaEase",
    style = "popin 92%",
})

hl.animation({
    leaf = "windowsOut",
    enabled = t.animations.enabled,
    speed = t.animations.speed,
    bezier = "himalayaEase",
    style = "fade",
})

hl.animation({
    leaf = "fade",
    enabled = t.animations.enabled,
    speed = t.animations.speed,
    bezier = "himalayaEase",
})

hl.animation({
    leaf = "workspaces",
    enabled = t.animations.enabled,
    speed = t.animations.speed + 1,
    bezier = "himalayaEase",
    style = "slidefade 20%",
})

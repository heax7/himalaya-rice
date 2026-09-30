-- Safe by default: prefer each monitor's native mode and let Hyprland arrange
-- unspecified outputs automatically. For a fixed setup, add explicit rules.

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto",
})

-- Example fixed monitor rule (disabled until you replace DP-1):
-- hl.monitor({
--     output = "DP-1",
--     mode = "1920x1080@144",
--     position = "0x0",
--     scale = 1,
-- })

local ok, f = pcall(require, "hypr.monitors.local")
if ok and f then f() end

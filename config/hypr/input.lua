-- Comfortable defaults. The CapsLock remap is intentionally commented out.
hl.config({
    input = {
        kb_layout = "us",
        repeat_rate = 50,
        repeat_delay = 300,
        follow_mouse = 1,
        sensitivity = 0,
        accel_profile = "adaptive",
        numlock_by_default = true,
        touchpad = {
            natural_scroll = true,
            disable_while_typing = true,
            ["tap-to-click"] = true,
            drag_lock = false,
        },
    },
})

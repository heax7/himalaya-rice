-- Keep rules small and predictable. Add application-specific rules here after
-- checking the real class with: hyprctl clients

hl.window_rule({
    match = { class = "^(pavucontrol|blueman-manager)$" },
    float = true,
})

hl.window_rule({
    match = { title = "^(Open File|Save File|Choose a File)$" },
    float = true,
})

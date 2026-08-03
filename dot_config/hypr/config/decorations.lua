local c = require("config.colors")

hl.plugin.load("/usr/lib/libhyprbars.so")

hl.plugin.hyprbars.add_button({
    bg_color = c.mauve,
    fg_color = c.base,
    size = 10,
    icon = "",
    action = "close",
})

hl.config({
    plugin = {
        hyprbars = {
            bar_color = c.surface0,
            col = {
                text = c.text,
            },
            inactive_button_color = c.mauve,
            bar_height = 28,
            enabled = true,
            bar_text_font = "JetBrainsMono Nerd Font",
        },
    },
})

hl.config({
    decoration = {
        rounding = 10,
        blur = {
            enabled           = false,
            xray              = true,
            special           = false,
            new_optimizations = true,
            size              = 7,
            passes            = 4,
            brightness        = 1,
            noise             = 0.01,
            contrast          = 1,
            popups            = true,
            popups_ignorealpha = 0.6,
        },
        dim_inactive = false,
        dim_strength = 0.1,
        dim_special  = 0,
    },
})

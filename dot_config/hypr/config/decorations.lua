local c = require("config.colors")

hl.config({
    plugin = {
        hyprbars = {
            round_tb                   = true,
            bar_height                 = 28,
            shadow_size                = 0,
            shadow_render_behind_text  = true,

            col = {
                bar_all      = c.surface0,
                text_all     = c.text,
                buttons      = c.surface1,
                button_active = c.mauve,
                button_pressed = c.mauve,
                keynetsplit  = c.mantle,
            },

            font_family = "JetBrainsMono Nerd Font",

            buttons = {
                active_only    = true,
                del            = "",
                fullscreen     = "",
                minimize       = "",
                close          = "",
                maximize       = "",
                hide           = "",
            },
        },
    },

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

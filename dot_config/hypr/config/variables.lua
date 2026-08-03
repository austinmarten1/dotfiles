local c = require("config.colors")

hl.config({
    general = {
        gaps_in     = 3,
        gaps_out    = 5,
        border_size = 3,
        layout      = "dwindle",
        col = {
            active_border   = c.blue,
            inactive_border = c.surface0,
        },
        snap = {
            enabled = true,
        },
    },

    group = {
        col = {
            border_active        = c.teal,
            border_inactive      = c.surface1,
            border_locked_active = c.green,
            border_locked_inactive = c.crust,
        },
        groupbar = {
            font_family = "JetBrainsMono Nerd Font",
            text_color  = c.text,
            col = {
                active        = c.teal,
                inactive      = c.surface1,
                locked_active = c.green,
                locked_inactive = c.crust,
            },
        },
    },

    misc = {
        font_family           = "JetBrainsMono Nerd Font",
        splash_font_family    = "JetBrainsMono Nerd Font",
        disable_hyprland_logo = true,
        col = {
            splash = c.blue,
        },
        background_color      = c.crust,
        enable_swallow        = true,
        swallow_regex         = "^(firefox|nautilus|nemo|thunar)$",
        focus_on_activate     = true,
        vrr                   = 2,
        render_unfocused_fps  = 0,
    },

    render = {
        direct_scanout = false,
    },

    cursor = {
        no_hardware_cursors = 2,
        no_break_fs_vrr     = true,
        min_refresh_rate    = 60,
    },

    dwindle = {
        special_scale_factor = 0.8,
        preserve_split       = true,
    },

    master = {
        new_status           = "master",
        special_scale_factor = 0.8,
    },
})

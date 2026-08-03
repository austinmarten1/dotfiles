local c = require("config.colors")

hl.plugin.hyprbars({
  round_tb                    = true,
  bar_height                  = 28,
  shadow_size                 = 0,
  shadow_render_behind_text   = true,

  col_bar_all                 = c.surface0,
  col_text_all                = c.text,
  col_buttons                 = c.surface1,
  col_button_active           = c.mauve,
  col_button_pressed          = c.mauve,
  col_keynetsplit             = c.mantle,

  font_family                 = "JetBrainsMono Nerd Font",

  active_only                 = true,
  button_del                  = "",
  button_fullscreen           = "",
  button_minimize             = "",
  button_close                = "",
  button_maximize             = "",
  button_hide                 = "",
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

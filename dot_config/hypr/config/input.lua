hl.config({
    input = {
        kb_layout          = "us",
        numlock_by_default = true,
        repeat_delay       = 250,
        repeat_rate        = 35,
        special_fallthrough = true,
        follow_mouse       = 1,
        force_no_accel     = 0,
        touchpad = {
            natural_scroll       = false,
            disable_while_typing = true,
            clickfinger_behavior = true,
            scroll_factor        = 0.75,
        },
    },

    binds = {
        scroll_event_delay = 0,
    },
})

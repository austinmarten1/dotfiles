local d       = require("config.defaults")
local mainMod = "SUPER"

-- Apps
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(d.terminal), {
    description = "Opens your preferred terminal emulator (" .. d.terminal .. ")",
})
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(d.filemanager), {
    description = "Opens your preferred filemanager (" .. d.filemanager .. ")",
})

-- Screenshots
hl.bind("Print", hl.dsp.exec_cmd([[grim -g "$(slurp)" - | wl-copy -t image/png && notify-send "Screenshot copied to clipboard"]]), {
    description = "Screenshot region to clipboard",
})
hl.bind("SHIFT + Print", hl.dsp.exec_cmd([[grim -g "$(slurp)" - | swappy -f -]]), {
    description = "Screenshot region to swappy editor",
})
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd([[grim -o "$(hyprctl -j monitors | jq -r '.[] | select(.focused) | .name')" - | wl-copy -t image/png && notify-send "Monitor screenshot copied to clipboard"]]), {
    description = "Screenshot current monitor to clipboard",
})

-- Window management
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), {
    description = "Closes (not kill) current window",
})
hl.bind(mainMod .. " + ALT + M", hl.dsp.exec_cmd([[loginctl terminate-user ""]]), {
    description = "Exits Hyprland by terminating the user sessions",
})
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("ghostty --class=clipse -e clipse"), {
    description = "Open clipboard history (clipse)",
})
hl.bind(mainMod .. " + ALT + V", hl.dsp.window.float({
    action = "toggle",
}), {
    description = "Switches current window between floating and tiling mode",
})
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(d.applauncher), {
    description = "Runs your application launcher",
})
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd([[~/.config/hypr/scripts/show-binds | wofi --dmenu --prompt "Keybinds" --width 700 --height 500 --no-actions --insensitive]]), {
    description = "Show keybinds",
})
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen(), {
    description = "Toggles current window fullscreen mode",
})
hl.bind(mainMod .. " + Y", hl.dsp.window.pin(), {
    description = "Pin current window (shows on all workspaces)",
})
hl.bind(mainMod .. " + T", hl.dsp.layout("togglesplit"), {
    description = "Toggles current window split mode",
})
hl.bind(mainMod .. " + G", hl.dsp.group.toggle(), {
    description = "Toggles current window group mode (ungroup all related)",
})
hl.bind(mainMod .. " + Tab", hl.dsp.group.next(), {
    description = "Switches to the next window in the group",
})

-- Media / volume / brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"), {
    description = "Raise volume",
    locked      = true,
    repeating   = true,
})
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), {
    description = "Lower volume",
    locked      = true,
    repeating   = true,
})
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), {
    description = "Toggle mute",
    locked      = true,
})
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), {
    description = "Toggle microphone mute",
    locked      = true,
})

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), {
    description = "Toggles play/pause",
})
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), {
    description = "Next track",
})
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), {
    description = "Previous track",
})

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +5%"), {
    description = "Raise screen brightness",
    locked      = true,
    repeating   = true,
})
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), {
    description = "Lower screen brightness",
    locked      = true,
    repeating   = true,
})

hl.bind(mainMod .. " + ALT + CTRL + L", hl.dsp.exec_cmd("hyprlock"), {
    description = "Lock the screen",
})
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("killall waybar; sleep 0.3 && waybar &"), {
    description = "Reload/restarts Waybar",
})

-- Focus / move active window by direction
local dirs = {
    { key = "h", dir = "left",  focus = "Move focus left",  move = "Move active window to the left" },
    { key = "l", dir = "right", focus = "Move focus right", move = "Move active window to the right" },
    { key = "k", dir = "up",    focus = "Move focus up",    move = "Move active window upwards" },
    { key = "j", dir = "down",  focus = "Move focus down",  move = "Move active window downwards" },
}
for _, d2 in ipairs(dirs) do
    hl.bind(mainMod .. " + " .. d2.key, hl.dsp.focus({
        direction = d2.dir,
    }), {
        description = d2.focus,
    })
    hl.bind(mainMod .. " + CTRL + " .. d2.key, hl.dsp.window.move({
        direction = d2.dir,
    }), {
        description = d2.move,
    })
end

-- Mouse move/resize
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), {
    mouse = true,
})
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), {
    mouse = true,
})

-- Resize deltas shared between the submap and the global binds
local resizeDirs = {
    { key = "right", x = 15,  y = 0,   label = "Resize to the right" },
    { key = "left",  x = -15, y = 0,   label = "Resize to the left" },
    { key = "up",    x = 0,   y = -15, label = "Resize upwards" },
    { key = "down",  x = 0,   y = 15,  label = "Resize downwards" },
    { key = "l",     x = 15,  y = 0,   label = "Resize to the right" },
    { key = "h",     x = -15, y = 0,   label = "Resize to the left" },
    { key = "k",     x = 0,   y = -15, label = "Resize upwards" },
    { key = "j",     x = 0,   y = 15,  label = "Resize downwards" },
}

-- Resize submap
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"), {
    description = "Activates window resizing mode",
})
hl.define_submap("resize", function()
    for _, r in ipairs(resizeDirs) do
        hl.bind(r.key, hl.dsp.window.resize({
            x        = r.x,
            y        = r.y,
            relative = true,
        }), {
            description = r.label .. " (resizing mode)",
        })
    end
    hl.bind("escape", hl.dsp.submap("reset"), {
        description = "Ends window resizing mode",
    })
end)

-- Global resize
for _, r in ipairs(resizeDirs) do
    hl.bind(mainMod .. " + CTRL + SHIFT + " .. r.key, hl.dsp.window.resize({
        x        = r.x,
        y        = r.y,
        relative = true,
    }), {
        description = r.label,
    })
end

-- Workspaces: switch + move-to (10 maps to key 0)
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({
        workspace = i,
    }), {
        description = "Switch to workspace " .. i,
    })
    hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.window.move({
        workspace = i,
        follow    = true,
    }), {
        description = "Move window and switch to workspace " .. i,
    })
end

hl.bind(mainMod .. " + CTRL + left", hl.dsp.window.move({
    workspace = "-1",
    follow    = true,
}), {
    description = "Move window to previous workspace",
})
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.move({
    workspace = "+1",
    follow    = true,
}), {
    description = "Move window to next workspace",
})

hl.bind(mainMod .. " + PERIOD", hl.dsp.focus({
    workspace = "e+1",
}), {
    description = "Scroll workspaces forward",
})
hl.bind(mainMod .. " + COMMA", hl.dsp.focus({
    workspace = "e-1",
}), {
    description = "Scroll workspaces backward",
})
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({
    workspace = "e+1",
}), {
    description = "Scroll workspaces forward",
})
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({
    workspace = "e-1",
}), {
    description = "Scroll workspaces backward",
})
hl.bind(mainMod .. " + slash", hl.dsp.focus({
    workspace = "previous",
}), {
    description = "Switch to previous workspace",
})

hl.config({
    binds = {
        allow_workspace_cycles            = 1,
        workspace_back_and_forth          = 1,
        workspace_center_on               = 1,
        movefocus_cycles_fullscreen       = true,
        window_direction_monitor_fallback = true,
    },
})

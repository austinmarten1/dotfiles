local c = require("config.colors")

-- Simple float-only rules
local floatRules = {
    { name = "pavucontrol",   match = { class = "^(org.pulseaudio.pavucontrol)" } },
    { name = "pip",           match = { title = "^(Picture in picture)$" } },
    { name = "save-file",     match = { title = "^(Save File)$" } },
    { name = "open-file",     match = { title = "^(Open File)$" } },
    { name = "librewolf-pip", match = { class = "^(LibreWolf)$", title = "^(Picture-in-Picture)$" } },
    { name = "blueman",       match = { class = "^(blueman-manager)$" } },
    { name = "xdg-portals",   match = { class = "^(xdg-desktop-portal-gtk|xdg-desktop-portal-kde|xdg-desktop-portal-hyprland)(.*)$" } },
    { name = "polkit-agents", match = { class = "^(polkit-gnome-authentication-agent-1|hyprpolkitagent|org.org.kde.polkit-kde-authentication-agent-1)(.*)$" } },
    { name = "zenity",        match = { class = "^(zenity)$" } },
    { name = "steam-updater", match = { title = "^(Steam - Self Updater)$" } },
}
for _, r in ipairs(floatRules) do
    hl.window_rule({
        name  = r.name,
        match = r.match,
        float = true,
    })
end

-- Opacity rules
local opacityRules = {
    { name = "opacity-thunar-nemo", match = { class = "^(thunar|nemo)$" },              opacity = 0.92 },
    { name = "opacity-discord",     match = { class = "^(discord|armcord|webcord)$" },  opacity = 0.96 },
    { name = "opacity-qq-telegram", match = { title = "^(QQ|Telegram)$" },              opacity = 0.95 },
    { name = "opacity-netease",     match = { title = "^(NetEase Cloud Music Gtk4)$" }, opacity = 0.95 },
}
for _, r in ipairs(opacityRules) do
    hl.window_rule({
        name    = r.name,
        match   = r.match,
        opacity = r.opacity,
    })
end

-- Clipse floating picker
hl.window_rule({
    name  = "clipse",
    match = {
        class = "^(clipse)$",
    },
    float  = true,
    size   = "622 652",
    center = true,
})

-- Picture-in-Picture floating
hl.window_rule({
    name  = "pip-floating",
    match = {
        title = "^(Picture-in-Picture)$",
    },
    float = true,
    size  = "960 540",
    move  = "25% 25%",
})

-- Floating media windows
hl.window_rule({
    name  = "media-floating",
    match = {
        title = "^(imv|mpv|danmufloat|termfloat|nemo|ncmpcpp)$",
    },
    float = true,
    size  = "960 540",
    move  = "25% 25%",
})

-- Danmufloat pinned
hl.window_rule({
    name  = "danmufloat-pin",
    match = {
        title = "^(danmufloat)$",
    },
    pin = true,
})

-- Danmufloat / termfloat rounding
hl.window_rule({
    name  = "float-rounding",
    match = {
        title = "^(danmufloat|termfloat)$",
    },
    rounding = 5,
})

-- Terminal slide-in animation
hl.window_rule({
    name  = "term-slide",
    match = {
        class = "^(kitty|Alacritty)$",
    },
    animation = "slide right",
})

-- Firefox: disable blur
hl.window_rule({
    name  = "firefox-noblur",
    match = {
        class = "^(org.mozilla.firefox)$",
    },
    no_blur = true,
})

-- Floating windows on tiled workspaces: accent border
hl.window_rule({
    name  = "float-border",
    match = {
        float     = true,
        workspace = "w[fv1-10]",
    },
    border_size  = 2,
    border_color = c.blue,
    rounding     = 8,
})

-- Tiled windows on fullscreen workspaces
hl.window_rule({
    name  = "tiled-border",
    match = {
        float     = false,
        workspace = "f[1-10]",
    },
    border_size = 3,
    rounding    = 4,
})

-- Workspace gaps
local workspaceGaps = {
    "w[tv1-10]",
    "f[1]",
}
for _, ws in ipairs(workspaceGaps) do
    hl.workspace_rule({
        workspace = ws,
        gaps_out  = 5,
        gaps_in   = 3,
    })
end

-- Layer animations
local layerAnims = {
    { namespace = "logout_dialog", animation = "slide top" },
    { namespace = "waybar",        animation = "slide down" },

    { namespace = "wallpaper",     animation = "fade 50%" },
}
for _, l in ipairs(layerAnims) do
    hl.layer_rule({
        name  = "anim-" .. l.namespace,
        match = {
            namespace = l.namespace,
        },
        animation = l.animation,
    })
end

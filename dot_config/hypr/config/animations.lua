hl.config({
    animations = {
        enabled = true,
    },
})

-- Bezier curves (name, control point 1, control point 2)
local curves = {
    { "linear",        { 0, 0 },      { 1, 1 } },
    { "md3_standard",  { 0.2, 0 },    { 0, 1 } },
    { "md3_decel",     { 0.05, 0.7 }, { 0.1, 1 } },
    { "md3_accel",     { 0.3, 0 },    { 0.8, 0.15 } },
    { "overshot",      { 0.05, 0.9 }, { 0.1, 1.1 } },
    { "crazyshot",     { 0.1, 1.5 },  { 0.76, 0.92 } },
    { "hyprnostretch", { 0.05, 0.9 }, { 0.1, 1.0 } },
    { "menu_decel",    { 0.1, 1 },    { 0, 1 } },
    { "menu_accel",    { 0.38, 0.04 },{ 1, 0.07 } },
    { "easeInOutCirc", { 0.85, 0 },   { 0.15, 1 } },
    { "easeOutCirc",   { 0, 0.55 },   { 0.45, 1 } },
    { "easeOutExpo",   { 0.16, 1 },   { 0.3, 1 } },
    { "softAcDecel",   { 0.26, 0.26 },{ 0.15, 1 } },
    { "md2",           { 0.4, 0 },    { 0.2, 1 } },
}
for _, c in ipairs(curves) do
    hl.curve(c[1], {
        type   = "bezier",
        points = { c[2], c[3] },
    })
end

-- Animations
local anims = {
    { leaf = "windows",          speed = 3,   bezier = "md3_decel", style = "popin 60%" },
    { leaf = "windowsIn",        speed = 3,   bezier = "md3_decel", style = "popin 60%" },
    { leaf = "windowsOut",       speed = 3,   bezier = "md3_accel", style = "popin 60%" },
    { leaf = "border",           speed = 10,  bezier = "default" },
    { leaf = "fade",             speed = 3,   bezier = "md3_decel" },
    { leaf = "layersIn",         speed = 3,   bezier = "menu_decel", style = "slide" },
    { leaf = "layersOut",        speed = 1.6, bezier = "menu_accel" },
    { leaf = "fadeLayersIn",     speed = 2,   bezier = "menu_decel" },
    { leaf = "fadeLayersOut",    speed = 4.5, bezier = "menu_accel" },
    { leaf = "workspaces",       speed = 7,   bezier = "menu_decel", style = "slide" },
    { leaf = "specialWorkspace", speed = 3,   bezier = "md3_decel", style = "slidevert" },
}
for _, a in ipairs(anims) do
    hl.animation({
        leaf    = a.leaf,
        enabled = true,
        speed   = a.speed,
        bezier  = a.bezier,
        style   = a.style,
    })
end

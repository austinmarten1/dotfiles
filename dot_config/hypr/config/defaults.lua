-- Preferred programs
return {
    filemanager = "thunar",
    applauncher = "wofi --show drun",
    terminal    = "ghostty",
    capturing   = 'grim -g "$(slurp)" - | swappy -f -',
}

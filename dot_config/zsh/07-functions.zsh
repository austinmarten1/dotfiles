sed-example() {
    print "How to replace stuff at beginning of line - s/^/start/g"
    print "How to replace stuff at end of line - s/$/end/g"
    print "General Syntax - s/find/replace/g"
    print "Running multiple lines in one string syntax - s/^/start/g; s/$/end/g; s/find/replace/g"
}

mkcd() {
    mkdir -p "$1" && cd "$1"
}

extract() {
    case "$1" in
        *.tar.bz2)  tar xjf "$1"    ;;
        *.tar.gz)   tar xzf "$1"    ;;
        *.tar.xz)   tar xJf "$1"    ;;
        *.tar.zst)  tar --zstd -xf "$1" ;;
        *.tar)      tar xf "$1"     ;;
        *.bz2)      bunzip2 "$1"    ;;
        *.gz)       gunzip "$1"     ;;
        *.zip)      unzip "$1"      ;;
        *.7z)       7z x "$1"       ;;
        *.zst)      zstd -d "$1"    ;;
        *.rar)      unrar x "$1"    ;;
        *)          echo "Unknown format: $1" ;;
    esac
}

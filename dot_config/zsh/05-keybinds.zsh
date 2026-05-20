function zvm_after_init() {
    bindkey "^[[1;5C" forward-word
    bindkey "^[[1;5D" backward-word
    bindkey "^[[3~"   delete-char
    bindkey "^[[H"    beginning-of-line
    bindkey "^[[F"    end-of-line

    source /usr/share/fzf/key-bindings.zsh
    bindkey -r '^R'

    eval "$(atuin init zsh --disable-up-arrow)"
}

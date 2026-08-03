zinit wait lucid for \
    OMZP::git \
    OMZP::colored-man-pages

ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_NEX
zinit light jeffreytse/zsh-vi-mode

zinit wait lucid for \
    atload"bindkey '^[[A' history-substring-search-up; bindkey '^[[B' history-substring-search-down; bindkey -M vicmd 'k' history-substring-search-up; bindkey -M vicmd 'j' history-substring-search-down" \
        zsh-users/zsh-history-substring-search \
    atload"ZSH_AUTOSUGGEST_STRATEGY=(history completion)" \
        zsh-users/zsh-autosuggestions \
    atinit"zicompinit; zicdreplay" \
        zdharma-continuum/fast-syntax-highlighting

_gotask_comp_cache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/go-task-completion.zsh"
_helm_comp_cache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/helm-completion.zsh"
zinit wait'1' lucid for \
    atload'
        if [[ ! -f "$_gotask_comp_cache" ]] || [[ "$(command -v go-task)" -nt "$_gotask_comp_cache" ]]; then
            mkdir -p "${_gotask_comp_cache:h}"
            go-task --completion zsh > "$_gotask_comp_cache"
        fi
        source "$_gotask_comp_cache"
        compdef _go_task task
        autoload -U +X bashcompinit && bashcompinit
        complete -o nospace -C "$(command -v tofu)" tofu

        if [[ ! -f "$_helm_comp_cache" ]] || [[ "$(command -v helm)" -nt "$_helm_comp_cache" ]]; then
            mkdir -p "${_helm_comp_cache:h}"
            helm completion zsh > "$_helm_comp_cache"
        fi
        source "$_helm_comp_cache"
    ' \
    Aloxaf/fzf-tab

zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/completions"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:ls:*' fzf-preview 'eza -1 --color=always $realpath'

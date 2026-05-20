ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
if [[ ! -f "$ZINIT_HOME/zinit.zsh" ]]; then
    print -P "%F{33}Installing zinit...%f"
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME" && \
        print -P "%F{34}Done.%f" || print -P "%F{160}Failed.%f"
fi
source "$ZINIT_HOME/zinit.zsh"

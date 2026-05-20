alias ..="cd .."
alias ...="cd ../.."
alias dev="cd ~/dev/git"
alias ls="eza -G --color=auto --git --no-filesize --icons=always --no-time"
alias ll="eza -la --color=auto --git --icons=always"
alias lt="eza -T --color=auto --git --icons=always"
alias cat="bat -pp"
alias ripd="ripdrag -xbnatk"
alias vim="nvim"
alias vi="nvim"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias grep="grep --color=auto"
alias pubip="dig +short myip.opendns.com @resolver1.opendns.com | xargs -I{} echo 'Public IP: {}'"
alias encrypt="gpg --output - --armour --encrypt --recipient"
alias decrypt="gpg --output - --decrypt"
alias poggers='podman rm $(podman ps -aq) --force 2>/dev/null; podman rmi $(podman images -qa) --force 2>/dev/null; podman system reset --force'
alias oldls="command ls -CF"
alias oldcat="command cat"
alias task='go-task'
alias top='btop'
alias lg='lazygit'

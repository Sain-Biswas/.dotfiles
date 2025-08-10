# ░█▀█░█░░░▀█▀░█▀█░█▀▀░░░░░░░░░▀▀█░█▀▀░█░█
# ░█▀█░█░░░░█░░█▀█░▀▀█░░░▄▄▄░░░▄▀░░▀▀█░█▀█
# ░▀░▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░░░░░░░░░▀▀▀░▀▀▀░▀░▀

# Common Apps
alias vi="nvim"
alias vim="nvim"
alias c="clear"
alias mkdir="mkdir -p"
alias compass='mongodb-compass --ignore-additional-command-line-flags --password-store="gnome-libsecret" &'
alias code="code-insiders"

# Directory navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'

# eza
alias ls="eza -Ga"
alias ll="eza -la"
alias lt="eza -lTa --git-ignore"

# git shortcuts
alias gt="git"
alias ga="git add ."
alias gs="git status -s"
alias gc='git commit -m'
alias gac="git add . && git commit -m"
alias gtree='git log --oneline --graph --all'
alias gl="git log"
alias glog="git log --oneline"
alias gtrash="git stash --include-untracked"

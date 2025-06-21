# ░█▄█░█▀█░▀█▀░█░█░█▀▀░█▀▀░█▀█░░░░░░░░░▀▀█░█▀▀░█░█
# ░█░█░█▀█░░█░░█░█░█░█░█▀▀░█░█░░░▄▄▄░░░▄▀░░▀▀█░█▀█
# ░▀░▀░▀░▀░░▀░░▀▀▀░▀▀▀░▀▀▀░▀░▀░░░░░░░░░▀▀▀░▀▀▀░▀░▀

# Fzf colors
export FZF_DEFAULT_OPTS=" \
--style full \
--preview 'bat --color=always {}' --bind 'focus:transform-header:file --brief {}' \
--color=bg+:#36393e,bg:#101418,spinner:#ffb4ab,hl:#b9c8da \
--color=fg:#e0e2e8,header:#b9c8da,info:#d4bee6,pointer:#ffb4ab \
--color=marker:#9ccbfb,fg+:#e0e2e8,prompt:#d4bee6,hl+:#b9c8da \
--color=selected-bg:#9ccbfb \
--color=border:#8c9199,label:#e0e2e8 \
--multi"


# Aloxaf fzf - tab
zstyle ':fzf-tab:*' fzf-flags --color=bg+:#36393e,bg:#101418,spinner:#ffb4ab,hl:#b9c8da,fg:#e0e2e8,header:#b9c8da,info:#d4bee6,pointer:#ffb4ab,marker:#9ccbfb,fg+:#e0e2e8,prompt:#d4bee6,hl+:#b9c8da,selected-bg:#9ccbfb,border:#8c9199,label:#e0e2e8 --multi

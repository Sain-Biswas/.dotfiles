# ░█▄█░█▀█░▀█▀░█░█░█▀▀░█▀▀░█▀█░░░░░░░░░▀▀█░█▀▀░█░█
# ░█░█░█▀█░░█░░█░█░█░█░█▀▀░█░█░░░▄▄▄░░░▄▀░░▀▀█░█▀█
# ░▀░▀░▀░▀░░▀░░▀▀▀░▀▀▀░▀▀▀░▀░▀░░░░░░░░░▀▀▀░▀▀▀░▀░▀

# Fzf colors
export FZF_DEFAULT_OPTS=" \
--style full \
--preview 'bat --color=always {}' --bind 'focus:transform-header:file --brief {}' \
--color=bg+:#3d373d,bg:#161217,spinner:#ffb4ab,hl:#d4c0d7 \
--color=fg:#e9e0e7,header:#d4c0d7,info:#f5b7b5,pointer:#ffb4ab \
--color=marker:#e4b7f3,fg+:#e9e0e7,prompt:#f5b7b5,hl+:#d4c0d7 \
--color=selected-bg:#e4b7f3 \
--color=border:#978e97,label:#e9e0e7 \
--multi"


# Aloxaf fzf - tab
zstyle ':fzf-tab:*' fzf-flags --color=bg+:#3d373d,bg:#161217,spinner:#ffb4ab,hl:#d4c0d7,fg:#e9e0e7,header:#d4c0d7,info:#f5b7b5,pointer:#ffb4ab,marker:#e4b7f3,fg+:#e9e0e7,prompt:#f5b7b5,hl+:#d4c0d7,selected-bg:#e4b7f3,border:#978e97,label:#e9e0e7 --multi

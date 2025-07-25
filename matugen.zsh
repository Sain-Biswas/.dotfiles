# ░█▄█░█▀█░▀█▀░█░█░█▀▀░█▀▀░█▀█░░░░░░░░░▀▀█░█▀▀░█░█
# ░█░█░█▀█░░█░░█░█░█░█░█▀▀░█░█░░░▄▄▄░░░▄▀░░▀▀█░█▀█
# ░▀░▀░▀░▀░░▀░░▀▀▀░▀▀▀░▀▀▀░▀░▀░░░░░░░░░▀▀▀░▀▀▀░▀░▀

# Fzf colors
export FZF_DEFAULT_OPTS=" \
--style full \
--preview 'bat --color=always {}' --bind 'focus:transform-header:file --brief {}' \
--color=bg+:#37393e,bg:#111318,spinner:#ffb4ab,hl:#bec6dc \
--color=fg:#e2e2e9,header:#bec6dc,info:#dcbce0,pointer:#ffb4ab \
--color=marker:#aac7ff,fg+:#e2e2e9,prompt:#dcbce0,hl+:#bec6dc \
--color=selected-bg:#aac7ff \
--color=border:#8e9099,label:#e2e2e9 \
--multi"


# Aloxaf fzf - tab
zstyle ':fzf-tab:*' fzf-flags --color=bg+:#37393e,bg:#111318,spinner:#ffb4ab,hl:#bec6dc,fg:#e2e2e9,header:#bec6dc,info:#dcbce0,pointer:#ffb4ab,marker:#aac7ff,fg+:#e2e2e9,prompt:#dcbce0,hl+:#bec6dc,selected-bg:#aac7ff,border:#8e9099,label:#e2e2e9 --multi

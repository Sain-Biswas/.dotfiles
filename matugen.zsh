# ░█▄█░█▀█░▀█▀░█░█░█▀▀░█▀▀░█▀█░░░░░░░░░▀▀█░█▀▀░█░█
# ░█░█░█▀█░░█░░█░█░█░█░█▀▀░█░█░░░▄▄▄░░░▄▀░░▀▀█░█▀█
# ░▀░▀░▀░▀░░▀░░▀▀▀░▀▀▀░▀▀▀░▀░▀░░░░░░░░░▀▀▀░▀▀▀░▀░▀

# Fzf colors
export FZF_DEFAULT_OPTS=" \
--style full \
--preview 'bat --color=always {}' --bind 'focus:transform-header:file --brief {}' \
--color=bg+:#423736,bg:#1a1111,spinner:#ffb4ab,hl:#e6bdbb \
--color=fg:#f0dedd,header:#e6bdbb,info:#e3c28d,pointer:#ffb4ab \
--color=marker:#ffb3b0,fg+:#f0dedd,prompt:#e3c28d,hl+:#e6bdbb \
--color=selected-bg:#ffb3b0 \
--color=border:#a08c8b,label:#f0dedd \
--multi"


# Aloxaf fzf - tab
zstyle ':fzf-tab:*' fzf-flags --color=bg+:#423736,bg:#1a1111,spinner:#ffb4ab,hl:#e6bdbb,fg:#f0dedd,header:#e6bdbb,info:#e3c28d,pointer:#ffb4ab,marker:#ffb3b0,fg+:#f0dedd,prompt:#e3c28d,hl+:#e6bdbb,selected-bg:#ffb3b0,border:#a08c8b,label:#f0dedd --multi

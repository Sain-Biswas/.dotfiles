# ░█▄█░█▀█░▀█▀░█░█░█▀▀░█▀▀░█▀█░░░░░░░░░▀▀█░█▀▀░█░█
# ░█░█░█▀█░░█░░█░█░█░█░█▀▀░█░█░░░▄▄▄░░░▄▀░░▀▀█░█▀█
# ░▀░▀░▀░▀░░▀░░▀▀▀░▀▀▀░▀▀▀░▀░▀░░░░░░░░░▀▀▀░▀▀▀░▀░▀

# Fzf colors
export FZF_DEFAULT_OPTS=" \
--style full \
--preview 'bat --color=always {}' --bind 'focus:transform-header:file --brief {}' \
--color=bg+:#3a383e,bg:#141318,spinner:#ffb4ab,hl:#c9c3dc \
--color=fg:#e6e1e9,header:#c9c3dc,info:#edb8cc,pointer:#ffb4ab \
--color=marker:#cabeff,fg+:#e6e1e9,prompt:#edb8cc,hl+:#c9c3dc \
--color=selected-bg:#cabeff \
--color=border:#938f99,label:#e6e1e9 \
--multi"


# Aloxaf fzf - tab
zstyle ':fzf-tab:*' fzf-flags --color=bg+:#3a383e,bg:#141318,spinner:#ffb4ab,hl:#c9c3dc,fg:#e6e1e9,header:#c9c3dc,info:#edb8cc,pointer:#ffb4ab,marker:#cabeff,fg+:#e6e1e9,prompt:#edb8cc,hl+:#c9c3dc,selected-bg:#cabeff,border:#938f99,label:#e6e1e9 --multi

# ░█▄█░█▀█░▀█▀░█░█░█▀▀░█▀▀░█▀█░░░░░░░░░▀▀█░█▀▀░█░█
# ░█░█░█▀█░░█░░█░█░█░█░█▀▀░█░█░░░▄▄▄░░░▄▀░░▀▀█░█▀█
# ░▀░▀░▀░▀░░▀░░▀▀▀░▀▀▀░▀▀▀░▀░▀░░░░░░░░░▀▀▀░▀▀▀░▀░▀

# Fzf colors
export FZF_DEFAULT_OPTS=" \
--style full \
--preview 'bat --color=always {}' --bind 'focus:transform-header:file --brief {}' \
--color=bg+:#3a383e,bg:#141318,spinner:#ffb4ab,hl:#c9c3dc \
--color=fg:#e5e1e9,header:#c9c3dc,info:#ecb8cd,pointer:#ffb4ab \
--color=marker:#c8bfff,fg+:#e5e1e9,prompt:#ecb8cd,hl+:#c9c3dc \
--color=selected-bg:#c8bfff \
--color=border:#938f99,label:#e5e1e9"

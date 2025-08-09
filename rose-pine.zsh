# Fzf colors
export FZF_DEFAULT_OPTS=" \
--style full \
--preview 'bat --color=always {}' --bind 'focus:transform-header:file --brief {}' \
--color=fg:#908caa,bg:#191724,hl:#ebbcba \
--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba \
--color=border:#403d52,header:#31748f,gutter:#191724 \
--color=spinner:#f6c177,info:#9ccfd8 \
--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa \
--multi"


# Aloxaf fzf - tab
zstyle ':fzf-tab:*' fzf-flags --color=fg:#908caa,bg:#191724,hl:#ebbcba,fg+:#e0def4,bg+:#26233a,hl+:#ebbcba,border:#403d52,header:#31748f,gutter:#191724,spinner:#f6c177,info:#9ccfd8,pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa --multi

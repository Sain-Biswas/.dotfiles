# ░█▄█░█▀█░▀█▀░█░█░█▀▀░█▀▀░█▀█░░░░░░░░░▀▀█░█▀▀░█░█
# ░█░█░█▀█░░█░░█░█░█░█░█▀▀░█░█░░░▄▄▄░░░▄▀░░▀▀█░█▀█
# ░▀░▀░▀░▀░░▀░░▀▀▀░▀▀▀░▀▀▀░▀░▀░░░░░░░░░▀▀▀░▀▀▀░▀░▀

# Fzf colors
export FZF_DEFAULT_OPTS=" \
--style full \
--preview 'bat --color=always {}' --bind 'focus:transform-header:file --brief {}' \
--color=bg+:{{colors.surface_bright.default.hex}},bg:{{colors.surface.default.hex}},spinner:{{colors.error.default.hex}},hl:{{colors.secondary.default.hex}} \
--color=fg:{{colors.on_surface.default.hex}},header:{{colors.secondary.default.hex}},info:{{colors.tertiary.default.hex}},pointer:{{colors.error.default.hex}} \
--color=marker:{{colors.primary.default.hex}},fg+:{{colors.on_surface.default.hex}},prompt:{{colors.tertiary.default.hex}},hl+:{{colors.secondary.default.hex}} \
--color=selected-bg:{{colors.primary.default.hex}} \
--color=border:{{colors.outline.default.hex}},label:{{colors.on_surface.default.hex}} \
--multi"


# Aloxaf fzf - tab
zstyle ':fzf-tab:*' fzf-flags --color=bg+:{{colors.surface_bright.default.hex}},bg:{{colors.surface.default.hex}},spinner:{{colors.error.default.hex}},hl:{{colors.secondary.default.hex}},fg:{{colors.on_surface.default.hex}},header:{{colors.secondary.default.hex}},info:{{colors.tertiary.default.hex}},pointer:{{colors.error.default.hex}},marker:{{colors.primary.default.hex}},fg+:{{colors.on_surface.default.hex}},prompt:{{colors.tertiary.default.hex}},hl+:{{colors.secondary.default.hex}},selected-bg:{{colors.primary.default.hex}},border:{{colors.outline.default.hex}},label:{{colors.on_surface.default.hex}} --multi

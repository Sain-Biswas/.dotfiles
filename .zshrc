# zinit

# set ZINIT_HOME, directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# download zinit if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# source/load zinit
source "${ZINIT_HOME}/zinit.zsh"

# zinit end


# add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
# add in zsh plugins end


# load completions
autoload -U compinit && compinit
zinit cdreplay -q
# load completions end


# keybindings
bindkey -v
set -o vi

bindkey -M viins '^e' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
# keybindings end


# history
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
# history end


# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -a --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -a --color=always $realpath'
# completion styling end


# shell integration
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
# shell integration end


# vim editing
export EDITOR='nvim'
export VISUAL='nvim'
# vim editing end


# source external files
source $HOME/.dotfiles/zsh/alias.zsh
source $HOME/.dotfiles/zsh/matugen.zsh


# paths
export PATH=$HOME/.local/bin:$PATH


# node version manager
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# node version manager end


# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# bun completion
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
# bun completion end


# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# bun end


# initiate starship
eval "$(starship init zsh)"

setopt autocd extendedglob
unsetopt beep
bindkey -v

# Add custom_completions_dir to FPATH
custom_completions_dir="$XDG_DATA_HOME/zsh/completions"
if [[ ":$FPATH:" != *":$custom_completions_dir:"* ]]; then
    FPATH="$custom_completions_dir:$FPATH"
fi
# --  Create the directory if it doesn't exist
mkdir -p "$custom_completions_dir"

# Antidote
ANTIDOTE="$XDG_DATA_HOME/zsh/.antidote"
# -- Ensure Antidote is installed
if [[ ! -d "$ANTIDOTE" ]]; then
  echo "Antidote not found at $ANTIDOTE, cloning..."
  git clone --depth=1 https://github.com/mattmc3/antidote.git $ANTIDOTE
fi
# -- Load plugins
source "$ANTIDOTE/antidote.zsh"
antidote load

#  Setup exa
typeset -ag eza_params
eza_params=(
  '--git' '--icons' '--group' '--group-directories-first'
  '--time-style=relative' '--color-scale=all' '--color-scale-mode=fixed'
)

[[ ! -z $_EZA_PARAMS ]] && eza_params=($_EZA_PARAMS)

alias ls='eza $eza_params'
alias l='eza --git-ignore $eza_params'
alias ll='eza --all --all --long $eza_params'
alias lg='eza --all --all --long --git-repos $eza_params'
alias llm='eza --all --header --long --sort=modified $eza_params'
alias la='eza -lbhHigUmuSa'
alias lx='eza -lbhHigUmuSa@'
alias lt="eza --all --long --tree --git-repos '--ignore-glob=**/.git' $eza_params"
alias tree='eza --tree $eza_params'

# Other aliases

alias cat='bat --color=always'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias brain='nvim ~/brain.md'
alias g='git'
alias z..='exec zsh'
alias z.ed='nvim $ZDOTDIR/.zshrc'
alias gty.ed='nvim $XDG_CONFIG_HOME/ghostty/config'
alias gty.keys='ghostty +list-keybinds | column -t -s = -H 1 | fzf --style=minimal --height=10 --info=hidden --border --border-label="ghostty keys" --border-label-pos=4'
alias zyp='sudo zypper --color'

# pnpm
export PNPM_HOME="/home/tripp/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Setup starship
source <(starship init zsh)
# Setup fzf
source <(fzf --zsh)


setopt autocd extendedglob
unsetopt beep
bindkey -v
#export KEYTIMEOUT=1  # Optional: makes mode switching faster

## Completion Configuration
zstyle ':completion:*:git-checkout:*' sort false # disable sort when completing `git checkout`
zstyle ':completion:*:descriptions' format '[%d]' # set descriptions format to enable group support
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # set list-colors to enable filename colorizing
zstyle ':completion:*' menu no # force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath' # preview directory's content with eza when completing cd
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept # custom fzf flags
zstyle ':fzf-tab:*' switch-group '<' '>' # switch group using `<` and `>`

# Setup fzf
source <(fzf --zsh)

# Antidote
ANTIDOTE="$XDG_DATA_HOME/zsh/.antidote"
# -- Ensure Antidote is installed
[[ -e "$ANTIDOTE" ]] || git clone --depth=1 https://github.com/mattmc3/antidote.git $ANTIDOTE

# -- Initialize Antidote
source "$ANTIDOTE/antidote.zsh"
source <(antidote init)

# -- Load plugins
antidote bundle romkatv/zsh-bench kind:path
antidote bundle zsh-users/zsh-completions kind:fpath path:src
antidote bundle zsh-users/zsh-autosuggestions
antidote bundle Aloxaf/fzf-tab
antidote bundle zdharma-continuum/fast-syntax-highlighting kind:defer
antidote bundle belak/zsh-utils path:history
antidote bundle belak/zsh-utils path:completion

#  Setup exa
typeset -ag eza_params
eza_params=(
  '--icons' '--group' '--group-directories-first'
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
alias zg='lazygit'

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

alias v='nvim'
alias vn='nvim -u NONE'
alias vk='NVIM_APPNAME=kickstart.nvim nvim'

# pnpm
export PNPM_HOME="/home/tripp/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Autoload functions
for f in $ZDOTDIR/functions/*; do
  autoload $f
done

# Source other environment files
. "$HOME/.deno/env"
. "$HOME/.cargo/env"

if [[ "$tty" == "/dev/pts/0" ]]; then
    fastfetch
fi

# Setup prompt
function set_win_title(){
    print -Pn "\e]0;[pty/$(basename $(tty))] ${PWD/#$HOME/~}\a"
}
precmd_functions+=(set_win_title)

source <(starship init zsh)
#source <(oh-my-posh init zsh --config "$XDG_CONFIG_HOME/omp/themes/tripp-pure.toml")
#source "$XDG_CONFIG_HOME/omp/posh-vi-prompt.zsh"

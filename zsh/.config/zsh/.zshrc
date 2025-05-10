setopt autocd extendedglob
unsetopt beep
bindkey -v
export KEYTIMEOUT=1  # Optional: makes mode switching faster

# ---------------------------------------------------------

source "$ZDOTDIR/.zstyle"
source <("$HOME/.local/bin/mise" activate zsh)
source <(fzf --zsh)

# ---------------------------------------------------------

fpath=("$ZDOTDIR/functions"  "$XDG_DATA_HOME/zsh/completions" $fpath)
autoload -Uz ${ZDOTDIR}/functions/*(:t)

# ---------------------------------------------------------

ANTIDOTE="$XDG_DATA_HOME/zsh/.antidote"
# -- Ensure Antidote is installed
[[ -e "$ANTIDOTE" ]] || git clone --depth=1 https://github.com/mattmc3/antidote.git $ANTIDOTE

# -- Initialize Antidote
source "$ANTIDOTE/antidote.zsh"
source <(antidote init)

# -- Load plugins
antidote bundle romkatv/zsh-bench kind:path
antidote bundle nikevsoft/tmux-sessionizer
antidote bundle zsh-users/zsh-completions kind:fpath path:src
antidote bundle zsh-users/zsh-autosuggestions
antidote bundle Aloxaf/fzf-tab
antidote bundle zdharma-continuum/fast-syntax-highlighting kind:defer
antidote bundle belak/zsh-utils path:history
antidote bundle belak/zsh-utils path:completion

# ---------------------------------------------------------

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
alias tree="eza --tree '--ignore-glob=**/*.git' $eza_params"

# ---------------------------------------------------------

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias g='git'
alias z..='exec zsh && source ~/.zshenv'
alias z.ed='nvim $ZDOTDIR/.zshrc ~/.zshenv'

alias gty.ed='nvim $XDG_CONFIG_HOME/ghostty/config'
alias gty.keys='ghostty +list-keybinds | column -t -s = -H 1 | fzf --style=minimal --height=10 --info=hidden --border --border-label="ghostty keys" --border-label-pos=4'

alias zyp='sudo zypper --color'
alias f.p='fzf --preview "bat --color=always {}"'
alias brain='nvim ~/brain.md'

alias v='nvim'
alias vn='nvim -u NONE'
alias vk='NVIM_APPNAME=kickstart.nvim nvim'

# -- Also see functions d.adopt and d.unlink in ~/.config/zsh/functions/
alias d.stow='stow -d ~/.dotfiles -t ~'

alias cat='bat --color=always'
alias zg='lazygit'

#----------------------------------------------------------

function set_win_title(){
    print -Pn "\e]0;[pty/$(basename $(tty))] ${PWD/#$HOME/~}\a"
}
precmd_functions+=(set_win_title)
source <(starship init zsh)
# -- OSC 133 Compat
PS1=$'%{\e]133;P;k=i\a%}'$PS1$'%{\e]133;B\a\e]122;> \a%}'
PS2=$'%{\e]133;P;k=s\a%}'$PS2$'%{\e]133;B\a%}'

#source <(oh-my-posh init zsh --config "$XDG_CONFIG_HOME/omp/themes/tripp-pure.toml")
#source "$XDG_CONFIG_HOME/omp/posh-vi-prompt.zsh"

# ---------------------------------------------------------

if [[ "$tty" == "/dev/pts/0" ]]; then
    fastfetch
fi
eval "$(gh copilot alias -- zsh)"

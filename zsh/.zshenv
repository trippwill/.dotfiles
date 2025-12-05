#! /usr/bin/env zsh
# shellcheck shell=bash
# ~/.zshenv

# Set XDG directories if not already defined.
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
# Tell zsh to use the XDG-compliant config directory.
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export CODEX_HOME="${XDG_CONFIG_HOME}/codex"

export TERMINAL="ghostty"
export NVIM_LATEST="${XDG_DATA_HOME}/mise/installs/neovim/latest/nvim-linux-x86_64/bin/nvim"

# Set the default editor to nvim
export EDITOR="$NVIM_LATEST"
export VISUAL="$NVIM_LATEST"

# Set the default pager to less
export PAGER="less"
export LESS="-R -F -X"

# Set the go paths
export GOPATH="${XDG_DATA_HOME}/go"
export GOBIN="${GOPATH}/bin"
export GOCACHE="${XDG_CACHE_HOME}/go-build"

export TMUX_SESSIONIZER_DIRS="$HOME/repos $HOME/.config $HOME/dev"
export TMUX_SESSIONIZER_BIND="C-f"
export TMUX_SESSIONIZER_DEPTH=2

export PNPM_HOME="/home/tripp/.local/share/pnpm"

export PATH="$HOME/.local/bin:$GOBIN:$PNPM_HOME:$PATH"

# opencode
export PATH=/home/tripp/.opencode/bin:$PATH

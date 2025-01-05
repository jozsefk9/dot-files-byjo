#!/usr/bin/bash
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Endeavour OS Cinnamon 05jan2025 1014

# If not running interactively, don't do anything
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTFILESIZE=10000
export HISTSIZE=500

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=erasedups:ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# append to the history file, don't overwrite it
shopt -s histappend
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# Set LS_COLORS environment by Deepin
if [[ ("$TERM" = *256color || "$TERM" = screen* || "$TERM" = xterm* ) && -f /etc/lscolor-256color ]]; then
    eval $(dircolors -b /etc/lscolor-256color)
else
    eval $(dircolors)
fi

# User specific environment
#if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:$HOME/bin/btop/bin:$HOME/bin/floorp:$HOME/bin/betterbird:$HOME/bin/kitty/bin:" ]]; then
#    PATH="$HOME/.local/bin:$HOME/bin:$HOME/bin/btop/bin:$HOME/bin/floorp:$HOME/bin/betterbird:$HOME/bin/kitty/bin:$PATH"
#fi
#export PATH

# new PATH dec2024
export PATH=~/bin:$PATH
#export PATH=~/bin/cudatext/QT6:$PATH # CUDATEXT
#export PATH=~/bin/floorp:$PATH # FLOORP
#export PATH=~/bin/WebStorm/bin:$PATH # WEBSTORM
#export PATH=~/.local/bin:$PATH

# FZF
eval "$(fzf --bash)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Zoxide
eval "$(zoxide init bash)"

[[ -f ~/.bashrc-personal ]] && . ~/.bashrc-personal

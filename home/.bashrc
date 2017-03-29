# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Enable VI mode
set -o vi
# ReEnable CTRL-L as clearscreen
bind -m vi-insert "\C-l":clear-screen

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

alias ll='ls -al'
alias la='ls -A'
alias l='ls -alF'
alias dir='ls -alh'
alias vi='vim'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

export VISUAL=vim
export EDITOR="$VISUAL"
export SHELL="/bin/bash"

#!/bin/sh
# -----------------------------------------------------------------------------
# Exports & PATH Variable
# -----------------------------------------------------------------------------

export PATH="~/bin:$PATH"
export ZSH=$HOME/.oh-my-zsh

# -----------------------------------------------------------------------------
# ZSH Settings
# -----------------------------------------------------------------------------

# Tab Completion
autoload -U compinit
compinit

# Better Tabbing Styles
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

ZSH_THEME=robbyrussell

# Enable VI mode
set -o vi

plugins=(git)

# Turn off auto update
# http://stackoverflow.com/questions/11378607/oh-my-zsh-disable-would-you-like-to-check-for-updates-prompt
DISABLE_AUTO_UPDATE=true

# show completion menu when number of options is at least 2
zstyle ':completion:*' menu select=2

source $ZSH/oh-my-zsh.sh

# -----------------------------------------------------------------------------
# Shell Settings
# -----------------------------------------------------------------------------

set editing-mode vi

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^[[Z' reverse-menu-complete

unsetopt  nomatch # no error if glob fails to expand (scp fix)

# HISTORY
setopt    INC_APPEND_HISTORY  # Append history file immediately
setopt    append_history # Allow multiple terminal sessions to all append to one zsh command history
setopt    HIST_IGNORE_SPACE
# HIST_REDUCE_BLANKS corrupts history.
# https://bugs.launchpad.net/ubuntu/+source/zsh/+bug/1334858
unsetopt  HIST_REDUCE_BLANKS
setopt    HIST_IGNORE_ALL_DUPS
setopt    EXTENDED_HISTORY
setopt    hist_expire_dups_first # when trimming history, lose oldest duplicates first

# Sounds
unsetopt  BEEP                # No beeps on error
unsetopt  HIST_BEEP           # No history beeps
unsetopt  LIST_BEEP           # No list beeps

# COMPLETION
setopt always_to_end # When completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word # Allow completion from within a word/phrase

# PROMPT
setopt prompt_subst # Enable parameter expansion, command substitution, and arithmetic expansion in the prompt
unsetopt correct_all

# -----------------------------------------------------------------------------
# Import files
# -----------------------------------------------------------------------------

if [ -f $HOME/.zsh_profile ]; then
  source $HOME/.zsh_profile
fi

source $HOME/.aliases

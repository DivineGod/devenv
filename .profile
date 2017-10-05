# Bash setup

## Enable vi mode
set -o vi

## Case-insensitive bash completion
bind "set completion-ignore-case on"

## No need to press tab twice if no single match
bind "set show-all-if-ambiguous on"

## Enable color by default
export CLICOLOR=1

## Color constants for convenience
BLACK="\e[0;30m"
RED="\e[0;31m"
GREEN="\e[0;32m"
YELLOW="\e[0;33m"
BLUE="\e[0;34m"
PURPLE="\e[0;35m"
CYAN="\e[0;36m"
NORMAL="\e[0;37m"
DEFAULT="\e[0m"

## Bash prompt
export PS1='\e[0;31m\w \e[0;32m$(jobs | wc -l | grep -v 0 | xargs) \e[0;31m${STY} \e[0;35m${WINDOW}\e[0m\n\$ '

# Python

## Don't create .pyc files
export PYTHONDONTWRITEBYTECODE=1

alias serve='python -m SimpleHTTPServer'

# Git
alias st='git status'
alias co='git checkout'

PRETTY="%C(yellow)%h %C(blue)%s%C(auto)%d %n        %an (%ar) %n"
alias log="git log --all --pretty='$PRETTY' --graph"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


export PATH="$HOME/.cargo/bin:$PATH"

export PATH="/Users/divinegod/homebrew/bin:$PATH"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# added by Anaconda3 4.4.0 installer
export PATH="/anaconda/bin:$PATH"

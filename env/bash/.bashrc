[[ $- != *i* ]] && return

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
shopt -s checkwinsize
shopt -s globstar

if [[ -f "$HOME/.bash_env" ]]; then
    source "$HOME/.bash_env"
fi
if [[ -f "$HOME/.bash_aliases" ]]; then
    source "$HOME/.bash_aliases"
fi

. "$HOME/.cargo/env"

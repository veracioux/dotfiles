
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias term='alacritty' # The currently preferred terminal emulator
alias rm='rm -i'
alias mv='mv -i'
alias vim='nvim'

# Prompt style
PS1='\[\e[1;36m\]\u\[\e[1;31m\]@\[\e[1;34m\]\h \[\e[1;32m\]\W \[\e[1;31m\]\$ \[\e[0;32m\]\[\e[0m\]'

# Shell options
shopt -s extglob
shopt -s autocd
shopt -s globstar
unset HISTFILE

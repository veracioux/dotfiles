# Prompt style
PS1='\[\e[1;36m\]\u\[\e[1;31m\]@\[\e[1;34m\]\h \[\e[1;32m\]\W \[\e[1;31m\]\$ \[\e[0;32m\]\[\e[0m\]'

source ~/.alias
source ~/.alias-tmp
source ~/.alias-gui
source ~/.alias-gui-tmp

# Shell options
shopt -s extglob
shopt -s autocd
shopt -s globstar
unset HISTFILE

export SHELL='/usr/bin/fish'

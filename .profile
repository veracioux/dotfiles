shopt -s globstar

export QT_QPA_PLATFORMTHEME=gtk2
export \
PATH=$PATH:~/scripts/**/:~/.local/bin:~/.pyenv/versions/3.8.3/bin:/opt/anaconda/bin
export MAKEFLAGS='-j4'
export GPG_TTY=$(tty)

SHELL='fish'

prompt() {
    echo -ne "\033[1;94m$TUTERM_NAME \033[1;35m$(pwd | sed "s:$HOME:~:")\033[0;33m $\033[0m "
}

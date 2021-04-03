#!/usr/bin/env sh

pacman -S gvim fzf
yay -S boxes
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

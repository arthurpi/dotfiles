#!/bin/sh

git clone htpps://github.com/gmarik/vundle ~/.vim/bundle/Vundle.vim<br />
vim +PluginInstall +qall
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/gvimrc ~/.gvimrc
ln -s ~/.dotfiles/vim ~/.vim

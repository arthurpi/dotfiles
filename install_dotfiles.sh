#!/bin/sh

ln -s config $HOME/.config
ln -s vim $HOME/.vim
ln -s Xdefaults $HOME/.Xdefaults
ln -s bashrc $HOME/.bashrc
ln -s conkyrc $HOME/.conkyrc
ln -s ctags $HOME/.ctags
ln -s gtkrc-2.0 $HOME/.gtkrc-2.0
ln -s gvimrc $HOME/.gvimrc
ln -s inputrc $HOME/.inputrc
ln -s vimrc $HOME/.vimrc
ln -s xinitrc $HOME/.xinitrc
ln -s xmodmad $HOME/.xmodmap
ln -s xsession $HOME/.xsession

git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

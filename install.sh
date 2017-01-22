#!/bin/sh

if [ $(basename $PWD) != .dotfiles ]; then
    echo "You must run this script from the .dotfiles folder"
    exit
fi

ln -s $(pwd)/bashrc $HOME/.bashrc
ln -s $(pwd)/inputrc $HOME/.inputrc

ln -s $(pwd)/gitconfig $HOME/.gitconfig

ln -s $(pwd)/xinitrc $HOME/.xinitrc
ln -s $(pwd)/Xdefaults $HOME/.Xdefaults
ln -s $(pwd)/xbindkeysrc $HOME/.xbindkeysrc
ln -s $(pwd)/tdm $HOME/.tdm

ln -s $(pwd)/tmux.conf $HOME/.tmux.conf

ln -s $(pwd)/vim/vim $HOME/.vim
ln -s $(pwd)/vim/vimrc $HOME/.vimrc
ln -s $(pwd)/vim/gvimrc $HOME/.gvimrc
ln -s $(pwd)/ctags $HOME/.ctags

ln -s $(pwd)/conky/conkyrc_text $HOME/.conkyrc
ln -s $(pwd)/gtkrc-2.0 $HOME/.gtkrc-2.0

git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# git clone tmux resurect

#!/bin/sh

# copied from https://github.com/repzret/dotfiles/blob/master/install.sh
# thanks!

echo "Cloning repos"
git submodule update --init --recursive

for file in dot.*; do
    name=${file/dot/}
    echo "Installing $name";
    ln -snFi `pwd`/$file ~/$name
done

read -p "Do you want to install xorg related configurations? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    cd x
    ./install.sh
    cd -
fi

echo "Installing vim bundles"
vim +BundleInstall +qall

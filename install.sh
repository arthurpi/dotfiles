#!/bin/bash

# copied from https://github.com/repzret/dotfiles/blob/master/install.sh
# thanks!

for file in dot.*; do
    name=${file/dot/}
    echo "Installing $name";
    ln -snFi `pwd`/$file ~/$name
done

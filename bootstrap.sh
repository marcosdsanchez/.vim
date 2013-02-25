#!/bin/bash

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone git://gist.github.com/1630581.git ~/.fonts/ttf-dejavu-powerline

ln -s $HOME/.vim/vimrc $HOME/.vimrc
ln -s $HOME/.vim/gvimrc $HOME/.gvimrc
mkdir -p $HOME/.vim/tmp/{backup,swap}
mkdir -p $HOME/.vim/undo
vim +BundleInstall +qa

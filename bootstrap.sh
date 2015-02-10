#!/bin/bash

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git://gist.github.com/1630581.git ~/.fonts/ttf-dejavu-powerline
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

mkdir -p $HOME/.vim/colors
mkdir -p $HOME/.vim/tmp/{backup,swap}
mkdir -p $HOME/.vim/undo

ln -s ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/solarized.vim
ln -s $DIR/vimrc $HOME/.vimrc
ln -s $DIR/gvimrc $HOME/.gvimrc
ln -s $DIR/bundles $HOME/.vim/bundle/bundles

vim +PluginInstall +qall

#!/bin/bash

git clone git://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git://github.com/powerline/fonts.git /tmp/airline-fonts
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized

mkdir -p $HOME/.vim/colors
mkdir -p $HOME/.vim/tmp/{backup,swap}
mkdir -p $HOME/.vim/undo

sh /tmp/airline-fonts/install.sh

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
ln -s ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/solarized.vim
ln -s $DIR/vimrc $HOME/.vimrc
ln -s $DIR/gvimrc $HOME/.gvimrc

#Nvim
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s $HOME/.vim $XDG_CONFIG_HOME/nvim
ln -s $HOME/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

vim +PluginInstall +qall

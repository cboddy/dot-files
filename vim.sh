#!/bin/bash

##
## vim
##
cp vim/.vimrc ~/.vimrc
cp -r vim/.vim ~/
 
##
## install Vundle
##
git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim

##
## install freshly added plugins
##
vim +PluginInstall +qall


##
## ensure go plugin stuff is installed
##
vim -E -c GoInstallBinaries -c q

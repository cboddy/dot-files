#!/bin/bash

##
## vim
##
cp vim/.vimrc ~/.vimrc
cp -r vim/.vim ~/
sud apt-get -y install vim-python-jedi 
#
git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall
#ensure go plugin  stuff is installed
vim -E -c GoInstallBinaries -c q

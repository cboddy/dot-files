#!/bin/bash

PACKAGES=(python openssh vim screen fluxbox clementime thunderbird firefox terminator pidgin tomboy xchat arandr deluge liferea git cifs-utils samba curl gitk openssh-sever visualvm zip golang-go)

sudo pacman -Syy 
for package in "${PACKAGES[@]}"
do
    pacman -S $package
done

cat bash/.bashrc >> ~/.bashrc

cp vim/.vimrc ~/.vimrc
cp vim/.vim ~/

vim +PluginInstall +qall

mkdir ~/.fluxbox

cp fluxbox/* ~/.fluxbox/

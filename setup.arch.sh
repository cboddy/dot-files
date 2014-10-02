#!/bin/bash

PACKAGES=(python openssh vim screen fluxbox clementime thunderbird firefox terminator pidgin tomboy xchat arandr deluge liferea git cifs-utils samba curl)

sudo pacman -Syy 
for package in "${PACKAGES[@]}"
do
    pacman -S $package
done

cat bash/.bashrc >> ~/.bashrc

cp vim/.vimrc ~/.vimrc
cp vim/.vim ~/

cp fluxbox/menu ~/.fluxbox/

cp fluxbox/init ~/.fluxbox/


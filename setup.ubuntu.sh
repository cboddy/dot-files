#!/bin/bash

PACKAGES=(python openssh vim screen fluxbox clementime thunderbird firefox terminator pidgin tomboy xchat arandr deluge liferea git)

sudo apt-get update
for package in "${PACKAGES[@]}"
do
    sudo apt-get install $package
done

cat bash/.bashrc >> ~/.bashrc

cp vim/.vimrc ~/.vimrc
cp vim/.vim ~/

cp fluxbox/menu ~/.fluxbox/

cp fluxbox/init ~/.fluxbox/

mkdir -p ~/.vim/{ftdetect,indent,syntax} && for d in ftdetect indent syntax ; do wget --no-check-certificate -O ~/.vim/$d/scala.vim https://raw.githubusercontent.com/scala/scala-dist/master/tool-support/src/vim/$d/scala.vim; done

#!/bin/bash

PACKAGES=(python openssh vim screen fluxbox clementime thunderbird firefox terminator pidgin tomboy xchat arandr deluge liferea git fpm2 cifs-utils samba vlc-nox default-jdk steam virtualbox-qt curl gitk openssh-server visualvm)

sudo apt-get update
for package in "${PACKAGES[@]}"
do
    sudo apt-get install $package
done

##
##scala
##

wget www.scala-lang.org/files/archive/scala-2.11.1.deb
sudo dpkg -i scala-2.11.1.deb
 
# sbt installation
wget wget http://scalasbt.artifactoryonline.com/scalasbt/sbt-native-packages/org/scala-sbt/sbt/0.13.1/sbt.deb
sudo dpkg -i sbt.deb
## aliases

cat bash/.bashrc >> ~/.bashrc

##
## vim
##
cp vim/.vimrc ~/.vimrc
cp vim/.vim ~/

#
# vim file type plugins
#
mkdir -p ~/.vim/{ftdetect,indent,syntax} && for d in ftdetect indent syntax ; do wget --no-check-certificate -O ~/.vim/$d/scala.vim https://raw.githubusercontent.com/scala/scala-dist/master/tool-support/src/vim/$d/scala.vim; done

##
## fluxbox
##

mkdir ~/.fluxbox

cp fluxbox/menu ~/.fluxbox/
cp fluxbox/init ~/.fluxbox/
echo "Mod1 1 :RootMenu" >> ~/.fluxbox/keys

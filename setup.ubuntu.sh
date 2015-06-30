#!/bin/bash

##
##PPA for Oracle Java 8 installer
##

sudo apt-add-repository ppa:webupd8team/java

##
## List of packages to install
##
PACKAGES=(python openssh vim screen fluxbox clementime thunderbird firefox terminator pidgin tomboy xchat arandr deluge liferea git fpm2 cifs-utils samba vlc-nox default-jdk steam virtualbox-qt curl gitk openssh-server visualvm node npm zip oracle-java8-installer golang-go python-pip)

sudo apt-get update
for package in "${PACKAGES[@]}"
do
    sudo apt-get -y install $package
done

##
## pip installs
##
sudo pip install gcalcli

##
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
cp -r vim/.vim ~/

vim +PluginInstall +qall
#ensure go plugin  stuff is installed
vim -E -c GoInstallBinaries -c q
##
## fluxbox
##

mkdir ~/.fluxbox

cp fluxbox/* ~/.fluxbox/


##
## node stuff
##
sudo npm install -g jshint

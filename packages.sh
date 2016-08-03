#!/bin/bash

##
## PPA for SBT
##
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823

##
## List of packages to install
##
PACKAGES=(i3 python openssh vim screen terminator git cifs-utils samba vlc curl gitk openssh-server visualvm node npm zip golang-go python-pip gnupg zsh mdadm openjdk-8 pylint hg vim-python-jedi tree)

for package in "${PACKAGES[@]}"
do
    sudo apt-get -y install $package
done

##
##
##scala
##

wget www.scala-lang.org/files/archive/scala-2.11.1.deb
sudo dpkg -i scala-2.11.1.deb
 
# sbt installation
sudo apt-get update
sudo apt-get install sbt

##
## node stuff
##
sudo npm install -g jshint

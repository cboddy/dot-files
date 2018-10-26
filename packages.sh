#!/bin/bash

##
## PPA for SBT
##
#echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
#sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823



## f.lux
## https://github.com/xflux-gui/fluxgui
sudo add-apt-repository ppa:nathan-renniewaldock/flux

##
## List of packages to install
##
PACKAGES=(i3 python openssh vim screen terminator git cifs-utils samba vlc curl gitk openssh-server visualvm node npm zip golang-go python-pip gnupg zsh mdadm openjdk-8 pylint hg vim-python-jedi tree g++ mutt-patched anki linux-tools feh scala sbt lynx xclip virtualenvwrapper python-dev tmux exuberant-ctags fluxgui autossh cron rsync tor gnupg1 blueman)

sudo apt-get update
 
for package in "${PACKAGES[@]}"
do
    sudo apt-get -y install $package
done

##
## python stuff
##
pip install --user autopep8 flake8 pipenv pyotp

##
## node stuff
##
#sudo npm install -g jshint

#!/bin/bash

SERVER_PACKAGES=(python openssh vim terminator git cifs-utils samba curl openssh-server visualvm node npm zip golang-go python-pip gnupg zsh mdadm openjdk-8 openjfx pylint hg vim-python-jedi tree g++ mutt-patched linux-tools scala sbt lynx virtualenvwrapper python-dev tmux exuberant-ctags autossh cron rsync gnupg1)

DESKTOP_PACKAGES=(i3 blueman ubuntu-restricted-extras fluxgui xclip vlc gitk anki feh tor)

if [ ! -z $INCLUDE_DESKTOP];
then
    ## f.lux
    ## https://github.com/xflux-gui/fluxgui
    sudo add-apt-repository ppa:nathan-renniewaldock/flux
fi

##
## update package cache
##
sudo apt-get update

##
## server packages
##
echo "INSTALLING SERVER PACKAGES"
for package in "${SERVER_PACKAGES[@]}"
do
    sudo apt-get -y install $package
done

##
## python stuff
##
echo "INSTALLING PIP PACKAGES"
pip install --user autopep8 flake8 pipenv pyotp isort

##
## node stuff
##
#sudo npm install -g jshint

##
## Desktop packages
##
if [ -z $INCLUDE_DESKTOP];
then
    echo "SKIPPING DESKTOP PACKAGES"
else
    echo "INSTALLING DESKTOP PACKAGES"
    for package in "${DESKTOP_PACKAGES[@]}"
    do
        sudo apt-get -y install $package
    done
fi

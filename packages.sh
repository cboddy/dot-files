#!/bin/bash

SERVER_PACKAGES=(python openssh vim git cifs-utils samba curl openssh-server visualvm node npm zip golang-go python3-pip gnupg zsh mdadm openjdk-21 openjfx pylint hg tree g++ mutt-patched linux-tools scala sbt lynx virtualenvwrapper python-dev tmux exuberant-ctags autossh cron rsync gnupg1 xclip python-is-python3 python3-venv pipx)

DESKTOP_PACKAGES=(i3-wm ubuntu-restricted-extras vlc anki feh w3m)

if [ ! -z $INCLUDE_DESKTOP];
then
    ## f.lux
    ## https://github.com/xflux-gui/fluxgui
    #sudo add-apt-repository ppa:nathan-renniewaldock/flux
    echo ""
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
pipx ensurepath
pipx install autopep8 flake8 pyotp isort youtube-dlp i3-workspace-names-daemon

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

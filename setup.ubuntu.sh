#!/bin/bash

##
## PPA for SBT
##
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823


##
## List of packages to install
##
PACKAGES=(python openssh vim screen terminator git cifs-utils samba vlc curl gitk openssh-server visualvm node npm zip golang-go python-pip gnupg i3 mdadm openjdk-8-jdk zsh)

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
sudo apt-get update
sudo apt-get install sbt

##
## aliases for bash and zsh 
##
cat bash/.bashrc >> ~/.bashrc
cat bash/.bashrc >> ~/.zshrc

##
## vim
##
cp vim/.vimrc ~/.vimrc
cp -r vim/.vim ~/
#
git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim

#vim +PluginInstall +qall
#ensure go plugin  stuff is installed
vim -E -c GoInstallBinaries -c q


#
# Oh My ZSH
#
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

##
## node stuff
##
sudo npm install -g jshint

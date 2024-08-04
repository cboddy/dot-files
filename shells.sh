#!/bin/bash


##
## python shell env
##
cp python/.py* ~/
#cp python/{flake8,pep8} ~/.config


##
## aliases for bash and zsh 
##
cat bash/.bashrc >> ~/.bashrc

##
## tmux
##
cp tmux/.tmux.conf ~/


##
## git 
##
cp  .gitconfig ~/
cp -r .git_templates ~/
cp .gitignore ~/
cp .git-prompt.sh ~/

git config advice.addEmptyPathspec false

##
## i3
##
cp -r i3 ~/.i3


gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false

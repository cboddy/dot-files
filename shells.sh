#!/bin/bash

#
# Oh My ZSH
#
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

##
## python shell env
##
cp python/.py* ~/
cp python/{flake8,pep8} ~/.config


##
## aliases for bash and zsh 
##
cat bash/.bashrc >> ~/.bashrc
cat bash/.bashrc >> ~/.zshrc
echo 'source /usr/share/virtualenvwrapper/virtualenvwrapper.sh' >> ~/.bashrc
echo 'source /usr/share/virtualenvwrapper/virtualenvwrapper.sh' >> ~/.zshrc

##
## tmux
##
cp tmux/.tmux.conf ~/


##
## git 
##
cp .gitconfig ~/
cp .git_templates ~/
cp .gitigore ~/
cp .git-prompt.sh ~/


##
## i3
##
cp i3 ~/.i3

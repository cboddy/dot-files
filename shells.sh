#!/bin/bash

#
# Oh My ZSH
#
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

##
## python shell env
##
cp python/.pythonrc ~/

##
## aliases for bash and zsh 
##
cat bash/.bashrc >> ~/.bashrc
cat bash/.bashrc >> ~/.zshrc



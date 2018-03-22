#!/usr/bin/env bash


# echo "Configuring ZSH..."
apt-get install zsh
apt-get install git-core
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`

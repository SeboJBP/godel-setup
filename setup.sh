#!/bin/bash
# A simple sh script to configuring fresh Ubuntu 14.04 LTS EC2 instance
# Seamless process to get my dev env up and running

# Install basic tools
sudo apt-get update
sudo apt-get install -y curl	# curl util
sudo apt-get install -y make gcc # make util and C compiler

# Install latest emacs
sudo apt-get install -y emacs

# git pull and install dotfiles as well
cd $HOME
if [ -d ./godel-dotfiles/ ]; then
    mv godel-dotfiles godel-dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/SeboJBP/godel-dotfiles.git
# ln -sb godel-dotfiles/.bash_profile .
ln -sb godel-dotfiles/.bashrc .
ln -sb godel-dotfiles/.bash_aliases .
#ln -sb godel-dotfiles/.bashrc_custom .
ln -sb godel-dotfiles/.gitconfig .
ln -sb godel-dotfiles/.screenrc .
ln -sf godel-dotfiles/.emacs.d .

# TODO (SeboJBP): Automatize Python set up for my needs.

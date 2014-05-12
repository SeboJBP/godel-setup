#!/bin/bash
# A simple sh script to configuring fresh Ubuntu 14.04 LTS EC2 instance
# Seamless process to get my dev env up and running

# Make $HOME/bin folder
mkdir -p $HOME/bin

# Install basic utils/tools
sudo apt-get update
sudo apt-get install -y curl	# curl util
sudo apt-get install -y make gcc # make util and C compiler
sudo apt-get install -y unzip
sudo apt-get install -y python-pip # install pip

# Install latest emacs
sudo apt-get install -y emacs

# TODO (SeboJBP): Automatize Python set up for my needs.

# Install Google App Engine
wget -P $HOME/bin/ https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.4.zip
unzip $HOME/bin/google_appengine_1.9.4.zip

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

#!/bin/bash

# File to bootstrap the .dot files environment
# Run as the user requiring the environment
# Based on https://github.com/haridas/Dotfiles

# Install git
sudo zypper install -y git

# Pull repo if non existing
if [ -d ~/Dotfiles ]
then
    cd ~/Dotfiles
    git pull origin master
else
    git clone https://github.com/Lunderbye/My_dot_files.git ~/Dotfiles
fi


# Goto git repo
cd ~/Dotfiles

# Initilize the Repo
git submodule init
git submodule update

# Goto to home
cd

# bash settings
if [ ! -e ~/.bashrc ]
then
    ln -s ~/Dotfiles/bashrc ~/.bashrc
fi

# vim settings
if [ ! -d ~/.vim ]
then
    ln -s ~/Dotfiles/vim-files/vim ~/.vim
fi

if [ ! -e ~/.vimrc ]
then
    ln -s ~/Dotfiles/vim-files/vim/vimrc ~/.vimrc
fi

# tmux settings
if [ ! -e ~/.tmux.conf ]
then
    ln -s ~/Dotfiles/tmux.conf ~/.tmux.conf
fi

# Install VIM with all scripting language support.
#sudo zypper install vim-nox

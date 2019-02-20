#!/bin/bash

# File to bootstrap the .dot files environment
# Run as the user requiring the environment
# Based on https://github.com/haridas/Dotfiles

# Add repos
zypper addrepo https://download.opensuse.org/repositories/X11:terminals/openSUSE_Factory/X11:terminals.repo
zypper refresh

# Install packages
sudo zypper install -y st
sudo zypper install -y git
sudo zypper install -y i3-gaps
sudo zypper install -y i3blocks
sudo zypper install -y neofetch

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

# i3 settings
if [ ! -e ~/.config/i3/config ]
then
    ln -s ~/Dotfiles/i3/i3.conf ~/.config/i3/config
fi

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

# termintor settings
if [ ! -e ~/.config/terminator/config ]
then
    ln -s ~/Dotfiles/terminator.conf ~/.config/terminator/config
fi

# pureline settings
if [ ! -e ~/.pureline.conf ]
then
    ln -s ~/Dotfiles/pureline_configs/my_powerline.conf ~/.pureline.conf
fi

# Install VIM with all scripting language support.
#sudo zypper install vim-nox

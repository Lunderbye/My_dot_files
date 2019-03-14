#!/bin/bash

# File to bootstrap the .dot files environment
# Run as the user requiring the environment
# Based on https://github.com/haridas/Dotfiles

# Add repos
zypper addrepo https://download.opensuse.org/repositories/X11:terminals/openSUSE_Factory/X11:terminals.repo
zypper refresh

# Install packages
sudo zypper install -y st			# Suckless terminal
sudo zypper install -y git			# Version control
sudo zypper install -y i3-gaps			# i3wm with gaps
sudo zypper install -y i3blocks			#
sudo zypper install -y i3lock			# i3 lock screen
sudo zypper install -y neofetch			# System status script
sudo zypper install -y polybar			# Install Polybar
sudo zypper install -y nitrogen			# BG picker
sudo zypper install -y compton			# i3 window effects
sudo zypper install -y feh			# Set wallpaper bg
sudo zypper install -y playerctl		# control media players over DBus. Works with most players
sudo zypper install -y powerline		# Powerline Bash prompt
sudo zypper install -y powerline-fonts		# PL fonts
sudo zypper install -y tmux-powerline		# PL for tmux
#sudo zypper install -y vim-plugin-powerline	# PL for vim
sudo zypper install -y dunst			# Notification utility

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

# Polybar config
if [ ! -e ~/.config/polybar/config ]
then
    mkdir ~/.config/polybar
    ln -s ~/Dotfiles/polybar/config ~/.config/polybar/config
    ln -s ~/Dotfiles/polybar/launch.sh ~/.config/polybar/launch.sh
fi

# Compton config
if [ ! -e ~/.config/compton.conf ]
then
    ln -s ~/Dotfiles/compton/compton.conf ~/.config/compton.conf
fi

# Dunst config
if [ ! -e ~/.config/dunst/dunstrc ]
then
    mkdir ~/.config/dunst
    ln -s ~/Dotfiles/dunst/dunstrc ~/.config/dunst/dunstrc
fi

# Install VIM with all scripting language support.
#sudo zypper install vim-nox

#!/bin/bash

#tmux - terminal multiplexer, htop - better top
ESSENTIAL="tmux cowsay htop"
# curl - downloader, ranger - cli file manager, cmus - cli music player, w3m - cli web browser, i3 - window manager, feh - set wallpaper, playerctl - cli control audio players, vlc - video player, fish - friendly shell, transmission-gtk - gui torrent downloader, mutt - email client
GENERAL="curl ranger cmus w3m i3 feh playerctl vlc fish transmission-gtk mutt"
DEV="vim git colordiff"

function general_setup() {
        sudo apt install -y $ESSENTIAL $GENERAL

	# Add Oh My Fish, fish package manager
	curl -L https://get.oh-my.fish | fish

	# make config directory
	mkdir ~/.config

	# copy configuration for i3
	mkdir ~/.config/i3
	cp i3 ~/.config/i3/config

	# copy configuration for i3status
	mkdir ~/.config/i3status
	cp i3status ~/.config/i3status/config

	mkdir ~/.config/fish
	cp config.fish ~/.config/fish/config.fish

	# copy mutt config
	cp .muttrc ~/.muttrc	
}

function dev_setup() {
	general_setup

        sudo apt install -y $DEV
	
	# Install Vundle, plugin manager for Vim
	printf "\nInstalling Vundle\n"
	if git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim ; then
		echo "Done"
	else
		echo "Couldn't clone Vundle"
	fi

	# Copy .vimrc
	printf "\nCopying .vimrc..."
	cp .vimrc ~/.vimrc
	printf "\nDone"

	# Copy tmux.conf
	printf "\nCopying .tmux.conf..."
	cp .tmux.conf ~/.tmux.conf
	printf "\nDone\n"

	cowsay -f /usr/share/cowsay/cows/dragon.cow "Make sure to run :PluginInstall in vim! Also change your default shell to fish with \"chsh -s \`which fish\`\". For Google Drive install grive2."
}

while true; do
	read -p "Update, upgrade and clean (y/n)? " yn
	case $yn in
		[Yy]* ) sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y; break;;
		[Nn]* ) break;;
		    * ) echo "Please answer yes or no.";;
	esac
done

while true; do
	echo
	echo "Install:"
	echo "   1) Essential"
	echo "   2) Essential + general"
	echo "   3) Essential + general + dev"
	echo "   4) Cancel"	
	read -p "Enter option: " option
	case $option in
		[1]* ) sudo apt install -y $ESSENTIAL; break;;
		[2]* ) general_setup; break;;
		[3]* ) dev_setup;  break;;
		[4]* ) break;;
		   * ) echo "Feed me numbers ^_^";;
	esac
done


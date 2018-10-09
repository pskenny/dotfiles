#!/bin/bash

ESSENTIAL="tmux cowsay"
GENERAL="ranger cmus w3m"
DEV="vim clang-format"

function dev_setup() {
	# Install Vundle
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


	cowsay -f /usr/share/cowsay/cows/dragon.cow "Make sure to run :PluginInstall in vim!"
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
		[2]* ) sudo apt install -y $ESSENTIAL $GENERAL; break;;
		[3]* ) sudo apt install -y $ESSENTIAL $GENERAL $DEV; dev_setup;  break;;
		[4]* ) break;;
		   * ) echo "Feed me numbers ^_^";;
	esac
done


#!/bin/bash

while true; do
	read -p "Update and upgrade apt?" yn
	        case $yn in
			[Yy]* ) sudo apt update && sudo apt upgrade; break;;
			[Nn]* ) break;;
			    * ) echo "Please answer yes or no.";;
	esac
done

# ---Installs---
# Essential
printf "\n\nInstalling tmux cowsay"
sudo apt install -y tmux cowsay

# Dev tools: git, vim
printf "\n\nInstalling git vim clang-format (for vim code formatting)"
sudo apt install -y git vim clang-format

# General: ranger (file manager), cmus (music player), w3m (web browser)
printf "\n\nInstalling ranger cmus w3m\n"
sudo apt install -y ranger cmus w3m

# ---Configure---
# Install Vundle
printf "\nInstalling Vundle\n"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Copy .vimrc
printf "\nCopying .vimrc..."
cp .vimrc ~/.vimrc
printf "\nDone"

# Copy tmux.conf
printf "\nCopying .tmux.conf..."
cp .tmux.conf ~/.tmux.conf
printf "\nDone\n"

cowsay "Make sure to run :PluginInstall in vim!"


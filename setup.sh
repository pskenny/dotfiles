#!/bin/bash

printf "Updating and upgrading system...\n"
sudo apt update && sudo apt upgrade

# ---Installs---
# Essential
sudo apt install -y tmux

# General dev tools: git, vim
sudo apt install -y git vim

# Require other tools: ranger (file manager), cmus (music player), w3m (web browser)
sudo apt install -y ranger cmus w3m

# ---Configure---
# Install Vundle
printf "\nInstalling Vundle\n"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Copy .vimrc
printf "\nCopying .vimrc...\n"
cp .vimrc ~/.vimrc
echo "Done"

# Copy tmux.conf
printf "\nCopying .tmux.conf...\n"
cp .tmux.conf ~/.tmux.conf
echo "Done"


#!/bin/bash

# ---Installs---
# Essential
sudo apt install -y tmux

# General dev tools: git, vim
sudo apt install -y git vim

# Rust dev


# Require other tools: ranger (file manager), cmus (music player), w3m (web browser)
sudo apt install -y ranger cmus w3m


# ---Configure---
# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Copy .vimrc
cp .vimrc ~/.vimrc

# Copy tmux.conf
cp .tmux.conf ~/.tmux.conf


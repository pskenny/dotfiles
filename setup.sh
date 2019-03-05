#!/bin/bash

echo "Updating dotfiles..."
read -p "Press Ctrl+C to cancel now if you don't want to update configs"

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

# Copy .vimrc
printf "\nCopying .vimrc..."
cp .vimrc ~/.vimrc
printf "\nDone"

# Copy tmux.conf
printf "\nCopying .tmux.conf..."
cp .tmux.conf ~/.tmux.conf
printf "\nDone\n"

cowsay -f /usr/share/cowsay/cows/dragon.cow "Make sure to run :PluginInstall in vim!"


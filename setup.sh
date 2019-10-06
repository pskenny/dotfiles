#!/bin/bash

#tmux - terminal multiplexer, htop - better top
ESSENTIAL="tmux cowsay htop"
# curl - downloader, ranger - cli file manager, cmus - cli music player, fish - friendly shell, rtorrent - torrent downloader
GENERAL="curl ranger cmus w3m fish"
DEV="vim"

while true; do
	read -p "Update, upgrade and clean (y/n)? " yn
	case $yn in
		[Yy]* ) sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y; break;;
		[Nn]* ) break;;
		    * ) echo "Please answer yes or no.";;
	esac
done

sudo apt install -y $ESSENTIAL $GENERAL $DEV

# Install Vundle, plugin manager for Vim
printf "\nInstalling Vundle\n"
if git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim ; then
	echo "Done"
else
	echo "Couldn't clone Vundle"
fi

cowsay -f /usr/share/cowsay/cows/dragon.cow "Change your default shell to fish with \"chsh -s \`which fish\`\". For Google Drive install grive2."

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

# Copy .vimrc
printf "\nCopying .vimrc..."
cp .vimrc ~/.vimrc

# Copy tmux.conf
printf "\nCopying .tmux.conf..."
cp .tmux.conf ~/.tmux.conf

cowsay -f /usr/share/cowsay/cows/dragon.cow "Make sure to run :PluginInstall in vim!"

# Add Oh My Fish, fish package manager
curl -L https://get.oh-my.fish | fish


#!/bin/bash

# Start pulseaudio
pulseaudio --start

# Yay AUR Helper Installation Process
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg --noconfirm -si
cd ..
rm -rf yay/

# Installing some fonts and other programs via yay
yay --confirm -S nerd-fonts-mononoki ttf-bitstream-vera shell-color-scripts pspp zotero

# Clone my dotfiles (configuration files) repository
git clone https://github.com/brunomontezano/dotfiles

# Make the master&stack layout script executable
chmod +x ~/dotfiles/.config/i3/scripts/autolayout.py

# Transfer my dotfiles to the user home directory
rsync -va --delete-after dotfiles/ ~

# Install Vundle (Vim Plugin Manager)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Create .xinitrc and put i3 to run when Xorg session starts
echo "exec i3" >> ~/.xinitrc

echo "And we are done! The installation is complete!"
echo ""
echo "Now, you canter enter \"startx\" to enter the desktop if you want! But I would recommend you to reboot before it."
echo ""
echo "The first time you run vim or neovim, run :PluginInstall to get the plugins installed."

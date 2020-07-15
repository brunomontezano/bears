#!/bin/bash

pulseaudio --start

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg --noconfirm -si
cd ..
rm -rf yay/

yay --confirm -S nerd-fonts-mononoki ttf-bitstream-vera shell-color-scripts pspp zotero

git clone https://github.com/brunomontezano/dotfiles
chmod +x ~/dotfiles/.config/i3/scripts/autolayout.py
rsync -va --delete-after dotfiles/ ~

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "exec i3" >> ~/.xinitrc

echo "And we are done! The installation is complete!"
echo ""
echo "Now, you canter enter \"startx\" to enter the desktop if you want! But I would recommend you to reboot before it."
echo ""
echo "The first time you run vim or neovim, run :PluginInstall to get the plugins installed."

#!/bin/bash

pause=1

while [ $pause == 1 ]
do
    echo "Please, insert your desired username:"
    read USER
    read -p "Your chosen username is $USER. Are you sure? [y/N]"
    case $yn in
        [Yy]* ) pause=0 ;;
        [yes]* ) pause=0 ;;
        [Yes]* ) pause=0 ;;
    esac
done

useradd -m -g wheel -s /bin/bash $USER
passwd $USER
echo "%wheel ALL=(ALL) NO PASSWD: ALL" >> /etc/sudoers


pacman --noconfirm --needed -S base-devel xorg-server xorg-xinit i3-gaps i3status i3blocks i3lock feh ffmpeg arandr pavucontrol pamixer mpv wget python-pip vim htop newsboat networkmanager imagemagick transmission-gtk zathura zathura-pdf-mupdf youtube-dl unzip unrar scrot git neovim lxappearance exa cmus alsa-utils arandr elinks qutebrowser picom pulseaudio redshift sxiv zip vifm udisks2 usbutils ttf-hack ttf-liberation ttf-dejavu man-db man-pages galculator exfat-utils dmenu dialog nmap ttf-font-awesome ttf-joypixels deadbeef arch-wiki-docs arch-wiki-lite nano pulseaudio-alsa alacritty audacity rsync rofi

systemctl enable NetworkManager
systemctl start NetworkManager

pip install i3ipc 

git clone https://github.com/brunomontezano/bears > /home/$USER/
chown -R $USER:$USER /home/$USER/bears

echo "Root system configuration is complete!"
echo ""
echo "Now you can log out of root user (Ctrl + D), log in as $USER and run the following command:"
echo ""
echo "bash /home/$USER/bears/finalsetup.sh"

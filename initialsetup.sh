#!/bin/bash

# Here I setup a little loop with while to read the username that the user is inserting and confirming it
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

# Then, I create the user, create a home directory, add it to the wheel group and set bash as the default shell
useradd -m -g wheel -s /bin/bash $USER

# Create a password for the new user
passwd $USER

# Add the new user to sudoers file via the wheel group
echo "%wheel ALL=(ALL) NO PASSWD: ALL" >> /etc/sudoers

# Install the packages needed for my setup
pacman --noconfirm --needed -S base-devel xorg-server xorg-xinit i3-gaps i3status i3blocks i3lock feh ffmpeg arandr pavucontrol pamixer mpv wget python-pip vim htop newsboat networkmanager imagemagick transmission-gtk zathura zathura-pdf-mupdf youtube-dl unzip unrar scrot git neovim lxappearance exa cmus alsa-utils arandr elinks qutebrowser picom pulseaudio redshift sxiv zip vifm udisks2 usbutils ttf-hack ttf-liberation ttf-dejavu man-db man-pages galculator exfat-utils dmenu dialog nmap ttf-font-awesome ttf-joypixels deadbeef arch-wiki-docs arch-wiki-lite nano pulseaudio-alsa alacritty audacity rsync rofi

# Enable and start the Network Manager service
systemctl enable NetworkManager
systemctl start NetworkManager

# Install i3ipc via pip to make my master&stack script work on i3
pip install i3ipc 

# Clone the BEARS repository to the new user home directory
git clone https://github.com/brunomontezano/bears > /home/$USER/

# Change the ownership of the repository to the new user
chown -R $USER:$USER /home/$USER/bears

echo "Root system configuration is complete!"
echo ""
echo "Now you can log out of root user (Ctrl + D), log in as $USER and run the following command:"
echo ""
echo "bash /home/$USER/bears/finalsetup.sh"

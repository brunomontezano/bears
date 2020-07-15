# BEARS - Bruno's Easy Arch Rice Setup


![Screenshot2020-07-0715:04:58](https://user-images.githubusercontent.com/65104127/86823544-5515aa80-c063-11ea-9b8a-c6c868611ed7.png)

These scripts were made by me (Bruno Montezano) to provide an easy way to install a fully functional Arch Linux graphical environment using i3-gaps and some other applications of my liking. Probably you won't use a lot of the programs that it installs, so I encourage you to take a look at the scripts and remove any unwanted software from there, so you can customize to just install stuff you need. It's nowhere near stable and you should first test on a VM (virtual machine) before trying on your real hardware.

## What are the depedencies?

- git (because you gotta clone this repository to use the scripts)
- sudo (the scripts use it to setup your account)

## How does the script work?

It is actually two scripts: the initial setup, that must be run as root user. And then the final setup script that's going to be run as the user you created with the first script.

The first script will ask you to choose a username for your new account and then ask you for confirmation. Then it's going to add this user to the sudoers file to give you permission to run commands as sudo. Next, it will install some of the core packages for this setup to work properly. Network Manager will be enabled in order to your internet work always. Pip will be used to install i3ipc that is a python library to control some i3wm functions. And then it's going to clone "BEARS" repository to the user home directory to be used in the next script.

In the final setup script, pulseaudio is going to be started, yay (Arch User Repository Helper) is installed to install some other packages needed to the rice. And finally, my dotfiles (configuration files) are going to be cloned from my repository, the vim plugin manager installed and .xinitrc created with the "exec i3" command.

## Support

If you have any problem, feel free to contact me here on GitHub via issue, or maybe check out my YouTube Channel (Bruno Montezano) for more content about Linux and open source world.

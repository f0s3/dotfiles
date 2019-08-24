#!/bin/sh

# i3wm polybar dunst dmenu fonts termite
pacaur -S i3-wm libmpdclient jsoncpp polybar dunst dmenu nerd-fonts-dejavu-complete termite --noconfirm

# login screen
cp issue /etc/issue
cp .zprofile ~

# my i3, polybar, termite, dunst configs
cp .config/i3 ~/.config
cp .config/polybar ~/.config
cp .config/termite ~/.config
cp .config/dunst ~/.config

# connman-dmenu

# i3-autokeymap

# create ~/Screenshots folder
mkdir ~/Screenshots

# setup lock screen

# battery indicator

# gtk theme

# icon theme


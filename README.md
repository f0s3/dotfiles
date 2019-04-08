# f0s3 dotfiles

## Installation

Assuming you have arch linux with i3wm + dmenu already set up.

### Install all needed for using configuration

 - dmenu
 - polybar
 - termite
 - i3lock-fancy
 - dunst
 - zsh (through oh-my-zsh)
 - feh
 - scrot / i3-scrot
 - i3-autokeymap (from my github) [optional]
 - connman_dmenu [optional]
 - Dejavu Sans Mono Nerd Font Mono
 - Noto Sans Symbols2

#### i3 configuration

`cp -r i3 ~/.config`

#### Terminal

`pacaur -S termite --noconfirm`

#### Polybar

`pacaur -S libmpdclient jsoncpp polybar --noconfirm`

#### Fonts with all needed glyphs

`pacaur -S nerd-fonts-dejavu-complete --noconfirm` TODO: add noto sans symbols2 here

#### i3-autokeymap

`cd ~/.config;git clone https://github.com/f0s3/i3-autokeymap;./arch-install.sh`

#### connman_dmenu

TODO: Needs to be written here

###### Please notice: this documentation is not written yet and will be written with more examples and description later on.
 `master` branch is currently obsolete as i don't use my pc. `laptop` is the one i develop and contribute to.

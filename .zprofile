XDG_CONFIG_HOME="~/.config"
export PATH=$HOME/.local/bin:$HOME/.pyenv/bin:$PATH
export EDITOR=nvim

export GTK_THEME=Adwaita:dark
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_STYLE_OVERRIDE=kvantum

#export GDK_SCALE=1.5
#export GDK_DPI_SCALE=0.6667
#export QT_SCALE_FACTOR=1.5
#export QT_AUTO_SCREEN_SCALE_FACTOR=0

syncthing --no-browser > /dev/null >&1 &

# Preserved for rollback — greetd now handles session startup
# if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

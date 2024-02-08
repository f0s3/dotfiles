# dotfiles

## prerequisites

you need to have `yay` installed

### install dependencies

`
yay -S ttf-dejavu-nerd git stow xkblayout-state scrot dmenu xclip alacritty zsh curl tmux neovim --noconfirm && fc-cache -fv
`

### install dotfiles

`
git clone https://github.com/f0s3/dotfiles ~/.dotfiles && cd ~/.dotfiles && stow .
`

### install zsh and powerlevel10k

`
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
`

### install zsh plugins

`
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions; git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting; git clone https://github.com/jirutka/zsh-shift-select.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-shift-select
`


export ZSH="$HOME/.oh-my-zsh"

plugins=(git ssh-agent zsh-autosuggestions zsh-syntax-highlighting tmux zsh-shift-select)
ZSH_TMUX_AUTOSTART=true
ZSH_THEME="powerlevel10k/powerlevel10k"
export EDITOR="nvim"
source $ZSH/oh-my-zsh.sh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

source /usr/share/nvm/init-nvm.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias g='git'
alias gcl='git clone'
alias gst='git status'
alias gpl='git pull'
alias gplr='git pull -r --rebase=preserve'
alias gplrs='git stash;git pull -r --rebase=preserve;git stash pop'
alias gp='git push'
alias gpf='git push --force'
# alias gpsu='git push -u origin HEAD'
alias ga='git add'
alias gd='git diff'
alias gc='git commit'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gll='git log -1 --stat --pretty=oneline'
alias gb='git branch'
alias gco='git checkout'
alias gs='git stash'
alias gsa='git stash apply'
alias gsp='git stash pop'
alias gr='git reset'
alias grh='git reset --hard'
alias grs='git reset --soft'

alias dc='docker-compose'

alias chi='ping 1.1.1.1'

alias wttr='curl wttr.in/Cherkasy'

alias c='clear'
alias b='bat --theme="Catppuccin-mocha"'
alias t='touch'
alias l='exa -a --icons --sort="type"'
alias ls='exa -a --icons --sort="type"'
alias lss='ls'
alias ll='exa -la --icons --sort="type"'

alias v='nvim'

alias lg='lazygit'

alias i='yay -S --noconfirm --answerdiff=None'

mode() {
  sudo nbfc set -s $2
  nohup sh -c "$HOME/.config/openrgb/launch.sh $1" &> /dev/null & disown
}

alias apex='mode apex 100'
alias linux='mode linux 30'


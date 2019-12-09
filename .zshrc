export EDITOR='vim'
export SSH_KEY_PATH="~/.ssh/rsa_id"
export PATH="/home/f0s3/anaconda3/bin:$PATH"
ZSH="/home/f0s3/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(battery time)
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='white'

source ~/.oh-my-zsh/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

#DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
plugins=(
  git
  zsh-syntax-highlighting
)

alias g='git'
alias gcl='git clone'
alias gst='git status'
alias gpl='git pull'
alias gplr='git pull -r --rebase=preserve'
alias gplrs='git stash;git pull -r --rebase=preserve;git stash pop'
alias gp='git push'
alias gpf='git push --force'
alias gpsu='git push -u origin HEAD'
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

alias v='vim'
alias sv='sudo vim'

alias i='pacaur -S --noconfirm'
alias 'r'='pacaur -R --noconfirm'
alias rd='pacaur -Rs --noconfirm'
alias rf='pacaur -Rcn --noconfirm'
alias u='pacaur -Syu'

alias dc='docker-compose'

alias chi='ping 1.1.1.1'

alias wttr='curl wttr.in/Cherkasy'

alias ls='colorls --sd -A'

alias c='clear'
alias b='bat'
alias t='touch'

[ -f ~/.config/zsh/plugins/fzf/fzf.zsh ] && source ~/.config/zsh/plugins/fzf/fzf.zsh

if [[ -r ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi

export MYVIMRC='~/.config/vim/config'

# fnm
export PATH=$HOME/.config/fnm/.fnm:$PATH
eval "`fnm env --multi`"

export ZSH="/home/andriiko/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status battery time)
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='white'

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias g='git'
alias gcl='git clone'
alias gst='git status'
alias gpl='git pull'
alias gplr='git pull -r --rebase=preserve'
alias gplrs='git stash;git pull -r --rebase=preserve;git stash pop'
alias gp='git push'
alias gpf='git push --force'
alias ga='git add'
alias gd='git diff'
alias gc='git commit'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gll='git log -1 --stat --pretty=oneline'
alias gb='git branch'
alias gs='git stash'
alias gsa='git stash apply'
alias gsp='git stash pop'
alias gr='git reset'
alias grh='git reset --hard'
alias grs='git reset --soft'

alias v='vim'
alias sv='sudo vim'

alias dc='docker-compose'

alias chi='ping 1.1.1.1'

alias wttr='curl wttr.in/Cherkasy'

alias ls='colorls --sd -A'

alias c='clear'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


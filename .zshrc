export ZSH="/home/f0s3/.oh-my-zsh"
ZSH_THEME="agnoster"
#DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh
export EDITOR='vim'
export SSH_KEY_PATH="~/.ssh/rsa_id"
# neofetch --cpu_temp C && bat -n ~/todo && echo '\n'

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

alias v='vim'
alias sv='sudo vim'

alias i='pacaur -S'

alias dc='docker-compose'

# added by Anaconda3 installer
#export PATH="/home/f0s3/anaconda3/bin:$PATH"

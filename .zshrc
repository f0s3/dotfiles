# Options
setopt autocd # change directory just by typing it's name
setopt nonomatch # hide error message if there is no match for the pattern
setopt notify # notify the status of background jobs immediately
setopt numericglobsort # sort filenames numerically when it makes sense
setopt appendhistory # append history instead of overwriting it
setopt histignorespace # don't save commands that start with space
setopt inc_append_history # save commands are added to the history immediately, instead of when shell exits
setopt histignorealldups # if a new command is a duplicate, remove the older one

# Environment variables
export ZSH_HOME=$HOME/.config/zsh
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# Plugins
source /usr/share/nvm/init-nvm.sh
source $ZSH_HOME/plugins/zsh-eza/zsh-eza.plugin.zsh
source $ZSH_HOME/plugins/fzf-zsh-plugin/fzf-zsh-plugin.plugin.zsh
source $ZSH_HOME/plugins/zsh-shift-select/zsh-shift-select.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Source configs
[[ -f $ZSH_HOME/aliases.zsh ]] && source $ZSH_HOME/aliases.zsh
[[ -f $ZSH_HOME/keybindings.zsh ]] && source $ZSH_HOME/keybindings.zsh
[[ -f $ZSH_HOME/fzf.zsh ]] && source $ZSH_HOME/fzf.zsh


# Launch scripts
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
#eval "$(pyenv virtualenv-init -)"


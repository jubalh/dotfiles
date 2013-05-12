ZSH=$HOME/.oh-my-zsh

# possible: "random"
ZSH_THEME="af-magic"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

bindkey -v

source $ZSH/oh-my-zsh.sh

cat $ZSH/ilu.txt

PATH=$PATH:$HOME/installed/Qt5.0.0/5.0.0/clang_64/bin
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
source ~/.rvm/scripts/rvm

#ALIASES
alias tm='tmux'
alias v='vim'

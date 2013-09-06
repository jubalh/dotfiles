ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"

#others I like
#ZSH_THEME="af-magic"
#possible: "random"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)
if [[ `uname` == "Darwin" ]]; then
	plugins=($plugins osx brew)
fi

source $ZSH/oh-my-zsh.sh

#PATHS
PATH_QT="$HOME/installed/Qt5.0.0/5.0.0/clang_64/bin"
if [[ -d "$PATH_QT" ]] ; then
	PATH=$PATH:$PATH_QT
fi

if [[ -d "$HOME/.rvm/" ]] ; then
	PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
	source ~/.rvm/scripts/rvm
fi

if [[ -d "$HOME/scripts" ]] ; then
	PATH=$PATH:$HOME/scripts
fi

#ALIASES
alias tm='tmux'
alias v='vim'
#using brew ctags; newer; recursive support
if [[ `uname` == "Darwin" ]] ; then
	alias ctags="`brew --prefix`/bin/ctags"
fi

#ARTWORK
PATH_ART="$ZSH/ilu.txt"
if [[ -f "$PATH_ART" ]] ; then
	cat $PATH_ART
fi
if [[ `uname` == "Linux" ]] ; then
#	if [[ command -v linuxlogo > /dev/null ]] ; then
		linuxlogo
#	fi
fi

#vi mode
set -o vi

#variables
export TERM=xterm-256color
export LC_CTYPE=de_DE.UTF-8
export LANG=de_DE.UTF-8
export EDITOR=vim

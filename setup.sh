#!/bin/bash

PATH_OMZ=~/.oh-my-zsh

function link_to(){
	rm -f $2
	ln -s ~/.dotfiles/$1 $2
}

if [[ $1 == 'linux' ]] ; then
	link_to gtkrc-2.0 ~/.gtkrc-2.0
	mkdir -p ~/.config/gtk-3.0
	link_to gtk3settings.ini ~/.config/gtk-3.0/settings.ini
	rm -f ~/.i3/config
	mkdir -p ~/.config/i3
	link_to i3config ~/.config/i3/config
	mkdir -p ~/.config/i3status
	link_to i3status.conf ~/.config/i3status/config
	link_to xprofile ~/.xprofile
	link_to Xdefaults ~/.Xdefaults
	link_to Xresources ~/.Xresources
	link_to tmux.conf ~/.tmux.conf
fi

if [[ $1 == 'osx' ]] ; then
	link_to slate ~/.slate
	link_to tmux.conf ~/.tmux.conf
	link_to iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
fi

if [[ ! -d "$PATH_OMZ" ]] ; then
	git clone http://github.com/robbyrussell/oh-my-zsh.git $PATH_OMZ
fi
link_to zshrc ~/.zshrc
link_to vimrc ~/.vimrc
link_to vimperatorrc ~/.vimperatorrc
link_to gitconfig ~/.gitconfig

#!/bin/bash

function link_to(){
	rm -f $2
	ln -s ~/.dotfiles/$1 $2
}

link_to vimrc ~/.vimrc

rm -f ~/.i3/config
mkdir -p ~/.config/i3
link_to i3config ~/.config/i3/config
mkdir -p ~/.config/i3status
link_to i3status.conf ~/.config/i3status/config
link_to xprofile ~/.xprofile
link_to Xdefaults ~/.Xdefaults
link_to Xresources ~/.Xresources

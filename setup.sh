#!/bin/zsh

#to have acces to aliases. like my alias to use homebrews ctags instead of osx's.
source ~/.zshrc

PATH_OMZ=~/.oh-my-zsh
PATH_VUNDLE=~/.vim/bundle/vundle

function link_to(){
	rm -f $2
	ln -s ~/.dotfiles/$1 $2
}

function nix(){
	link_to tmux.conf ~/.tmux.conf
	link_to vifmrc ~/.vifm/vifmrc
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
fi

if [[ $1 == 'osx' ]] ; then
	link_to slate ~/.slate
	link_to iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
	nix
fi

if [[ ! -d "$PATH_OMZ" ]] ; then
	git clone https://github.com/robbyrussell/oh-my-zsh.git $PATH_OMZ
fi
link_to zshrc ~/.zshrc
#chsh -s /bin/zsh

if [[ ! -d "$PATH_VUNDLE" ]] ; then
	git clone https://github.com/gmarik/vundle.git $PATH_VUNDLE
fi
link_to vimrc ~/.vimrc
mkdir -p ~/.vim/ftplugin
link_to ruby.vim ~/.vim/ftplugin/ruby.vim
vim +BundleInstall +qall
mkdir -p ~/.vim/tags
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f ~/.vim/tags/cppstd /usr/include/c++/4.2.1
#memo for other stuff:
#ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f gl /usr/include/GL/   # for OpenGL
#ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f sdl /usr/include/SDL/ # for SDL
#ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f qt4 /usr/include/qt4/ # for QT4

link_to vimperatorrc ~/.vimperatorrc
link_to gitconfig ~/.gitconfig

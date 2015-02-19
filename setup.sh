#!/bin/zsh

#to have acces to aliases. like my alias to use homebrews ctags instead of osx's.
source ~/.zshrc

PATH_OMZ=~/.oh-my-zsh
PATH_VUNDLE=~/.vim/bundle/vundle
PATH_VIMP_COLORS=~/.vimperator/colors

function link_to(){
	rm -f $2
	ln -s ~/.dotfiles/$1 $2
}

function nix(){
	link_to tmux.conf ~/.tmux.conf
	link_to vifmrc ~/.vifm/vifmrc
}

# Linux specific {{{
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
	nix
fi
# }}}
# OSX specific {{{
if [[ $1 == 'osx' ]] ; then
	link_to slate ~/.slate
	link_to iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
	nix
fi
# }}}
# {{{ ZSH
if [[ ! -d "$PATH_OMZ" ]] ; then
	git clone https://github.com/robbyrussell/oh-my-zsh.git $PATH_OMZ
fi
link_to zshrc ~/.zshrc
#chsh -s /bin/zsh
# }}}
# {{{ VIM
# install vundle
if [[ ! -d "$PATH_VUNDLE" ]] ; then
	git clone https://github.com/gmarik/vundle.git $PATH_VUNDLE
fi

link_to vimrc ~/.vimrc

#special ruby style
mkdir -p ~/.vim/ftplugin
link_to ruby.vim ~/.vim/ftplugin/ruby.vim

vim +BundleInstall +qall

#default config file for YouCompleteMe vim plugin
#link_to ycm_exta_conf.py ~/.vim/ycm_extra_conf.py
#cd ~/.vim/bundle/YouCompleteMe
#./install.sh --clang-completer

#ctags
#mkdir -p ~/.vim/tags
#ctags -R --fields=+S -f ~/.vim/tags/usrinclude /usr/include/

#memo for other stuff:
# c++ std lib; change version according to system
#ctags -R --c++-kinds=+p --fields=+iaS --language-force=C++ --extra=+q -f ~/.vim/tags/cppstd /usr/include/c++/4.2.1
#for OpenGl
#ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f gl /usr/include/GL/
# for SDL
#ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f sdl /usr/include/SDL/
#for Qt4
#ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f qt4 /usr/include/qt4/
# }}}
# VIMPERATOR {{{
if [[ ! -d "$PATH_VIMP_COLORS" ]] ; then
	git clone https://github.com/vimpr/vimperator-colors $PATH_VIMP_COLORS
fi
link_to vimperatorrc ~/.vimperatorrc
# }}}
# MISC {{{
link_to gitconfig ~/.gitconfig
link_to gitignore ~/.gitignore
# }}}

# vim:fdm=marker

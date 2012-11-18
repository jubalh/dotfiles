set nocompatible

filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'vim-scripts/vimwiki'
"Bundle 'vim-scripts/ShowMarks'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Shougo/neocomplcache'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'majutsushi/tagbar'
Bundle 'garbas/snipmate'
Bundle 'scrooloose/snipmate-snippets'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-fugitive'
Bundle 'sideshowcoder/vimtodotxt'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'xolox/vim-session'

filetype plugin indent on

set cm=blowfish

syntax on
set autoread
set autoindent
set number

set hidden
set showmode
set hlsearch
set ignorecase
set smartcase
set showcmd
set showmatch
set wildmenu
set ttyfast
set cursorline
set noerrorbells
set mouse=a
set cmdheight=2
set laststatus=2

set backspace=2
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set expandtab "use spaces instead of tabs
" use retab to change existing tabs into spaces

set fileformats=unix
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8
set list
set listchars=tab:>-,trail:·
if has("linebreak")
  let &sbr = nr2char(8618).' '
endif

set ofu=syntaxcomplete#Complete

if has("autocmd")
	autocmd ColorScheme * highlight SpecialKey guifg=DarkYellow ctermfg=DarkYellow
	autocmd ColorScheme * highlight NonText guifg=DarkYellow ctermfg=DarkYellow
	autocmd ColorScheme * highlight ExtraWhitespace guifg=DarkYellow ctermfg=DarkYellow
	"autocmd BufNewFile,BufEnter,BufRead *.wiki setfiletype wiki
	"autocmd BufNewFile,BufEnter,BufRead * if &filetype == 'wiki' | colorscheme desert | else | colorscheme solarized | endif
endif

colorscheme solarized

if has("gui_running")
	"colorscheme wombat
	"no toolbar
	set guioptions-=T
	"no menubar
	set guioptions-=m
else
	"colorscheme wombat256mod
endif

"if colorscheme == 'solarized'
let time_dependend = 0
if time_dependend == 1 
	if strftime("%H") < 12
		set background=light
	else
		set background=dark
	endif
else
	set background=dark
endif

if has('win32') || has('win64')
	behave mswin
	if has("gui_running")
		set guifont=Consolas:h12
		"maximize
		au GUIEnter * simalt ~x
	endif
endif

let g:session_autoload = 'no'

"MAPS
"build tag files
map C-F12 :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .CR
"toggle extra windows
map <F8> :TagbarToggle<CR>
map <F6>n :NERDTreeToggle<CR>
"toggle chars
map <F6>l :set list!<CR>
"vimwiki back
map <BS> <Plug>VimwikiGoBackWord
"input date
nnoremap <F5>d "=strftime("%Y-%m-%d")<CR>P
inoremap <F5>d <C-R>=strftime("%Y-%m-%d")<CR>
"Buffers
nnoremap <F5>b :buffers<CR>:buffer<Space>

" COMPLETION
" OmniCppComplete
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

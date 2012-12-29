" vim:fdm=marker
set nocompatible

filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

"plugins {{{
"plugin management
Bundle 'gmarik/vundle'
"wiki for vim
Bundle 'vim-scripts/vimwiki'
"show marks
Bundle 'kshenoy/vim-signature'
"color theme
Bundle 'altercation/vim-colors-solarized'
"better status line
Bundle 'Lokaltog/vim-powerline'
"completion
Bundle 'Shougo/neocomplcache'
"snippets
Bundle 'Shougo/neosnippet'
"snippets collection
Bundle 'honza/snipmate-snippets'
"explorer
Bundle 'scrooloose/nerdtree'
"commenting
Bundle 'scrooloose/nerdcommenter'
"bar which shows tags
Bundle 'majutsushi/tagbar'
"git
Bundle 'tpope/vim-fugitive'
"easy editing
Bundle 'tpope/vim-surround'
"todo.txt syntax
Bundle 'sideshowcoder/vimtodotxt'
"save/load sessions
Bundle 'xolox/vim-session'
Bundle 'kien/ctrlp.vim'
"css syntax
Bundle 'lepture/vim-css'
"show color as background around css color
"Bundle 'skammer/vim-css-color'
Bundle 'chrisbra/color_highlight'
"zen coding
Bundle 'mattn/zencoding-vim'
Bundle 'vim-scripts/YankRing.vim'
"just playing around
Bundle 'uguu-org/vim-matrix-screensaver'
Bundle 'henrik/vim-indexed-search'
Bundle 'mattn/benchvimrc-vim'
Bundle 'scrooloose/syntastic'
Bundle 'mutewinter/vim-indent-guides'
"automatically close xml/html tags
Bundle 'sukima/xmledit'
Bundle 'tpope/vim-ragtag'
"ruby
Bundle 'vim-ruby/vim-ruby'
"easymotion, colorv.vim
"}}}
" vim {{{
filetype plugin indent on

syntax on
set cm=blowfish
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
"set fileformats=unix
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8
set ofu=syntaxcomplete#Complete
"}}}

"Look {{{
set list
set listchars=tab:>-,trail:·
if has("linebreak")
  let &sbr = nr2char(8618).' '
endif
if has("autocmd")
	autocmd ColorScheme * highlight SpecialKey guifg=DarkYellow ctermfg=DarkYellow
	autocmd ColorScheme * highlight NonText guifg=DarkYellow ctermfg=DarkYellow
	autocmd ColorScheme * highlight ExtraWhitespace guifg=DarkYellow ctermfg=DarkYellow
	"autocmd BufNewFile,BufEnter,BufRead *.wiki setfiletype wiki
	"autocmd BufNewFile,BufEnter,BufRead * if &filetype == 'wiki' | colorscheme desert | else | colorscheme solarized | endif
endif

colorscheme solarized
"TODO: nur wenn unicode zeichen verfuegbar let g:Powerline_symbols = 'fancy'

if has("gui_running")
	"colorscheme wombat
	"no toolbar
	set guioptions-=T
	"no menubar
	set guioptions-=m
else
	set t_Co=256
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
"}}}
" mappings {{{
"build tag files
map C-F12 :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .CR
"toggle extra windows
map <F8> :TagbarToggle<CR>
map <F6>n :NERDTreeToggle<CR>
"toggle special characters
map <F6>l :set list!<CR>
"vimwiki back
map <BS> <Plug>VimwikiGoBackWord
"input date
nnoremap <F5>d "=strftime("%Y-%m-%d")<CR>P
inoremap <F5>d <C-R>=strftime("%Y-%m-%d")<CR>
"Buffers
nnoremap <F5>b :buffers<CR>:buffer<Space>
"}}}
" completion {{{
set completeopt=menuone,menu,longest,preview
let g:neocomplcache_enable_at_startup = 1
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
if has("autocmd")
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
endif
"}}}
let g:session_autoload = 'no'

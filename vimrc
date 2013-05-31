"#######################
"VIMRC
"by jubalh
"#######################

filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

"=======================
"BUNDLEs {{{
Bundle 'gmarik/vundle'
Bundle 'vim-scripts/vimwiki'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'kshenoy/vim-signature'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'honza/vim-snippets'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
"Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
Bundle 'lepture/vim-css'
Bundle 'skammer/vim-css-color'
Bundle 'chrisbra/color_highlight'
Bundle 'mattn/zencoding-vim'
Bundle 'uguu-org/vim-matrix-screensaver'
Bundle 'henrik/vim-indexed-search'
Bundle 'mattn/benchvimrc-vim'
Bundle 'mutewinter/vim-indent-guides'
Bundle 'airblade/vim-gitgutter'
Bundle 'dagwieers/asciidoc-vim'
"easymotion, colorv.vim
"}}}
"=======================
"GENERAL SETTINGS {{{

filetype plugin indent on

set nocompatible
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
set fileformats=unix
set fileencoding=utf-8
scriptencoding utf-8

set list
set listchars=tab:>-,trail:·
if has("linebreak")
    let &sbr = nr2char(8618).' '
endif

if has("autocmd")
	autocmd ColorScheme * highlight SpecialKey guifg=DarkYellow ctermfg=DarkYellow
	autocmd ColorScheme * highlight NonText guifg=DarkYellow ctermfg=DarkYellow
	autocmd ColorScheme * highlight ExtraWhitespace guifg=DarkYellow ctermfg=DarkYellow
endif

colorscheme solarized

"TODO: nur wenn unicode zeichen verfuegbar let
"	g:Powerline_symbols = 'fancy'

if has("gui_running")
	"no toolbar
	set guioptions-=T
	"no menubar
	set guioptions-=m
else
	set t_Co=256
endif

if has('win32') || has('win64')
	behave mswin
	if has("gui_running") 
		set guifont=Consolas:h12
		"maximize window
		au GUIEnter * simalt ~x
	endif
endif

if has("autocmd")
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
endif
" }}}
"=======================
"MAPPINGS {{{

"toggle special characters
map <F6>l :set list!<CR>
"input date
nnoremap <F5>d "=strftime("%Y-%m-%d")<CR>P
inoremap <F5>d <C-R>=strftime("%Y-%m-%d")<CR>
"Buffers
nnoremap <F5>b :buffers<CR>:buffer<Space>
" }}}
"=======================
"NERD* SETTINGS {{{

map <F6>n :NERDTreeToggle<CR>
"toggle special characters
map <F6>l :set list!<CR>


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
" }}}
"=======================
"SESSION SETTINGS {{{

let g:session_autoload = 'no'
let g:session_autosave = 'no'
" }}}
"=======================
"TAGBAR SETTINGS {{{

map <F8> :TagbarToggle<CR>
" }}}
"=======================
"VIMWIKI SETTINGS {{{

map <BS> <Plug>VimwikiGoBackWord
" }}}

" vim:fdm=marker

"#######################
"VIMRC
"by jubalh
"#######################

filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

"BUNDLEs {{{
Bundle 'gmarik/vundle'
Bundle 'fatih/vim-go'
Bundle 'vim-scripts/vimwiki'
Bundle 'vim-scripts/YankRing.vim'
"show marks
Bundle 'kshenoy/vim-signature'
Bundle 'bling/vim-airline'
"Snippets plugin
Bundle 'sirver/ultisnips'
"Snippets collection
Bundle 'honza/vim-snippets'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-surround'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
Bundle 'chrisbra/color_highlight'
"web stuff Bundle 'mattn/emmet-vim'
Bundle 'uguu-org/vim-matrix-screensaver'
Bundle 'henrik/vim-indexed-search'
Bundle 'mattn/benchvimrc-vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'airblade/vim-gitgutter'
Bundle 'dagwieers/asciidoc-vim'
Bundle 'kien/ctrlp.vim'
"easymotion, colorv.vim
Bundle 'vim-pandoc/vim-pandoc'
Bundle 'guns/xterm-color-table.vim'
Bundle 'sjl/gundo.vim'
"Show parenthesis in different colors
Bundle 'kien/rainbow_parentheses.vim'
"Autoclose parenthesis, quotes and so on
Bundle 'Raimondi/delimitMate'
"Close HTML tags
Bundle 'docunext/closetag.vim'
"Colorschemes:
Bundle 'w0ng/vim-hybrid'
Bundle 'ciaranm/inkpot'
Bundle 'morhetz/gruvbox'
Bundle 'tomasr/molokai'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'joonty/vim-phpqa'
"}}}
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

let mapleader = ","

set list
set listchars=tab:>-,trail:·
if has("linebreak")
    let &sbr = nr2char(8618).' '
endif

if has("autocmd")
	autocmd ColorScheme * highlight SpecialKey guifg=MediumPurple ctermfg=57
	autocmd ColorScheme * highlight NonText guifg=MediumPurple ctermfg=DarkYellow
	autocmd ColorScheme * highlight ExtraWhitespace guifg=MediumPurple ctermfg=DarkYellow

	"disable tmux statusbar while in vim
	"autocmd VimEnter,VimLeave * silent !tmux set status
endif

set background=dark
colorscheme Tomorrow-Night

"folding is too slow
let g:pandoc_no_folding = 1

if has("gui_running")
	"no toolbar
	"	set guioptions-=T
	"no menubar
	"	set guioptions-=m
	if has('gui_macvim')
		set guifont=Monaco:h12
	endif
	if has('gui_gtk2')
		set guifont=Monospace\ 13
	endif
	if has("gui_win32")
		set guifont=Consolas:h12
		"maximize window
		au GUIEnter * simalt ~x
	endif
else
	set t_Co=256
endif

if has('win32') || has('win64')
	behave mswin
endif
"}}}
"TAGS {{{

"set tags+=~/.vim/tags/usrinclude
"set tags+=~/.vim/tags/cppstd
" }}}
"MAPPINGS {{{

nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

"toggle special characters
map <F6>l :set list!<CR>

"input date
nnoremap <F5>d "=strftime("%Y-%m-%d")<CR>P
inoremap <F5>d <C-R>=strftime("%Y-%m-%d")<CR>

"Buffers
"show all open buffers
nnoremap <F5>b :buffers<CR>:buffer<Space>
"switch between last used buffers
nmap <Tab> :b#<CR>

"recreate local tags file
"map <F5>t :!/usr/local/bin/ctags -R --exclude=.git --sort=yes –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
"set current directories created tags file to avail. tags
set tags+=./tags
" }}}
"NERD* SETTINGS {{{

let NERDTreeShowHidden=1
map <F6>n :NERDTreeToggle<CR>

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" }}}
"SESSION SETTINGS {{{

let g:session_autoload = 'no'
let g:session_autosave = 'no'
" }}}
"TAGBAR SETTINGS {{{

map <F8> :TagbarToggle<CR>
" }}}
"VIMWIKI SETTINGS {{{

map <BS> <Plug>VimwikiGoBackWord
" }}}
"Rainbow Parentheses SETTINGS {{{
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" }}}
"Airline SETTINGS {{{
"display buffers on top
let g:airline#extensions#tabline#enabled = 1
let g:airline_enable_branch = 1
let g:airline_enable_syntastic = 1

" unicode symbols instead of powrline patched font
let g:airline_powerline_fonts = 0
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
"let g:airline_right_sep = '«'
"let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
" }}}

" vim:fdm=marker

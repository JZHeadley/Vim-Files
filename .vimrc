" Have to set shell to use fish otherwise things break
set shell=/bin/bash

" Enabling Vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Added NERDTree
Plugin 'scrooloose/nerdtree'

" Added NERDCommenter
Plugin 'scrooloose/nerdcommenter'

" Added Vim-AutoFormat
Plugin 'Chiel92/vim-autoformat'

" YouCompleteMe Plugin for Code Completion
Plugin 'valloric/youcompleteme'

" Adds some nice vim defaults
Plugin 'tpope/vim-sensible'

" Adventurous Theme based off of dracula Theme
Plugin 'philpl/vim-adventurous'

" Rainbow Parentheses Plugin
Plugin 'kien/rainbow_parentheses.vim'

" YouCompleteMe Config Generator
Plugin 'rdnetto/YCM-Generator'

" Query Stackoverflow from vim
Plugin 'mickaobrien/vim-stackoverflow'

" Vim Fuzzy Finder
Plugin 'junegunn/fzfn'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on

" Sets syntax highlighting and line numbers on
syntax on
set number

set linebreak   " Break lines at word (requires Wrap lines)
set showmatch   " Highlight matching brace

" Move vim cursor wherever mouse cursor is
"set mouse=a

set hlsearch " Highlight all search results
set smartcase " Enable smart-case search
set ignorecase " Always case-insensitive
set incsearch " Searches for strings incrementally

" Whitespace
set autoindent " Auto-indent new lines
set shiftwidth=4 " number of auto-indent spaces
set expandtab " use Spaces instead of tabs
set smartindent " enable smart-indent
set smarttab " enable smart-tabs
set softtabstop=4 " number of spaces per Tab
set ruler
set backspace=indent,eol,start
set undolevels=1000
set hidden
set foldenable

" Sets vim's temp files to be in your home directory instead of whatever
" directory you're currently in
set swapfile
set dir=~/tmp

" Set color scheme
colorscheme adventurous
set t_Co=256
set background=dark
" Set YouCompleteMe menu colors
highlight Pmenu ctermfg=2 ctermbg=238 guifg=#000000 guibg=#222222

" Start NerdTree at startup
" autocmd vimenter * NERDTree
" autocmd vimenter * wincmd p
" Open and close NERDTree when you hit ctrl+n
map <F2> :NERDTreeToggle<CR>
" Close vim if only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Set path for autoformat to look for formatters
let g:formatterpath= ['/home/headleyjz/Formatters']
" Creates and sets custom formatter for c code to use my preferred formatting style
let g:formatdef_my_custom_c = '"~/Formatters/astyle --mode=c --style=1tbs -pcHs4"'
let g:formatters_c = ['my_custom_c']
" Maps Ctrl+f to autoformat code
noremap <C-f> :Autoformat<CR>
autocmd Filetype c nnoremap <C-f> :Autoformat my_custom_c <CR>
" Autoformat on fileSave
autocmd Filetype c au BufWrite * :Autoformat my_custom_c

" Rainbow Parentheses plugin configuration
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Sets YouCompleteMe conf file
" let g:ycm_global_ycm_extra_conf= '~/.ycm_global_ycm_extra_conf'
let g:ycm_confirm_extra_conf=0

autocmd FileType c map <F3> :!make <CR>
autocmd FileType c map <F4> :!make run<CR>
autocmd FileType c map <F5> :!make clean<CR>

set mouse=a


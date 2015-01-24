"======================================================================
" Coming Home to Vim
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
"======================================================================
filetype off
filetype plugin indent on

set nocompatible

set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

"======================================================================
" Pathogen
"======================================================================
execute pathogen#infect()


"======================================================================
" Vim After 11 Years
" http://statico.github.com/vim.html
"======================================================================
nmap j gj
nmap k gk

set incsearch
set ignorecase
set smartcase
set hlsearch
nmap \q :nohlsearch<CR>

cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>

"======================================================================
" Vim functions
"======================================================================
" The following are commented out as they cause vim to behave a lot
" " differently from regular Vi. They are highly recommended though.
set showmatch      " Show matching brackets.
set mouse=a        " Enable mouse usage (all modes)

"let g:Powerline_symbols = 'fancy'


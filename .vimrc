"======================================================================
" Vundle
" http://www.mybridge.co/view/10709
" http://lepture.com/en/2012/vundle-vs-pathogen
" http://tilvim.com/2013/12/28/pathogen-for-vundle.html
"======================================================================
set nocompatible " required
filetype off     " required

" -----------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'

" my bundles
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
"Plugin 'vim-airline/vim-airline'  "alternative completely in vimscript for powerline
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
" new plugins --
Plugin 'klen/python-mode'        " great extension
Plugin 'elzr/vim-json'           " better json
Plugin 'justinmk/vim-sneak'      " extended f. use s<char><char>
Plugin 'majutsushi/tagbar'       " show tagbar :TagbarToggle
Plugin 'godlygeek/tabular'       " aligning text
Plugin 'plasticboy/vim-markdown' " must come after tabular
Plugin 'tpope/vim-sleuth'        " automatically adjusts 'shiftwidth' and 'expandtab' based on current file
Plugin 'vim-scripts/a.vim'       " alternate between .c/.h
Plugin 'flazz/vim-colorschemes'  " the name says it all
Plugin 'tpope/vim-surround'      " change surrounding cs'<q>
Plugin 'jiangmiao/auto-pairs'    " autocloses brackets etc.
"Plugin 'tomasr/molokai'         " better molokai
"Plugin 'sjl/gundo.vim'          " visualize the undo tree
"most new plugins came from https://github.com/VundleVim/Vundle.vim
call vundle#end()
" -----------------------------------------------

filetype plugin indent on " required

"======================================================================
" Coming Home to Vim
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
"======================================================================

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
"set number
set relativenumber
set undofile

"======================================================================
" Pathogen
"======================================================================
"execute pathogen#infect()


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

map <C-n> :NERDTreeTabsToggle<CR>
"close if nerd is the only win remaining
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"autoload nerd tree if no args to vim
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"nnoremap <F4>   :Te <C-r><C-f><CR> "gf already works! but it's a cool
"shortcut


"======================================================================
" VIM and Python - A Match from Heaven
" http://www.mybridge.co/view/10709
"======================================================================
set foldmethod=indent
set foldlevel=99

"======================================================================
" Vim functions
"======================================================================
" The following are commented out as they cause vim to behave a lot
" " differently from regular Vi. They are highly recommended though.
set showmatch      " Show matching brackets.
set mouse=a        " Enable mouse usage (all modes)

let g:Powerline_symbols = 'fancy'
" Color
set t_Co=256

"======================================================================
" Syntastic config
"======================================================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" YouCompleteMe fix
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"======================================================================
" Change cursor in different modes
" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
"======================================================================
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

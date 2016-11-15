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
Plugin 'Raimondi/delimitMate'    " same autoclose, but without auto-pairs issue
"Plugin 'jiangmiao/auto-pairs'    " autocloses brackets etc.
"Plugin 'tomasr/molokai'         " better molokai
"Plugin 'sjl/gundo.vim'          " visualize the undo tree
Plugin 'ryanoasis/vim-devicons'  " icons on NERDTree etc.
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight' " icon colors
"most new plugins came from https://github.com/VundleVim/Vundle.vim
" source: https://github.com/mhartington/dotfiles/blob/master/vimrc
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

let g:NERDTreeMouseMode = 3
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

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

" custom changes 
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark

"======================================================================
" Vim Anti-patterns
" About mixing vim sloppiness with precision https://news.ycombinator.com/item?id=12645523 
" > I never got into the habit of using { and  }. I just use H M L
" > (high/medium/low) to get approximately in the right part of the screen, then
" > go line-by-line. You can also do 5H or 10L to get "5 lines from the top" or
" > "10 lines from the bottom". I make pretty good use of vim features, but I
" > like to mix some sloppiness with the precision. I don't often count things
" > before typing commands, because that breaks the second-nature quality of
" > navigation. If something is more than 2 or 3 objects away, I approximate. I
" > do use counting with t, T, f, and F a lot to hop around, including things
" > like c2f). Very frequently that combines well with spamming j.j.j.j.j. I use
" > . with trivial movement (like j or n) at least 10x more than @a. Another way
" > to move fast sloppily is W and B. I guess I'm saying: learn all the cool
" > stuff you can do, but don't feel like you have to find the most precise way
" > to do every little thing. If you're just starting out, relax and don't try
" > too hard. You can always just pick one new thing every couple weeks and try
" > to add it to your habits.
"
" > Oh also: he mentions O to insert above the current line. I use that a lot,
" > but on my systems (going back 15 years or so I think) it has always required
" > a pause, like vim is waiting to see if I'm typing O or some longer command.
" > If I type O and immediately start entering text, strange things happen. This
" > doesn't happen with o. Does anyone else experience this? Maybe it's just
" > something weird in my own setup.
"
" > EDIT: Some more "moving fast sloppily": 1G goes to the top of the file. G
" > goes to the bottom. Also you can not-move, but scroll the visible area so
" > that your cursor is on the top line (zENTER), middle line (z.), or bottom
" > line (z-). I use that a lot when I am Ctrl-Fing through a file, so I can see
" > more context.
"======================================================================
" for scrolling up and down quickly
" https://news.ycombinator.com/item?id=12645960
" if you need to use J (join), use :join instead. Motion is used more often
"""nnoremap J 7j  
"""nnoremap K 7k
"""vnoremap J 7j
"""vnoremap K 7k
" J to :[j]oin is my muscle memory already
nnoremap <PageDown> 7j
nnoremap <PageUp> 7k
vnoremap <PageDown> 7j
vnoremap <PageUp> 7k

" Mimic Emacs Line Editing in Insert Mode Only
" http://stackoverflow.com/a/27878200/957997
inoremap <C-A> <Home>
inoremap <C-B> <Left>
inoremap <C-E> <End>
inoremap <C-F> <Right>
inoremap <C-K> <Esc>lDa
inoremap <C-U> <Esc>d0xi
inoremap <C-Y> <Esc>pa
inoremap <C-X><C-S> <Esc>:w<CR>a

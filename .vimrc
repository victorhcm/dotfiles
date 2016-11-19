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
  Plugin 'VundleVim/Vundle.vim'    " required!
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
  "Plugin 'sjl/gundo.vim'          " visualize the undo tree
  Plugin 'ryanoasis/vim-devicons'  " icons on NERDTree etc.
  Plugin 'tiagofumo/vim-nerdtree-syntax-highlight' " icon colors
call vundle#end()
"most new plugins came from https://github.com/VundleVim/Vundle.vim
" source: https://github.com/mhartington/dotfiles/blob/master/vimrc
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
" VIM and Python - A Match from Heaven
" http://www.mybridge.co/view/10709
"======================================================================
set foldmethod=indent
set foldlevel=99

set showmatch      " Show matching brackets.
set mouse=a        " Enable mouse usage (all modes)

" Color
set t_Co=256

"======================================================================
" Plugin config
"======================================================================
" Powerline
let g:Powerline_symbols = 'fancy'


" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" YouCompleteMe 
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1


" NERDTree 
let g:NERDTreeMouseMode = 3
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

map <C-n> :NERDTreeTabsToggle<CR>
"close if nerd is the only win remaining
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"autoload nerd tree if no args to vim
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"nnoremap <F4>   :Te <C-r><C-f><CR> "gf already works! but it's a cool
"shortcut


" pymode: disable window showing lint errors
let g:pymode_lint_cwindow = 0


" color theme
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark

"======================================================================
" Custom changes
"======================================================================
" buffer navigation (http://vi.stackexchange.com/a/9161/8305)
nnoremap gb :ls<CR>:b  


"tab walking (from @guimaluf)
nmap <left>  :tabprev<CR>
nmap <right> :tabnext<CR>

"buffer walking
nmap <up>    :bn <CR>zz
nmap <down> :bp <CR>zz


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


" change cursor in insert mode :P
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


" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
" source: https://gist.github.com/guimaluf/f8b83bd1f0609a6abe31
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

function! VisualSelection(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

"======================================================================
" Vim Anti-patterns
" About mixing vim sloppiness with precision https://news.ycombinator.com/item?id=12645523 
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


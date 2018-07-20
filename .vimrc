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
  "Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
  "Plugin 'vim-airline/vim-airline'  "alternative completely in vimscript for powerline
  Plugin 'airblade/vim-gitgutter'
  "Plugin 'scrooloose/syntastic'
  "Plugin 'scrooloose/nerdtree'
  "Plugin 'jistr/vim-nerdtree-tabs'
  "Plugin 'Valloric/YouCompleteMe'
  "Plugin 'ctrlpvim/ctrlp.vim'
  "Plugin 'klen/python-mode'        " great extension
  "Plugin 'elzr/vim-json'           " better json
  "Plugin 'justinmk/vim-sneak'     " extended f. use s<char><char>
  "Plugin 'majutsushi/tagbar'       " show tagbar :TagbarToggle
  "Plugin 'godlygeek/tabular'       " aligning text
  "Plugin 'plasticboy/vim-markdown' " must come after tabular
  Plugin 'tpope/vim-sleuth'        " automatically adjusts 'shiftwidth' and 'expandtab' based on current file
  Plugin 'flazz/vim-colorschemes'  " the name says it all
  Plugin 'tpope/vim-surround'      " change surrounding cs'<q>
  Plugin 'tpope/vim-vinegar'       " file explorer stuff
  Plugin 'Raimondi/delimitMate'    " same autoclose, but without auto-pairs issue
  "Plugin 'jiangmiao/auto-pairs'   " autocloses brackets etc.
  "Plugin 'sjl/gundo.vim'          " visualize the undo tree
  "Plugin 'ryanoasis/vim-devicons'  " icons on NERDTree etc.
  Plugin 'tpope/vim-repeat'        " repeats more stuff with .
  "Plugin 'tpope/vim-obsession'    " better session manager
  "Plugin 'tiagofumo/vim-nerdtree-syntax-highlight' " icon colors
  "Plugin 'jeaye/color_coded'
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
" A Good Vimrc
" https://dougblack.io/words/a-good-vimrc.html
"======================================================================
set lazyredraw     " redraw only when need to. makes macros faster

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"======================================================================
" Vim After 11 Years
" http://statico.github.com/vim.html
"======================================================================
nmap j gj
nmap k gk

" j and k don't skip over wrapped lines in following FileTypes, unless given a
" count (helpful since I display relative line numbers in these file types)
" (https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/cliuz1o)
autocmd FileType markdown,python,vim,text nnoremap <expr> j v:count ? 'j' : 'gj'
autocmd FileType markdown,python,vim,text nnoremap <expr> k v:count ? 'k' : 'gk'
autocmd FileType markdown,python,vim,text vnoremap <expr> j v:count ? 'j' : 'gj'
autocmd FileType markdown,python,vim,text vnoremap <expr> k v:count ? 'k' : 'gk'

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
set foldlevel=0 "previous: 99
set foldcolumn=1

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
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0


" YouCompleteMe 
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1


" NERDTree 
let g:NERDTreeMouseMode = 3
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:NERDTreeHijackNetrw = 0

map <C-n> :NERDTreeTabsToggle<CR>
"close if nerd is the only win remaining
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""autoload nerd tree if no args to vim
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" pymode: disable window showing lint errors
let g:pymode_lint_cwindow = 0
let g:pymode_rope = 0  " disable for large repos, such as caffe


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


"gf already works! but it's a cool shortcut
"nnoremap <F4>   :Te <C-r><C-f><CR> 


""look for tags in upper directories
" http://stackoverflow.com/a/741486/957997
set tags=./tags;/


""set your path
"https://github.com/vsbuffalo/dotfiles/blob/master/.vimrc#L40
set path+=./**,~/workspace/**


" there are other interesting keybindings here:
" https://gist.github.com/cyeong/3862602
if has("cscope")
    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out  
    " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
	set cscopeverbose 
endif

" http://stackoverflow.com/a/563992/957997
" definition in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" definition in a vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" build ctags and cscope files
" adapted from http://stackoverflow.com/a/934523/957997
if has("cscope")
  map <F4> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q src/ include/ && 
        \ find . -name '*.py' 
        \ -o -iname '*.[CH]' 
        \ -o -name '*.cpp' 
        \ -o -name '*.cc' 
        \ -o -name '*.hpp' > cscope.files 
        \ && cscope -b -q<CR>
endif


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
nnoremap <PageDown> 7<C-E>
nnoremap <PageUp> 7<C-Y>
vnoremap <PageDown> 7<C-E>
vnoremap <PageUp> 7<C-Y>


"======================================================================
" Faster Grepping in Vim 
" https://robots.thoughtbot.com/faster-grepping-in-vim
"======================================================================
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \/ :Ag<SPACE>


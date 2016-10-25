set nocompatible

" Remapping leader before plugin definitions
let mapleader=","

source ~/.vimrc.plug

" Thanks to https://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " use for Ack
    let g:ackprg = 'ag --vimgrep'

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

"
" Some general options
"
if has("win32unix")
    set clipboard=unnamed
else
    set clipboard+=unnamedplus
endif
set noswapfile
set nobackup
set backspace=2
set wildmode=longest,list
set formatoptions+=n
set hidden
set modeline

set mouse=a
set mousemodel=popup

set completeopt-=preview
let loaded_matchparen = 0

" Remember opened buffers
set viminfo^=%

noremap ; :

"
" Look
"
syntax enable
"colorscheme desertEx
"colorscheme jellybeans
let g:rehash256 = 1
colorscheme molokai
set background=dark
" colorscheme solarized

let c_space_errors=1
set number
set relativenumber
set laststatus=2 " display status line always

"
" Indenting
"
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autowrite
set autoindent
"set smartindent
"set cindent
"set cinoptions=(0

"
" Searching
"
set ignorecase
set smartcase
set hlsearch
set incsearch
nnoremap <silent> <leader><space> :nohlsearch<CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
" nnoremap / /\v
" nnoremap ? ?\v
set gdefault
set iskeyword-=:

"
" Set up keycodes
"
set <S-F3>=[25~
set <S-F4>=[26~
set <S-F5>=[28~
set <S-F6>=[29~
set <S-F7>=[31~
set <S-F8>=[32~
set <S-F9>=[33~
set <S-F10>=[34~

"
" Key mappings
"

" Unbind some default keys
map <F1> <nop>
map Q <nop>


" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
nnoremap <leader>ve :e $MYVIMRC<CR>
nnoremap <leader>vp :e $MYVIMRC.plug<CR>
nnoremap <leader>vl :e .vimrc.plug<CR>
" source $MYVIMRC reloads the saved $MYVIMRC
nnoremap <leader>vr :source $MYVIMRC<CR>

" toggle paste mode
nnoremap <leader>p :set invpaste paste?<CR>
set pastetoggle=<leader>p

" repeat last command
nnoremap <leader>; @:<CR>

" toggle ignorecase
nnoremap <leader>i :set invignorecase ignorecase?<CR>

" show/hide special chars
set listchars=tab:>-,trail:·,eol:$
nnoremap <silent> <leader>s :set nolist!<CR>

nnoremap <silent> <F2> :w<CR>

" :bdel closes window. Using plugin instead
"nnoremap <silent> <F9> :bdel<CR>

nnoremap <silent> <F5> :cprev<CR>
nnoremap <silent> <F6> :cnext<CR>

nnoremap <silent> <leader>m :make<CR>
nnoremap <silent> <leader>mm :make<CR>
nnoremap <silent> <leader>ml :make -C %:h<CR><CR>

nnoremap <silent> <F9> :bd<CR>
nnoremap <silent> <F10> :qa<CR>
nnoremap <silent> <S-F10> :qa!<CR>

nnoremap <leader>r :set invnumber<CR>
nnoremap <leader>R :set invrelativenumber<CR>

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap <leader>[ :colder<CR>
nnoremap <leader>] :cnewer<CR>

nnoremap <leader>. :e %:h<CR>

if exists("&jumplist")
    set jumplist=trim
endif

"
" File type settings
"
au! BufNewFile,BufRead Makefile.* set filetype=make
au! BufNewFile,BufRead *_make set filetype=make
au! BufNewFile,BufRead *.gdb set filetype=gdb
au! BufNewFile,BufRead *bashrc.d/* set filetype=sh
autocmd BufNewFile,BufRead *.json set ft=javascript

"
" Tags - related
"
set tags=./tags,tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags
set path+=./,../,../../,../../../,../../../../,../../../../../,./include/,../include/,../../include/,../../../include/,../../../../include/,../../../../../include/,

set cscopequickfix=s-,c-,d-,i-,t-,e-
"set nocscopetag
set csto=1

set wildignore+=*.d,*.o,*.a,*.so,*.pyc

"
" Allow override settings in ~/.vimrc.local
"
if filereadable(expand("~/.vimrc.local"))
    source $HOME/.vimrc.local
endif

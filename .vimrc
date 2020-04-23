filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'gilgigilgil/anderson.vim'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
call plug#end()

syntax on
set background=dark
autocmd vimenter * NERDTree
colo gruvbox
set nocompatible
set ff=unix
:imap hh <C-X><C-O>
:imap jj <Esc> 
syntax on
set number
highlight LineNr ctermfg=grey
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set showmatch
set hlsearch
set incsearch
set visualbell
set noerrorbells
set linespace=3 
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
vmap '' :w !pbcopy<CR><CR>
se mouse+=a

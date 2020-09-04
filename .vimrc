filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'fatih/vim-go'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Townk/vim-autoclose'
Plug 'vim-syntastic/syntastic'
Plug 'rust-lang/rust.vim'
call plug#end()

let g:airline_theme='one'
syntax on
colorscheme codedark 
set background=dark
autocmd vimenter * NERDTree
set ff=unix
:imap hh <C-X><C-O>
:imap jj <Esc> 
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

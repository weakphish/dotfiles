call plug#begin('~/.config/nvim/plugged')
" IDE-Features
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-syntastic/syntastic'
Plug 'andymass/vim-matchup'
" Languages
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
" Aesthetic/Appearance
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" open NERDTree automatically
autocmd vimenter * NERDTree

" Make it pretty :) 
syntax on
colorscheme codedark


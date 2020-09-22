call plug#begin('~/.config/nvim/plugged')
" IDE-Features
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim'
Plug 'vim-syntastic/syntastic'
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

" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

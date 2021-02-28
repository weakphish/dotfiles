"" The prefix to use for leader commands
let g:mapleader="<space>"

"### PLUGINS ###
call plug#begin('~/.config/nvim/plugged')
" IDE-Features
Plug 'preservim/nerdtree'
Plug 'andymass/vim-matchup'
Plug 'godlygeek/tabular'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
" Languages
Plug 'sheerun/vim-polyglot'
" Aesthetic/Appearance
Plug 'gruvbox-community/gruvbox' 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" ### APPEARANCE ###
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
set t_Co=256
set t_ut=
autocmd vimenter * ++nested colorscheme gruvbox

" Set background based on time of day
"if strftime("%H") < 17
"    set background=light
"else
"   set background=dark
"endif

" ### EDITOR ###
" Editor Settings
set number
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set wildmenu
set wildmode=list:longest,full
set mouse=a

" Use jj as ESC
imap jj <Esc>

" ## CoC Bindings
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" gd - go to definition of word under cursor
nmap <leader> gd <Plug>(coc-definition)
nmap <leader> gy <Plug>(coc-type-definition)
" gi - go to implementation
nmap <leader> gi <Plug>(coc-implementation)
" gr - find references
nmap <leader> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Have GoDoc popup in a window, not a new buffer
let g:go_doc_popup_window=1


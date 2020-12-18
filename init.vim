" ### PLUGINS ###
call plug#begin('~/.config/nvim/plugged')
" IDE-Features
Plug 'preservim/nerdtree'
Plug 'andymass/vim-matchup'
Plug 'godlygeek/tabular'
Plug 'w0rp/ale'
" Languages
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
" Aesthetic/Appearance
Plug 'crusoexia/vim-monokai'
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
colorscheme monokai 

" ### EDITOR ###
" Editor Settings
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set wildmenu
set wildmode=list:longest,full
set mouse=a

" Use jj as ESC
imap jj <Esc>


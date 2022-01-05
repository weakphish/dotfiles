return require('packer').startup(function()
    -- IDE-Features
    use 'preservim/nerdtree'
    use 'preservim/tagbar'
    use 'andymass/vim-matchup'
    use 'godlygeek/tabular'
    use 'tpope/vim-fugitive'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    -- Languages
    use 'sheerun/vim-polyglot'
    use 'rust-lang/rust.vim'
    use 'fatih/vim-go'
    -- Aesthetic/Appearance
    use 'sainnhe/gruvbox-material'
    use 'Yggdroot/indentLine'
    use 'nvim-lualine/lualine.nvim'
end)

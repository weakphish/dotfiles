return require('packer').startup(function()
    -- Packer manages itself, lol
    use 'wbthomason/packer.nvim'
    -- IDE-Features
    use 'preservim/nerdtree' -- Filetree
    use 'preservim/tagbar' -- Outline of file
    use 'andymass/vim-matchup'
    use 'godlygeek/tabular' -- Lining up text
    use 'tpope/vim-fugitive' -- Git stuff
    use 'nvim-telescope/telescope.nvim' -- Nice grep interface
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'neovim/nvim-lspconfig' -- LSP configurations
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    -- Languages
    use 'sheerun/vim-polyglot'
    use 'rust-lang/rust.vim'
    use 'fatih/vim-go'
    -- Aesthetic/Appearance
    use 'sainnhe/gruvbox-material'
    use 'Yggdroot/indentLine'
    use 'nvim-lualine/lualine.nvim'
end)

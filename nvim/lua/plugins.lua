return require('packer').startup(function()
    -- Packer manages itself, lol
    use 'wbthomason/packer.nvim'
    -- IDE-Features
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
              'kyazdani42/nvim-web-devicons', -- optional, for file icon
            },
        config = function() require'nvim-tree'.setup {} end
    }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } 
    use {'stevearc/aerial.nvim'}        -- Outline of file
    use 'tpope/vim-fugitive'            -- Git stuff
    use 'nvim-lua/plenary.nvim'         -- Required by Telescope
    use 'mfussenegger/nvim-dap'         -- Debugging adapter
    use 'nvim-telescope/telescope.nvim' -- Nice grep interface
    use 'neovim/nvim-lspconfig'         -- LSP configurations
    use 'alexaandru/nvim-lspupdate'     -- Autoinstall LSP servers
    use 'hrsh7th/nvim-cmp'              -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp'          -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip'      -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip'              -- Snippets plugin
    -- Languages
    use 'sheerun/vim-polyglot'          -- Works for most languages
    use 'rust-lang/rust.vim'            -- More specific stuff for Rust
    use 'fatih/vim-go'                  -- Specific stuff for Go
    -- Aesthetic/Appearance
    use 'sainnhe/gruvbox-material'      -- A refresh on a classic
    use 'sainnhe/sonokai'               -- Monokai Pro, but free
    use 'sainnhe/everforest'            -- I like the color green
    use 'Mofiqul/vscode.nvim'           -- So far, my favorite colorscheme ever
    use 'nvim-lualine/lualine.nvim'     -- Statusbar go brrrr
    use "lukas-reineke/indent-blankline.nvim" -- Indent guides
    use {'stevearc/dressing.nvim'}      -- Make things generally prettier
end)

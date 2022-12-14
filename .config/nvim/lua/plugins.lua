return require('packer').startup(function()
    use 'wbthomason/packer.nvim'                -- Packer manages itself, lol
    use 'lewis6991/impatient.nvim'              -- Improve startup time

    -- IDE-Features
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- Make highlighting based on an AST, no Regex
    use 'tpope/vim-fugitive'                    -- Git inside NeoVim
    use 'nvim-lua/plenary.nvim'                 -- Required by Telescope
    use 'nvim-telescope/telescope.nvim'         -- Nice interface for various menus (mostly grep)
    use {                                       -- And, use telescope for more default stuff
        'nvim-telescope/telescope-ui-select.nvim' 
    } 
    use {                                       -- Nicer installation for LSP servers
    'junnplus/lsp-setup.nvim',
        requires = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        }
    }
    use 'hrsh7th/nvim-cmp'                      -- Autocompletion plugin
    use 'hrsh7th/vim-vsnip'                     -- Dependency for above features
    use 'hrsh7th/cmp-nvim-lsp'                  -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp-signature-help'   -- show function details while typing
    use 'saadparwaiz1/cmp_luasnip'              -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip'                      -- Snippets plugin
    use {                                       -- Pop-up of available commands when working bindings
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {}
      end
    }
    use 'tpope/vim-surround'                   -- TPope can do no wrong

    -- Languages
    use 'sheerun/vim-polyglot'                  -- Works for most languages
    use {'rust-lang/rust.vim', ft='.rs'}        -- More specific stuff for Rust
    use 'simrat39/rust-tools.nvim'              -- ...and even more...
    use 'p00f/clangd_extensions.nvim'           -- clangd extensions for C LSP
    use 'fatih/vim-go'                          -- Specific stuff for Go
    use 'dart-lang/dart-vim-plugin'             -- Dart support

    -- Aesthetic/Appearance
    use 'sainnhe/gruvbox-material'              -- A refresh on a classic
    use 'sainnhe/sonokai'                       -- Monokai Pro, but free
    use 'nvim-lualine/lualine.nvim'             -- Statusbar go brrrr
    use "lukas-reineke/indent-blankline.nvim"   -- Indent guides
    use {                                       -- So I can see who to blame
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }
end)

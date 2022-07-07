return require('packer').startup(function()
    use 'wbthomason/packer.nvim'        -- Packer manages itself, lol
    use 'lewis6991/impatient.nvim'      -- Improve startup time
    -- IDE-Features
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- Make highlighting based on an AST, no Regex
    use {'stevearc/aerial.nvim'}        -- Show outline of file's symbols
    use 'tpope/vim-fugitive'            -- Git inside NeoVim
    use 'nvim-lua/plenary.nvim'         -- Required by Telescope
    use 'nvim-telescope/telescope.nvim' -- Nice interface for various menus (mostly grep)
    use {'nvim-telescope/telescope-ui-select.nvim' } -- And, use telescope for more default stuff
    use {                               -- Wrapper that makes configuring LSP way nicer
        'junnplus/nvim-lsp-setup',
        requires = {
            'neovim/nvim-lspconfig',
            'williamboman/nvim-lsp-installer',
        }
    }
    use 'hrsh7th/nvim-cmp'              -- Autocompletion plugin
    use 'hrsh7th/vim-vsnip'             -- Dependency for above features
    use 'hrsh7th/cmp-nvim-lsp'          -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip'      -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip'              -- Snippets plugin
    use {                               -- Pop-up of available commands when working bindings
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {}
      end
    }
    -- Languages
    use 'sheerun/vim-polyglot'          -- Works for most languages
    use {'rust-lang/rust.vim', ft='.rs'}-- More specific stuff for Rust
    use 'simrat39/rust-tools.nvim'      -- ...and even more...
    use 'p00f/clangd_extensions.nvim'   -- clangd extensions for C LSP
    use 'fatih/vim-go'                  -- Specific stuff for Go
    use 'dart-lang/dart-vim-plugin'     -- Dart support
    -- Vim Wiki
    use 'vimwiki/vimwiki'               -- ...because I refuse to use Emacs
    use ({                              -- ... and I like seeing my Markdown, sometimes
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    -- Aesthetic/Appearance
    use {                               -- File tree
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly'                   -- optional, updated every week. (see issue #1193)
    }
    use {                               -- Doom Emacs had _some_ good ideas ;)
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    }
    use 'sainnhe/gruvbox-material'      -- A refresh on a classic
    use 'sainnhe/sonokai'               -- Monokai Pro, but free
    use 'nvim-lualine/lualine.nvim'     -- Statusbar go brrrr
    use "lukas-reineke/indent-blankline.nvim" -- Indent guides
    use {'stevearc/dressing.nvim'}      -- Make things generally prettier
    use 'airblade/vim-gitgutter'        -- Git gutter indicators
end)

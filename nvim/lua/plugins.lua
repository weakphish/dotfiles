return require('packer').startup(function()
    use 'wbthomason/packer.nvim'        -- Packer manages itself, lol
    -- IDE-Features
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- Make highlighting based on an AST, no Regex
    use {'stevearc/aerial.nvim'}        -- Show outline of file's symbols
    use 'tpope/vim-fugitive'            -- Git inside NeoVim
    use 'nvim-lua/plenary.nvim'         -- Required by Telescope
    use 'nvim-telescope/telescope.nvim' -- Nice interface for various menus (mostly grep)
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
    use 'sainnhe/gruvbox-material'      -- A refresh on a classic
    use 'sainnhe/sonokai'               -- Monokai Pro, but free
    use 'sainnhe/everforest'            -- I like the color green
    use 'Mofiqul/vscode.nvim'           -- So far, my favorite colorscheme ever
    use 'nvim-lualine/lualine.nvim'     -- Statusbar go brrrr
    use "lukas-reineke/indent-blankline.nvim" -- Indent guides
    use {'stevearc/dressing.nvim'}      -- Make things generally prettier
end)

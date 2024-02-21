return {
  -- Linter for Jenkinsfiles
  {
    'ckipp01/nvim-jenkinsfile-linter',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- Extra Golang Goodies
  {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('go').setup()
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },

  -- NOTE: MARKDOWN
  -- Markdown preview with Glow
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },

  {
    -- Zen mode for writing markdown
    'folke/zen-mode.nvim',
    config = function()
      require('zen-mode').setup {}
    end,
  },

  {
    -- Dim inactive portions of code
    'folke/twilight.nvim',
    config = function()
      require('twilight').setup {}
    end,
  },

  {
    -- Use wiki links in markdown
    'jakewvincent/mkdnflow.nvim',
    config = function()
      require('mkdnflow').setup()
    end,
  },
}

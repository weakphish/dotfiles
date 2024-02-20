if vim.g.vscode then
  -- VSCode extension, default to vanilla neovim behavior
else
  -- My general neovim settings
  require 'settings'

  -- Bootstrap Lazy (package manager)
  local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      lazypath,
    }
  end
  vim.opt.rtp:prepend(lazypath)

  -- Import my modules
  require('lazy').setup 'plugins'
end

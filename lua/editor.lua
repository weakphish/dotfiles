-- Ruler at 100
vim.o.cc = '100'

-- Numbering
vim.o.relativenumber = true
vim.o.number = true

-- Wild menu
vim.o.wildmenu = true

-- Tabs
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Misc
vim.o.mouse = 'a'
vim.o.autoindent = true

-- NvimTree
    -- following options are the default
    -- each of these are documented in `:help nvim-tree.OPTION_NAME`
require('nvim-tree').setup({
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {
        { key = { 'v' }, cb = ':lua require"nvim-tree".on_keypress("vsplit")<CR>' },
        { key = { 's' }, cb = ':lua require"nvim-tree".on_keypress("split")<CR>' },
        { key = { 't' }, cb = ':lua require"nvim-tree".on_keypress("tabnew")<CR>' },
      }
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
})

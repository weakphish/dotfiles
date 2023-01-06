-- Ruler at 100
vim.o.cc = '100'

-- Make command input only appear in usage
vim.o.ch = 0

-- Numbering
vim.o.relativenumber = true
vim.o.number = true

-- Still not really sure what this is 
vim.opt.termguicolors = true

-- Sonokai preferences
vim.g.sonokai_better_performance = 1
vim.g.sonokai_style = "shusia"

-- Set colorscheme
vim.cmd [[
  colorscheme darkplus
]]

-- Add extra Go highlights
vim.g.go_highlight_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_build_constraints = 1
vim.g.go_highlight_generate_tags = 1
vim.g.go_doc_popup_window=1


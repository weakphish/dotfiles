-- Set mapleader
vim.g.mapleader = " "

-- Telescope
vim.api.nvim_set_keymap(
    "n",
    "<leader>ff",
    ":Telescope find_files<cr>",
    { noremap = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>fg",
    ":Telescope live_grep<cr>",
    { noremap = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>fb",
    ":Telescope buffers<cr>",
    { noremap = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>fh",
    ":Telescope help_tags<cr>",
    { noremap = true}
)

-- Aerial
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>tb', '<cmd>AerialToggle!<CR>', {})
vim.api.nvim_buf_set_keymap(bufnr, 'n', '{', '<cmd>AerialPrev<CR>', {})
vim.api.nvim_buf_set_keymap(bufnr, 'n', '}', '<cmd>AerialNext<CR>', {})
vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<cmd>AerialPrevUp<CR>', {})
vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<cmd>AerialNextUp<CR>', {})

-- NVIMTree
vim.api.nvim_set_keymap(
    "n",
    "<leader>nt",
    ":NvimTreeToggle<cr>",
    { noremap = true}
)


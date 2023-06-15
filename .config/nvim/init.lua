-- ordinary Neovim
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Setting general options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- [[ Basic Keymaps ]]
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
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

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  -- NOTE: === LSP / COMPETION ===
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {}, tag = 'legacy' },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
    config = function()
      --  This function gets run when an LSP connects to a particular buffer.
      local on_attach = function(_, bufnr)
        -- Create a command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
          vim.lsp.buf.format()
        end, { desc = 'Format current buffer with LSP' })
      end

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --  Add any additional override configuration in the following tables. They will be passed to
      --  the `settings` field of the server config. You must look up that documentation yourself.
      local servers = {
        clangd = {},
        gopls = {},
        pylsp = {
          pylsp = {
            plugins = {
              pydocstyle = {
                enabled = true,
              },
              rope_autoimport = {
                enabled = true,
              },
              rope_completion = {
                enabled = true,
                eager = true,
              },
            },
          },
        },
        rust_analyzer = {},
        tsserver = {},
        html = {},
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
        eslint = {
          on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = bufnr,
              command = 'EslintFixAll',
            })
          end,
        },
      }

      -- Setup neovim lua configuration
      require('neodev').setup()

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      -- Setup mason so it can manage external tooling
      require('mason').setup()

      -- Ensure the servers above are installed
      local mason_lspconfig = require 'mason-lspconfig'

      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }

      mason_lspconfig.setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
          }
        end,
      }

      -- nvim-cmp setup
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
      }

      -- Null LS setup (part of LSP block)
      local null_ls = require 'null-ls'

      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.autopep8,
          null_ls.builtins.diagnostics.eslint,
        },
      }

      vim.keymap.set({ 'n' }, 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
      vim.keymap.set({ 'n' }, '<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature Documentation' })
    end,
  },

  -- Let non-lsp stuff hook into LSP client (formatting, mostly)
  { 'jose-elias-alvarez/null-ls.nvim' },

  {
    -- Autocompletion Engine
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },

  {
    -- Autopair
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  },

  {
    -- Auto tag closing
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },

  -- NOTE: === VISUAL / AESTHETIC ---

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Make things generally prettier
  'stevearc/dressing.nvim',

  {
    -- Neotree - file tree browser
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
  },

  {
    -- Document symbols
    'stevearc/aerial.nvim',
    config = function()
      require('aerial').setup()
    end,
  },

  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  },

  {
    -- Pretty colors
    -- 'navarasu/onedark.nvim',
    'ellisonleao/gruvbox.nvim',
    -- 'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      -- require('onedark').load()
      vim.cmd.colorscheme 'gruvbox'
      -- require('kanagawa').load 'wave'
    end,
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'gruvbox',
        component_separators = '|',
        section_separators = '',
      },
    },
    config = function()
      require('lualine').setup { sections = { lualine_x = { 'aerial' } } }
    end,
  },

  {
    -- Tabs, but less bad and more good
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup {}
    end,
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },

  -- NOTE: === LANGUAGE SUPPORT ===
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

  -- NOTE: === MARKDOWN ===
  -- Markdown preview with Glow
  { 'ellisonleao/glow.nvim', config = true, cmd = 'Glow' },

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

  -- NOTE: === TOOLS ===

  -- Git Porcelain
  {
    'kdheepak/lazygit.nvim',
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },

  {
    -- "gc" to comment visual regions/lines
    'numToStr/Comment.nvim',
    opts = {
      toggler = {
        line = '<leader>cc',
        block = '<leader>cb',
      },
    },
  },
  {
    -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'debugloop/telescope-undo.nvim',
    },
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  {
    -- DAP UI using Telescope
    'nvim-telescope/telescope-dap.nvim',
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
        },
      }

      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')
      -- Enable telescope dap if installed
      pcall(require('telescope').load_extension, 'dap')
      -- Enable telescope undo
      pcall(require('telescope').load_extension, 'undo')

      -- [[ Configure Treesitter ]]
      -- See `:help nvim-treesitter`
      require('nvim-treesitter.configs').setup {
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vim' },

        -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
        auto_install = false,

        highlight = { enable = true },
        indent = { enable = true, disable = { 'python' } },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<M-space>',
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>A'] = '@parameter.inner',
            },
          },
        },
      }
    end,
  },
  {
    -- Highlight / search TODO
    'folke/todo-comments.nvim',
    config = function()
      require('todo-comments').setup {}
    end,
  },

  {
    -- Debugging??? In _MY_ Neovim??
    'mfussenegger/nvim-dap',
    dependencies = {
      -- Creates a beautiful debugger UI
      'rcarriga/nvim-dap-ui',

      -- Installs the debug adapters for you
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',

      -- Add your own debuggers here
      'leoluz/nvim-dap-go',
      'mfussenegger/nvim-dap-python',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'
      require('dap-go').setup()
      require('dap-python').setup '~/.virtualenvs/debugpy/bin/python'

      require('mason-nvim-dap').setup {
        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_setup = true,

        -- You'll need to check that you have the required things installed
        -- online, please don't ask me how to install them :)
        ensure_installed = {
          -- Update this to ensure that you have the debuggers for the langs you want
          'delve',
          'debugpy',
        },
      }

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      require('mason-nvim-dap').setup()

      -- Dap UI setup
      -- For more information, see |:help nvim-dap-ui|
      dapui.setup {
        -- Set icons to characters that are more likely to work in every terminal.
        --    Feel free to remove or use ones that you like more! :)
        --    Don't feel like these are good choices.
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        controls = {
          icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
          },
        },
      }

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close
    end,
  },

  -- NOTE: === BINDINGS ===
  {
    -- Show key options when using shortcuts
    'folke/which-key.nvim',
    opts = {},
    config = function()
      local wk = require 'which-key'
      local dap = require 'dap'
      -- As an example, we will create the following mappings:
      wk.register({
        b = {
          name = 'Buffer',
          b = { require('telescope.builtin').buffers, 'Find Buffer' },
          d = { '<cmd>bd<CR>', 'Delete Buffer' },
          n = { '<cmd>bn<CR>', 'Next Buffer' },
          o = { '<cmd>BufferLinePick<CR>', 'Pick Buffer From Line' },
          p = { '<cmd>bp<CR>', 'Prev Buffer' },
        },
        c = {
          name = 'Code',
          a = { vim.lsp.buf.code_action, 'Code Action' },
          d = { vim.lsp.buf.definition, 'Go To Definition' },
          D = { vim.lsp.buf.declaration, 'Go to Declaration' },
          i = { vim.lsp.buf.implementation, 'Go to Implementation' },
          f = { '<cmd>Format<CR>', 'Format' }, -- We defined this function above
          r = { vim.lsp.buf.rename, 'Code Rename' },
          R = { require('telescope.builtin').lsp_references, 'Go to References' },
        },
        d = {
          name = 'Debug',
          b = { dap.toggle_breakpoint, 'Toggle breakpoint' },
          B = {
            function()
              dap.set_breakpoint(vim.fn.input '[B]reakpoint condition: ')
            end,
            'Breakpoint condition',
          },
          c = { dap.continue, 'Continue' },
          i = { dap.step_into, 'Step into' },
          o = { dap.step_over, 'Step over' },
          u = { dap.step_out, 'Step up (out)' },
        },
        f = {
          name = 'File',
          f = { '<cmd>Telescope find_files<cr>', 'Find File' },
          r = { '<cmd>Telescope oldfiles<cr>', 'Open Recent File' },
        },
        g = {
          name = 'Git',
          g = { '<cmd>LazyGit<CR>', 'LazyGit' },
          b = { '<cmd>Gitsigns toggle_current_line_blame<CR>', 'Current Line Blame' },
        },
        m = {
          name = 'Markdown',
          c = { '<cmd>Glow!<CR>', 'Close Preview' },
          f = { '<cmd>ZenMode<CR>', 'Focus' },
          m = { '<cmd>Glow<CR>', 'Open Preview' },
          t = { '<cmd>Twilight<CR>', 'Toggle Dim Inactive Code' },
        },
        s = {
          name = 'Search',
          b = { require('telescope.builtin').current_buffer_fuzzy_find, 'Fuzzily search current buffer' },
          d = { require('telescope.builtin').diagnostics, 'Search Diagnostics' },
          g = { require('telescope.builtin').live_grep, 'Search with Grep' },
          h = { require('telescope.builtin').help_tags, 'Search Help' },
          s = { require('telescope.builtin').lsp_document_symbols, 'Workspace Document Symbols' },
          t = { '<cmd>TodoTelescope<CR>', 'Search TODO' },
          u = { '<cmd>Telescope undo<CR>', 'Search Undo' },
          w = { require('telescope.builtin').grep_string, 'Search current Word' },
        },
        t = {
          name = 'Toggle',
          a = { '<cmd>AerialToggle<CR>', 'Aerial' },
          n = { '<cmd>NeoTreeShowToggle<CR>', 'NeoTree' },
        },
        w = {
          name = 'Workspace',
          d = { require('telescope.builtin').diagnostics, 'Workspace Diagnostics' },
          s = { require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols' },
        },
      }, { prefix = '<leader>' })
    end,
  },
}, {})

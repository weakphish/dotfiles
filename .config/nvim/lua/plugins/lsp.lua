return {
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    opts = {
      inlay_hints = { enabled = true },
    },
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Use non-LSP as an LSP (linters, etc)
      'nvimtools/none-ls.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {}, tag = 'legacy' },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
    config = function()
      --  This function gets run when an LSP connects to a particular buffer.
      local on_attach = function(client, bufnr)
        -- Show line diagnostics in hover window
        -- Source: https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#show-line-diagnostics-automatically-in-hover-window
        vim.o.updatetime = 250
        vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
        vim.api.nvim_create_autocmd('CursorHold', {
          buffer = bufnr,
          callback = function()
            local opts = {
              focusable = false,
              close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
              border = 'rounded',
              source = 'always',
              prefix = ' ',
              scope = 'cursor',
            }
            vim.diagnostic.open_float(nil, opts)
          end,
        })
      end

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --  Add any additional override configuration in the following tables. They will be passed to
      --  the `settings` field of the server config. You must look up that documentation yourself.
      local servers = {
        clangd = {},
        gopls = {},
        pyright = {},
        ruff_lsp = {
          organizeImports = false,
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
      }

      vim.keymap.set({ 'n' }, 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
      vim.keymap.set({ 'n' }, '<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature Documentation' })

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
        automatic_installation = true,
      }

      mason_lspconfig.setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
          }
        end,
        ['gopls'] = function()
          -- Add in specific instructions to integrate go.nvim with mason
          require('go').setup {
            lsp_cfg = false,
            -- other setups...
          }
          local cfg = require('go.lsp').config() -- config() return the go.nvim gopls setup
          require('lspconfig').gopls.setup(cfg)
        end,
        ['ruff_lsp'] = function()
          -- Disable Ruff's hover in favor of Pyright
          local on_attach = function(client, bufnr)
            client.server_capabilities.hoverProvider = false
          end
          require('lspconfig').ruff_lsp.setup {
            on_attach = on_attach,
          }
        end,
      }

      -- Null / None Setup
      local null_ls = require 'null-ls'

      null_ls.setup {
        sources = {
          null_ls.builtins.diagnostics.eslint,
          -- null_ls.builtins.completion.spell,
        },
      }

      -- nvim-cmp setup
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      luasnip.config.setup {}
      require('cmp_git').setup()

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
          { name = 'path' },
          { name = 'git' },
        },
      }
    end,
  },

  {
    -- Autocompletion Engine
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip', 'hrsh7th/cmp-path', 'petertriho/cmp-git' },
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

  {
    -- Incremental renaming of stuff
    'smjonas/inc-rename.nvim',
    config = function()
      require('inc_rename').setup()
      vim.keymap.set('n', '<leader>crn', ':IncRename ') -- I can't figure out how to make which-key work with IncRename
    end,
  },

  {
    -- Formatting
    'stevearc/conform.nvim',
    opts = {},
    config = function()
      require('conform').setup {
        formatters_by_ft = {
          lua = { 'stylua' },
          -- Conform will run multiple formatters sequentially
          python = { 'isort', 'black' },
          -- Use a sub-list to run only the first available formatter
          javascript = { { 'prettierd', 'prettier' } },
        },
      }
    end,
  },

  {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
  },
}

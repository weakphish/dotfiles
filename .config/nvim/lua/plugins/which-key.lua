return {
  -- Show key options when using shortcuts
  'folke/which-key.nvim',
  opts = {},
  config = function()
    local wk = require 'which-key'
    local dap = require 'dap'

    -- Normal mode
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
        f = { require('conform').format, 'Format Buffer' },
        r = {
          r = { vim.lsp.buf.rename, 'Code Rename' },
        },
        t = { vim.lsp.buf.type_definition, 'Go To Type Definition' },
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
        a = { '<cmd>Telescope adjacent<CR>', 'Adjacent Files' },
        f = { '<cmd>Telescope find_files hidden=true<cr>', 'Find File' },
        r = { '<cmd>Telescope oldfiles<cr>', 'Open Recent File' },
      },
      g = {
        name = 'Git',
        g = { '<cmd>LazyGit<CR>', 'LazyGit' },
        b = { '<cmd>Gitsigns toggle_current_line_blame<CR>', 'Current Line Blame' },
      },
      m = {
        name = 'Markdown',
        c = { '<cmd>MarkdownPreviewStop<CR>', 'Close Preview' },
        f = { '<cmd>ZenMode<CR>', 'Focus' },
        m = { '<cmd>MarkdownPreview<CR>', 'Open Preview' },
        t = { '<cmd>Twilight<CR>', 'Toggle Dim Inactive Code' },
      },
      n = {
        name = 'Neotest',
        r = {
          name = 'Run',
          f = { '<cmd>Neotest run file<CR>', 'Run File' },
        },
        s = { '<cmd>Neotest summary<CR>', 'Summary' },
        o = { '<cmd>Neotest output<CR>', 'Output' },
      },
      s = {
        name = 'Search',
        b = { require('telescope.builtin').current_buffer_fuzzy_find, 'Fuzzily search current buffer' },
        d = { require('telescope.builtin').diagnostics, 'Search Diagnostics' },
        g = { require('telescope.builtin').live_grep, 'Search with Grep' },
        h = { require('telescope.builtin').help_tags, 'Search Help' },
        j = { require('telescope.builtin').jumplist, 'Search Jumplist' },
        r = { require('telescope.builtin').lsp_references, 'Search References' },
        s = { require('telescope.builtin').lsp_document_symbols, 'Workspace Document Symbols' },
        t = { '<cmd>TodoTelescope<CR>', 'Search TODO' },
        u = { '<cmd>Telescope undo<CR>', 'Search Undo' },
        w = { require('telescope.builtin').grep_string, 'Search current Word' },
      },
      t = {
        name = 'Toggle',
        a = { '<cmd>AerialToggle<CR>', 'Aerial' },
        b = { require('barbecue.ui').toggle, 'Barbecue (show code context winbar)' },
        d = { '<cmd>TroubleToggle<CR>', 'Trouble (Diagnostics)' },
        f = { '<cmd>:ToggleTerm direction=float<CR>', 'Toggle Floating Terminal' },
        n = { '<cmd>Neotree toggle<CR>', 'NeoTree' },
        t = { '<cmd>:ToggleTerm size=30<CR>', 'Toggle Terminal' },
      },
      w = {
        name = 'Workspace',
        d = { require('telescope.builtin').diagnostics, 'Workspace Diagnostics' },
        s = { require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols' },
      },
    }, { prefix = '<leader>' })

    -- Visual mode bindings
    wk.register({
      -- Re-register the Leap bindings for visual mode, since adding custom normal bindings
      -- will remove the default visual mode bindings.
      x = { '<Plug>(leap-forward-till)', 'Leap Forward Till' },
      X = { '<Plug>(leap-backward-till)', 'Leap Backward Till' },
    }, { mode = 'v' })
  end,
}

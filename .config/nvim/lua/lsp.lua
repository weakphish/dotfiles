local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()


require'lspconfig'.gopls.setup{
    flags = lsp_flags,
    capabilities = capabilities,
}

require('lspconfig')['pyright'].setup{
    flags = lsp_flags,
    capabilities = capabilities,
}

require('lspconfig')['tsserver'].setup{
    flags = lsp_flags,
    capabilities = capabilities,
}

require('lspconfig')['rust_analyzer'].setup{
    flags = lsp_flags,
    capabilities = capabilities,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}

local capabilities = require('blink.cmp').get_lsp_capabilities()

local on_attach = function(_, bufnr)
  keyset('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
  keyset('n', '<leader>df', vim.diagnostic.goto_next, { buffer = bufnr })
  keyset('n', '<leader>db', vim.diagnostic.goto_prev, { buffer = bufnr })
  -- LSP navigation
  keyset('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
  keyset('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr })
  keyset('n', 'gr', vim.lsp.buf.references, { buffer = bufnr })
  keyset('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr })

  -- LSP actions
  keyset('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr })
  keyset('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
end

local servers = { 'pyright', 'rust_analyzer', 'nixd', 'gopls', 'ols' }

for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    capabilities = capabilities,
    on_attach = on_attach,
  })
  vim.lsp.enable(lsp)
end


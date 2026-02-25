local capabilities = require('blink.cmp').get_lsp_capabilities()

local on_attach = function(_, bufnr)
  keyset('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
  keyset('n', '<leader>df', vim.diagnostic.goto_next, { buffer = bufnr })
  keyset('n', '<leader>db', vim.diagnostic.goto_prev, { buffer = bufnr })
end

local servers = { 'pyright', 'rust_analyzer', 'nixd', 'gopls' }

for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    capabilities = capabilities,
    on_attach = on_attach,
  })
  vim.lsp.enable(lsp)
end


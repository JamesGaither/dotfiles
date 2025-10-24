-- LSP Magic --
--------------------------
local lspconfig = require'lspconfig'
local servers = {'pyright', 'rust_analyzer', 'lua_ls', 'nixd', 'gopls'}
local capabilities = require('blink.cmp').get_lsp_capabilities()
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
  capabilities = capabilities,
  on_attach = function()
  keyset('n', 'K', vim.lsp.buf.hover, {buffer = 0})
  -- keyset('n', 'gd', vim.lsp.buf.definition, {buffer = 0})
  keyset('n', '<leader>df', vim.diagnostic.goto_next, {buffer = 0})
  keyset('n', '<leader>db', vim.diagnostic.goto_prev, {buffer = 0})
  end,
  }
end

-- Setup lua_ls to recognize vim as global config 
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          'vim'
        },
      },
    },
  },
}

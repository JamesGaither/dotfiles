-- LSP Magic --
--------------------------
local lspconfig = require'lspconfig'
local servers = {'pyright', 'rust_analyzer'}
local capabilities = require('cmp_nvim_lsp').default_capabilities()
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
  capabilities = capabilities,
  on_attach = function()
  keyset('n', 'K', vim.lsp.buf.hover, {buffer = 0})
  keyset('n', 'gd', vim.lsp.buf.definition, {buffer = 0}) 
  keyset('n', '<leader>df', vim.diagnostic.goto_next, {buffer = 0})
  keyset('n', '<leader>db', vim.diagnostic.goto_prev, {buffer = 0})
  end,
  }
end

-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.scroll_docs(-4),
    ['<C-j>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})


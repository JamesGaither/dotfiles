-- Set some general options
vim.o.hlsearch = false
vim.wo.number = true
vim.o.breakindent = true
vim.o.undofile = true
vim.o.spell = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'
vim.wo.relativenumber = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
-- Set colorscheme
require('onenord').setup()
vim.o.termguicolors = true

vim.o.colorcolumn = '80'


-- Keymaps --
-------------
-- See `:help vim.keymap.set()`

local km = vim.keymap
local keyset = vim.keymap.set
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
keyset("n", "<leader>pv", vim.cmd.Ex)
-- Move selection up and down with 'J' and 'K'
keyset("v", "J", ":m '>+1<CR>gv=gv")
keyset("v", "K", ":m '<-2<CR>gv=gv")

keyset("n", "<C-d>", "<C-d>zz")
keyset("n", "<C-u>", "<C-u>zz")
keyset("n", "n", "nzzzv")
keyset("n", "N", "Nzzzv")
keyset("i", "jk", "<ESC>")

-- yank to system clipboard with leader y
keyset("n", "<leader>y", "\"+y")
keyset("v", "<leader>y", "\"+y")
keyset("n", "<leader>Y", "\"+Y")

-- undotree remaps
keyset("n", "<leader>u", vim.cmd.UndotreeToggle)
-- Telescope remaps
local builtin = require('telescope.builtin')
keyset('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
keyset('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
--keyset('n', '<leader>/', function()
keyset('n', '<C-p>', builtin.git_files, {})
keyset('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
keyset('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
keyset('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
keyset('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
keyset('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })


-- Plugin Configurations --
--------------------------

-- [[Gitsigns]]
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- [[Telescope]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
}


-- [[Treesitter]]
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}

-- [[Filetype Settings]]
vim.filetype.add({
  filename = {
    ['Jenkinsfile'] = 'groovy',
  },
  extension = {
    ['jenkinsfile'] = 'groovy'
  }
})
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

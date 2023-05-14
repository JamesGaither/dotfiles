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
vim.o.termguicolors = true
vim.cmd[[colorscheme onenord]]
vim.o.colorcolumn = '80'


-- Keymaps --
-------------
-- See `:help vim.keymap.set()`

local km = vim.keymap
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
km.set("n", "<leader>pv", vim.cmd.Ex)
-- Move selection up and down with 'J' and 'K'
km.set("v", "J", ":m '>+1<CR>gv=gv")
km.set("v", "K", ":m '<-2<CR>gv=gv")

km.set("n", "<C-d>", "<C-d>zz")
km.set("n", "<C-u>", "<C-u>zz")
km.set("n", "n", "nzzzv")
km.set("n", "N", "Nzzzv")
km.set("i", "jk", "<ESC>")

-- yank to system clipboard with leader y
km.set("n", "<leader>y", "\"+y")
km.set("v", "<leader>y", "\"+y")
km.set("n", "<leader>Y", "\"+Y")

-- undotree remaps
km.set("n", "<leader>u", vim.cmd.UndotreeToggle)
-- Telescope remaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
--vim.keymap.set('n', '<leader>/', function()
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })


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
    ['Jenkinsfile'] = 'groovy'
  }
})
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

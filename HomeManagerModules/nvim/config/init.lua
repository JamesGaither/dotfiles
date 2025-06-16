-- General Settings --
----------------------
vim.o.hlsearch = false
vim.wo.number = true
vim.o.breakindent = true
vim.o.undofile = true
vim.o.spell = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'
vim.wo.relativenumber = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
-- Set colorscheme
require('onenord').setup()
vim.o.termguicolors = true
vim.o.colorcolumn = '80'
vim.o.clipboard = "unnamedplus"
-- Keymaps --
-------------
keyset = vim.keymap.set
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- yank to system clipboard with leader y
keyset("n", "<leader>y", "\"+y")
keyset("v", "<leader>y", "\"+y")
keyset("n", "<leader>Y", "\"+Y")

-- Move selection up and down with 'J' and 'K'
keyset("v", "J", ":m '>+1<CR>gv=gv")
keyset("v", "K", ":m '<-2<CR>gv=gv")

-- Other remaps
keyset("n", "<leader>pv", vim.cmd.Ex)
keyset("n", "<C-d>", "<C-d>zz")
keyset("n", "<C-u>", "<C-u>zz")
keyset("n", "n", "nzzzv")
keyset("n", "N", "Nzzzv")
keyset("i", "jk", "<ESC>")
keyset("n", "-", "<cmd>Oil<CR>")
-- File Type Settings --
-----------------------
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

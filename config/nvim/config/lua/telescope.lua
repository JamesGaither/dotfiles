-- [[Telescope]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
}
-- Telescope remaps
local builtin = require('telescope.builtin')
keyset('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
keyset('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
keyset('n', '<C-p>', builtin.git_files, {})
keyset('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
keyset('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
keyset('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
keyset('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
keyset('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })


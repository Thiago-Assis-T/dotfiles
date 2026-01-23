-- Telescope Keybindings:
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Telescope Diagnostics' })


-- Formating keybind:
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = 'lsp file format' })

-- Trouble List:
vim.keymap.set('n', '<leader>cd', ':Trouble diagnostics toggle <CR>', { desc = 'LSP File Format' })

-- Code Actions:
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP Code Actions' })


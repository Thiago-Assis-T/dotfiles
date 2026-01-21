vim.pack.add({
    'https://github.com/nvim-treesitter/nvim-treesitter'
})
require 'nvim-treesitter'.install("all")
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'lua', 'php', 'dart', 'css', 'html' },
    callback = function() vim.treesitter.start() end,
})

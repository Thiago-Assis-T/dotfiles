vim.pack.add({
    { src = 'https://github.com/folke/todo-comments.nvim' },
    { src = 'https://github.com/folke/trouble.nvim' },
    { src = 'https://github.com/j-hui/fidget.nvim' },
    { src = 'https://github.com/lewis6991/gitsigns.nvim' },
})
require('todo-comments').setup({})
require('trouble').setup({})
require("fidget").setup({})
require('gitsigns').setup({})

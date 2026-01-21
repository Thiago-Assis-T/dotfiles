vim.pack.add({
    { src = 'https://github.com/folke/todo-comments.nvim' },
    { src = 'https://github.com/folke/trouble.nvim' },
})
require('todo-comments').setup({})
require('trouble').setup({})

vim.pack.add({
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/stevearc/dressing.nvim' },
    { src = 'https://github.com/nvim-flutter/flutter-tools.nvim' },
})
require("flutter-tools").setup({})
